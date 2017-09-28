class Todo < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :title, presence: true
  validates :description, presence: true
  validates :due_date, presence: true

  def return_title_digest
    if self.title.size > 10
      self.title[0..9] + "..."
    else
      self.title
    end
  end

  def self.due_within_24_hours
    Todo.where("due_date <= ?", 1.day.from_now)
  end
end
