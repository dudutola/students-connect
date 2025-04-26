class Chapter < ApplicationRecord
  has_many :lectures, dependent: :destroy

  validates :name, presence: true
  # validates :description, presence: true
  # validates :overview, presence: true
  validates :source, presence: true

  enum source: { the_odin_project: "the_odin_project", le_wagon: "le_wagon" }
end
