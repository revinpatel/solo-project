class Character < ApplicationRecord
  belongs_to :user

  validates :race, presence: true
  validates :gender, presence: true
  validates :age, presence: true
  validates :charclass, presence: true
  validates :level, presence: true
  validates :name, presence: true
  validates :alignment, presence: true
  validates :description, presence: true
  validates :equipment, presence: true
  validates :spell, presence: true
  validates :wealth, presence: true
  validates :strstat, presence: true
  validates :dexstat, presence: true
  validates :constat, presence: true
  validates :intstat, presence: true
  validates :wisstat, presence: true
  validates :chastat, presence: true

end
