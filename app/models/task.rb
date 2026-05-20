class Task < ApplicationRecord
  # 必須項目の設定
  validates :title, :start_date, :end_date, presence: true
  # 文字数制限の設定
  validates :content, length: { maximum: 500 }
end
