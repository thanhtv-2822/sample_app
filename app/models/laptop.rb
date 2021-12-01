class Laptop < ApplicationRecord
  validates :title, presence: true, length: {maximum: Settings.length.title}
end
