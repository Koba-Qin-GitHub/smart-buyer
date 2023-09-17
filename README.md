
## users テーブル 
| Column                    | Type      | Options                   |
| ------------------------- | --------- | ------------------------- |
| name                      | string    | null: false               |
| email                     | string    | null: false, unique: true |
| encrypted_password        | string    | null: false               |
| company_id                | integer   | null: false               |
| birthday                  | date      | null: false               |


### Association
- has_many :items
- has_many :favorites
- has_many :sites





------------------------------------------------------------------------------------------------------------------
## items テーブル
| Column                    | Type       | Options                         |
| ------------------------- | ---------- | ------------------------------- |
| name                      | string     | null: false                     |
| content                   | text       | null: false                     |
| price                     | integer    | null: false                     |
| quantity                  | integer    | null: false                     |
| user                      | references | null: false, foreign_key: true  |


### Association
- belongs_to :user
- has_many :favorites
- has_many :item_sites



------------------------------------------------------------------------------------------------------------------
## item_sites テーブル
| Column                    | Type       | Options                         |
| ------------------------- | ---------- | ------------------------------- |
| item                      | references | null: false, foreign_key: true  |
| site                      | references | null: false, foreign_key: true  |


### Association
- belongs_to :item
- belongs_to :site





------------------------------------------------------------------------------------------------------------------
## sites テーブル
| Column                    | Type       | Options                         |
| ------------------------- | ---------- | ------------------------------- |
| name                      | string     | null: false                     |
| content                   | text       | null: false                     |
| user                      | references | null: false, foreign_key: true  |


### Association
- belongs_to :user
- has_many :item_sites





------------------------------------------------------------------------------------------------------------------
## favorites テーブル
| Column                    | Type       | Options                         |
| ------------------------- | ---------- | ------------------------------- |
| user                      | references | null: false, foreign_key: true  |
| item                      | references | null: false, foreign_key: true  |


### Association
- belongs_to :user
- belongs_to :item
- has_one    :reminder




------------------------------------------------------------------------------------------------------------------
## reminders テーブル
| Column                    | Type       | Options                         |
| ------------------------- | ---------- | ------------------------------- |
| case_id                   | integer    | null: false                     |
| reminder_way_id           | integer    | null: false                     |
| favorite_id               | references | null: false, foreign_key: true  |


### Association
- belongs_to :favorite













