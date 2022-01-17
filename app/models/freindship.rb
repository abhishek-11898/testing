class Freindship < ApplicationRecord
  belongs_to :user
  belongs_to :freind, class_name:  'User', foreign_key: 'freind_id'

  validates :status, :user_id, :freind_id, presence: true
  validates :status, inclusion: {in:  %w(accepted pending requested)}
  validates :user_id, uniqueness: { scope: :freind_id, messages: "! You Already send !" }
end
