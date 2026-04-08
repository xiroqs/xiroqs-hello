# follow_stutter v4 — actual patch blueprint (rev2)

チャトレアの blueprint_ans を反映した修正版。
変更点:

1. latch_start は `[f current_start]` の **右inlet** に保存（純粋リセット）
1. loop_min / loop_max への即反映は **別経路**で行う
1. 折り返し処理は `[expr]` ではなく `[if $f1 > $f2 then $f3 else $f1]` を使用
1. groove~ の inlet 表記を left / middle / right に統一

-----

## ① selector UI  (v3 と同じ / 簡略表示)

```
[buffer~ stutter_src_v4 30000 2]
        |
        +-- [waveform~ wL]  (set stutter_src_v4 1, mode select)
        |        |  outlet5/inlet4 でクロスリンク
        +-- [waveform~ wR]  (set stutter_src_v4 2, mode select)
                 |
                 +-- outlet2 → [send selstart_v4]
                 +-- outlet3 → [send selend_v4]
```

-----

## ② latch layer  (latch時の即反映ルートを追加)

```
[receive selstart_v4]                [receive selend_v4]
       |                                    |
       ↓ (右inletへ)                        ↓ (右inletへ)
      [f]                                  [f]
       |                                    |
       ↓                                    ↓
[send latch_start]                  [send latch_end]


              [button]   ← latch
                 |
                 ↓
              [t b b]
               右(先) 左(後)
               |       |
               |       └→ 右の f の左inletへ
               └→ 左の f の左inletへ
```

latch ボタンを押すと、両 f の左inletに bang → 現在値が出力 → send latch_start / latch_end に流れる。

**latch_start / latch_end が send されると、後段の進行ロジック層で次のことが連鎖的に起こる:**

- `[f current_start]` の **右inlet** に latch_start が保存される（出力なし = 進行が走らない）
- 別経路で latch_start が `[send loop_min]` に流れる
- 別経路で latch_start + window_ms が `[send loop_max]` に流れる
- → groove~ の loop 範囲は即反映されるが、startloop は来ない (再生は次の tick まで待機)

-----

## ③ trigger 層 — a_time grid

```
[toggle]
   |
   ↓
[metro 100]
   |
   ↓
[a_time 15 4]
   |
   ↓
[sel 0 2]
   |
   ↓
[send tick]
```

v3 と同じ。最後を startloop 直結ではなく send tick に変更。

-----

## ④ 進行ロジック層 (核心) — rev2

### 全体構造

```
[receive tick]
     |
     ↓
   [t b b]
    右(先)  左(後)
    |       |
    |       └────────────────────────┐
    |                                |
    ↓ (右出力)                        |
[f current_start]                    |
    |                                |
    | bang で現在値出力                |
    ↓                                |
   [+]    ← (右inletに step_ms)      |
    |                                |
    | (current_start + step_ms)      |
    ↓                                |
[if $f1 > $f2 then $f3 else $f1]    |
   $f2 ← receive latch_end           |
   $f3 ← receive latch_start         |
    |                                |
    | (折り返し処理済み = 新しい current_start)
    ↓                                |
   [t f f f]                         |
    右(先)  中    左(後)             |
    |      |     |                   |
    |      |     └→ [+] (右inletに window_ms)
    |      |          |              |
    |      |          ↓              |
    |      |       [send loop_max]   |
    |      |                         |
    |      └→ [send loop_min]        |
    |                                |
    └→ [f current_start] 右inlet (保存)
                                     |
                                     ↓
                                  [send startloop_v4]
```

### latch時のリセット経路 (進行ロジックとは別経路)

```
[receive latch_start]
       |
       ├→ [f current_start] 右inlet ← 保存のみ (出力なし、進行は走らない)
       |
       ├→ [send loop_min]            ← groove~ middle inlet に即反映
       |
       └→ [+] (右inletに window_ms)  ← この + は latch flow 専用
              |
              ↓
           [send loop_max]            ← groove~ right inlet に即反映
```

### window_ms / step_ms の共有

```
[flonum window_ms]
       |
       ├→ 進行ロジック内の [+] 右inlet  (tick時の loop_max 計算用)
       |
       └→ latch flow 内の [+] 右inlet   (latch時の loop_max 計算用)


[flonum step_ms]
       |
       └→ 進行ロジック内の [+] 右inlet  (tick時の current_start 進行用)
```

