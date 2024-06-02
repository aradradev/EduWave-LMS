class Lesson < ApplicationRecord
  has_one_attached :video
  belongs_to :course

  has_many :lesson_users, dependent: :destroy

  before_create :set_position

  private

  def set_position
    max_position = course.lessons.maximum(:position) || 0
    self.position = max_position + 1
  end
end
