#バリデーション。適切なエラーメッセージを表示
class Message < ApplicationRecord
  #フォームがあったのは、new, editアクション。どちらもMessageモデルなのでmodels/message.rb
  validates :content, presence: true, length: { maximum: 255 }
  #validates に、 :contentカラム(投稿内容)を指定。presence: true（カラを許さない）と length: { maximum: 255 }（255文字以内）
  validates :title, presence: true, length: { maximum: 255 }
  #titleカラムにも追加
end
