class Lesson < ApplicationRecord
  has_one_attached :video do |attachable|
    attachable.variant :thumb, resize_to_limit: [500, 500]
  end

  acts_as_list

  belongs_to :course

  has_many :lesson_users, dependent: :destroy

  before_create :set_position

  def next_lesson
    course.lessons.where("position > ?", position).order(:position).first
  end

  def previous_lesson
    course.lessons.where("position < ?", position).order(:position).last
  end

  private

  def set_position
    max_position = course.lessons.maximum(:position) || 0
    self.position = max_position + 1
  end
end
