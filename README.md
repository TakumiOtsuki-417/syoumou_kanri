# このアプリケーションについて

「消耗管理」はその名前の通り、消耗品を管理することだけにフォーカスしたようなWebアプリケーションです。

# テーブル設計

テーブルは消耗品テーブル、消耗データの２種類で最低限成立します。

## 消耗品(items)

### テーブル

| Column  | Type    | Options     |
| ------- | ------- | ----------- |
| name    | string  | null: false |
| price   | integer | null: false |
| amount  | integer | null: false |
| genre   | integer | null: false |
| day     | date    | null: false |
| place   | string  | null: false |
| comment | text    |             |

### アソシエーション

has_many :damages

## 消耗(damages)

### テーブル

| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| amount  | integer    | null: false                   |
| day     | date       | null: false                   |
| comment | text       |                               |
| item_id | references | null:false, foreign_key: true |


### アソシエーション

belongs_to :item


# できること

主に以下の作業ができるようにします。
- 購入した消耗品を登録できること
- 消耗品の使用分を登録できること
- 消耗品の残量を確認できること
- １日・１週間分などの期間における費用を算出できること






