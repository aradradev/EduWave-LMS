class Admin::LessonsController < AdminController
  before_action :set_course
  before_action :set_lesson, only: [:show]
  def index
    @admin_lessons = @admin_course.lessons.order(:position)
  end

  def show; end

  def move
    position = params[:position].to_i
    if position.zero?
      @lesson.move_to_top
    elsif @course.lessons.count - 1
      @lesson.move_to_bottom
    else
      @lesson.insert_at(position + 1)
    end

    @lesson.save!
    render json: { message: 'success' }
  end

  private

  def set_course
    @admin_course = Course.find(params[:course_id])
  end

  def set_lesson
    @lesson = @admin_course.lessons.find(params[:id])
  end
end
