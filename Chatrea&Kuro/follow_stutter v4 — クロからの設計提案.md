# follow_stutter v4 — クロからの設計提案

チャトレアの v4 相談メモへの応答。

---

## 全体方針

v3 の `[a_time → sel 0 2]` 構造はそのまま維持し、後段に **進行ロジック層** を1段噛ませる。

a_time grid 自体には触らない。
selector UI は latch 戻し (v3ベース)。UI は範囲を凍結するだけ。
speed/reverse は今回外す。移動範囲再侵入の挙動だけに集中する。

---

## 1. 順序保証

`sel 0 2` の後に `[t b b]` を置き、右→左の発火順で順序を作る。

- 右 (先): 進行ロジック → groove~ の loop min/max を更新
- 左 (後): startloop → groove~

これで「先に範囲が確定 → 後で startloop」が保証される。

---

## 2. 状態の持ち方

- `current_start` → `[f]` で保持 (1個)
- `step_ms` → `flonum` (ユーザー操作可)
- `window_ms` → `flonum` (ユーザー操作可)

`current_end` は別途持たない。
毎回 `current_start + window_ms` で計算して groove~ に送る。
状態を増やさない。

---

## 3. 進行ロジックの内部


t f f f の発火順 (右→中→左) で、保存 → loop min 送信 → loop max 計算&送信、の順に実行される。

---

## 4. 初期化 / リセット

`[r latch_start]` を `[f current_start]` の **左inlet** に直接繋ぐ。

latch ボタンを押すたびに current_start が latch_start にリセットされる。
「latch = 進行範囲を凍結 + 進行位置をリセット」が一発で成立。

---

## 5. 全体の bang フロー


---

## 確認したい設計判断

1. **selector UI は latch 戻しでよいか**
   v3 同様、UI は範囲を凍結するだけにする。進行中に UI が動くのは混乱しそう。

2. **speed/reverse は今回外すでよいか**
   最初は移動範囲再侵入の挙動だけに集中したい。
   合意できれば v5 で speed/reverse を追加する。

3. **折り返しの挙動**
   latch_end を超えたら latch_start に戻る (一方向ループ)。
   ピンポン (折り返して逆方向) ではない。
   これでよいか。

4. **step_ms と window_ms の関係**
   - step < window なら overlap (重なる)
   - step = window ならスキマなし
   - step > window ならスキマあり
   ユーザー操作で全部試せる構造にする。

---

## 一文要約

v3 の a_time grid を維持し、`sel 0 2` の発火ごとに current_start を進めて
groove~ の loop 範囲を更新してから startloop を送る、移動範囲再侵入版。

主役は a_time の機械的時間制度のまま。
進行ロジックはその制度に従属する。
