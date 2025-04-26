class Lecture < ApplicationRecord
  belongs_to :chapter

  validates :source, presence: true

  enum source: { the_odin_project: "the_odin_project", le_wagon: "le_wagon" }
end