flonum は1個ずつ。値を変えると両経路で同期される。

### 各要素の役割

|オブジェクト                            |役割                                                  |
|----------------------------------|----------------------------------------------------|
|`[receive tick]`                  |sel 0 2 から bang を受信                                 |
|`[t b b]`                         |右(先)→進行ロジック / 左(後)→startloop の順序保証                  |
|`[f current_start]`               |進行位置を保持。**bangで現在値出力 / 右inletで保存(出力なし)**            |
|`[+]` (進行用)                       |step_ms を加算                                         |
|`[if $f1 > $f2 then $f3 else $f1]`|折り返し判定                                              |
|`[t f f f]`                       |値を3方向に分配。右(先)→保存 / 中→loop_min送信 / 左(後)→loop_max計算&送信|
|`[+]` (進行用 loop_max)              |window_ms を加算して loop_max を作る                        |
|`[+]` (latch用 loop_max)           |latch時の即反映用、別インスタンス                                 |
|`[startloop]` (message)           |groove~ の loop 頭から再生開始                              |

-----

## ⑤ groove~ source  (inlet表記を left/middle/right に修正)

```
            [sig~ 1]   [r loop_min]   [r loop_max]
                |          |             |
[loadbang→loop 1]          |             |
[r startloop_v4]           |             |
                |          |             |
                ↓ left     ↓ middle      ↓ right
        ┌─────────────────────────────────────┐
        │     groove~ stutter_src_v4 2        │
        └─────────────────────────────────────┘
                |          |             |
                ↓ L        ↓ R           ↓ sync (未使用)
            *~ 0.7      *~ 0.7
                |          |
                ↓          ↓
              ezdac~     ezdac~
```

### groove~ の各inlet

|inlet     |役割                        |受信内容                                                         |
|----------|--------------------------|-------------------------------------------------------------|
|**left**  |speed / startloop / loop 1|sig~ 1 (常時) / loadbangから loop 1 (1回) / r startloop_v4 (tick毎)|
|**middle**|loop start                |r loop_min (latch時 と tick時)                                  |
|**right** |loop end                  |r loop_max (latch時 と tick時)                                  |

-----

## 発火順序サマリー

### latch時 (1回)

```
[1] latch button → t b b
[2] selstart/selend を f に保存 → send latch_start, send latch_end
[3] r latch_start (進行ロジック側):
    ├ f current_start 右inlet に保存 (出力なし)
    ├ send loop_min     ← groove~ middle inlet 更新
    └ + window_ms → send loop_max  ← groove~ right inlet 更新
[4] groove~ は新しい loop 範囲で待機 (startloop は来ない)
```

### tick時 (毎発火)

```
[1] sel 0 2 → bang → t b b
[2] t b b 右(先) → 進行ロジック発火
    ├ [f current_start] → 現在値出力 (bang)
    ├ + step_ms
    ├ if で折り返し判定
    ├ t f f f 右(先): [f] に新しい値を保存
    ├ t f f f 中:    send loop_min
    └ t f f f 左(後): + window_ms → send loop_max
[3] t b b 左(後) → send startloop_v4
    → groove~ left inlet で startloop メッセージ受信
    → 新しい loop 範囲の頭から再生開始
```

→ 「**新しい loop 範囲が groove~ に届いてから startloop が来る**」順序が保証される。

-----

## 残った確認事項

1. `[if $f1 > $f2 then $f3 else $f1]` の構文が docs 通り動くか (チャトレア指摘あり、要実機確認)
1. 同じ `latch_start` を複数 receive する箇所での動作 (Max の send/receive は1対多の標準動作なので問題ないはず)
1. `[+]` (引数なし) で右inletに flonum を流す方式 (Max の標準動作、問題ないはず)

-----

## 一文要約 (rev2)

latch_start を `[f current_start]` の **右inlet で純粋保存** し、loop_min/max への即反映は **別経路**で行う。
tick時のみ進行ロジックが走り、`if` で折り返し判定、`t f f f` で順序保証して loop 範囲を更新してから startloop を送る。
groove~ への接続は left = speed/startloop/loop / middle = loop start / right = loop end の表記で統一。
