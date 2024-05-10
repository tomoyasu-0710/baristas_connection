class GroupUser < ApplicationRecord
  # userテーブルとの関連付け
  belongs_to :user
  # groupテーブルとの関連付け
  belongs_to :group
end
