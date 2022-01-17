class User < ApplicationRecord
  has_secure_password

  has_many :freindships, dependent: :destroy
  has_many :freinds, -> {where(freindships: {status: "accepted"}) },through: :freindships
  has_many :pending_freinds, -> {where(freindships: {status: "pending"}) },through: :freindships, source: :freind
  has_many :requested_freinds, -> {where(freindships: {status: "requested"}) },through: :freindships, source: :freind

  validates :email, uniqueness:true
end
