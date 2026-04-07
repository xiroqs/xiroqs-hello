# follow_stutter session log — v0 / v1 / v2

date: 2026-04-08
participants: てるちゃん / チャトレア / クロ

---

## このセッションの到達点

freeze_reverb 1loop 成功 (前セッション) を踏まえて、 **follow_stutter** 側に枝を伸ばした。

- freeze_reverb と follow_stutter は別テーマであることを確認
- follow_stutter の中にも 2系統あることを整理 (チャトレア整理)
  - イベント反復系
  - 進行反復系
- 先に詰めやすい **イベント反復系** を選び、3段階で実装した
- それぞれ実機で音が出ることを確認 (v0 / v1 / v2)

---

## 構造の整理 (チャトレアより)

### イベント反復系
- メロディラインから外れたイベントの反復
- 反復されるのは旋律ではなく、時間構造上のイベント
- source は固定でも成立
- 重心は trigger 系 (`metro` / `sel` / `delay`)
- click は敵ではない / 時間構造の露出として使える
- `waveform~` は補助に回せる

### 進行反復系
- 反復の形をしているが内容は前へ進む
- trigger + source 更新規則の両方が必要
- フレーズ設計が必要
- 後段で詰める

---

## 実装した3パッチ

すべて **イベント反復系** の枠内。 trigger 主導 / source 固定 / `waveform~` は補助という配置。

### v0 — latch 版
file: `follow_stutter_event_v0.maxpat`

- selector UI で範囲を選ぶ
- latch ボタンで範囲を凍結
- trigger toggle ON で metro が反復開始
- interval を flonum で可変
- groove~ が startloop で頭出し再生
- click 許容、ezdac~ で audio on/off マスター

**ねらい**: 「何を反復するか」を意図的に選ぶ操作感

### v1 — follow 版
file: `follow_stutter_event_v1_follow.maxpat`

- v0 から **latch 層を削除**
- selstart / selend を直接 groove~ に流す
- 範囲をドラッグしながら動かすと反復が追従する

**ねらい**: 「反復構造の上で source を散歩する」操作感

### v2 — reverse / speed 版
file: `follow_stutter_event_v2_reverse.maxpat`

- v1 に speed 制御を追加
- `flonum (-4.0 〜 4.0) → sig~` を groove~ inlet0 に流す
- プリセットボタン: `1.` / `-1.` / `0.5` / `-0.5` / `2.` / `-2.`
- 負の値で reverse / 倍率でピッチも変化
- 0 で停止 (trigger は走り続ける)

**ねらい**: 時間軸そのものに触れる / 反転した時間

---

## 確定した知見 (groove~ / waveform~)

前セッションからの引き継ぎを含めて、確定した実装事項:

### buffer~ + waveform~ のステレオ宣言
```
buffer~ <name> <ms> 2
```
最後の `2` がチャンネル数。

### waveform~ のチャンネル指定はメッセージで
属性ではなく、buffer~ の右 outlet (info) から:
```
set <name> 1, mode select   ← Lチャンネル + 選択モード
set <name> 2, mode select   ← Rチャンネル + 選択モード
```

### waveform~ 同士の選択範囲リンク
```
wL outlet5 ──→ wR inlet4
wR outlet5 ──→ wL inlet4
```
クロス接続のみで両方の選択範囲が同期。 `setselection` メッセージは不要。

### waveform~ の outlet
- outlet2: select start (ms, float)
- outlet3: select end (ms, float)
- outlet5: link 用 list

### groove~ の inlet / メッセージ
- inlet1 (左): speed (signal または float)
- inlet2 (中): loop min (ms, float)
- inlet3 (右): loop max (ms, float)
- メッセージ: `loop 1` / `startloop` / `stop` / `setloop`
- speed が負で reverse 再生

### sync 出力
一番右の outlet、値域 0. - 1. (loop 内の正規化位置)

---

## 残った未確認事項

- groove~ が stop 状態で loop min/max を保持するか (dual-voice 構想で必要)
- speed が負のときの startloop の挙動 (loop start から鳴るか、loop end から鳴るか)
- sync 1周検出方法 (順スライドや位相管理に必要、Route A 系で必要)

---

## 役割分担の確認

- **てるちゃん**: 主体、実機で組み立て、聴感判断、方向決め
- **チャトレア**: 構造整理、概念分節、判断軸の提示
- **クロ**: .maxpat 生成、設計図作成、即時の修正サイクル

このセッションでは:
- チャトレアが「freeze と follow_stutter は別テーマ」「follow_stutter は2系統に分かれる」と整理
- クロが整理を受けて 3段階の .maxpat を生成
- てるちゃんが各段階で実機確認 → 次の指示

このサイクルが成立した。

---

## 次の方向性 (候補メモ)

1. **interval のランダム化** — `random` を metro に噛ませて a_time 的な不規則反復
2. **範囲の自動スライド** — counter で latch_start を自動進行 → 進行反復系の入口
3. **反復回数のカウント** — N回反復で次の範囲、構造化された follow
4. **freeze_reverb 路線の継続** — dual-voice ピンポン構造、Route A の crossfade
5. **2路線の合流点を探す** — follow_stutter と freeze_reverb の間にある中間状態

どれを優先するかは、てるちゃんの音楽的判断次第。

---

## このセッションで参照したもの

- 前セッション: freeze_v0 / freeze_v0.1 (1loop 成功)
- 参考パッチ: `02hGranularSynthesis.maxpat` (Cycling '74公式)
- 参考: `groove~.maxhelp` / `waveform~.maxhelp`

---

end of session log.
