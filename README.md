# DB設計

## usersテーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| first_name | string | null: false |
| last_name  | string | null: false |

### association
- has_many :memos
- has_many :room_users
- has_many :rooms, through: room_users

## memosテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### association
- belongs_to :user
- belongs_to :room

## roomsテーブル

| Column | Type   | Options       |
| ------ | ------ | ------------- |
| name   | string | null: false   |  

### association
- has_many :memos
- has_many :users, through: room_users
- has_many :room_users

## room_usersテーブル

| Column | Type       |  Options                       |
| ------ | ---------- | ------------------------------ |
| room   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### association
- belongs_to :user
- belongs_to :room
