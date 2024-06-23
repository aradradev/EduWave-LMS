class Admin::LessonsController < AdminController
  before_action :set_course
  before_action :set_lesson, only: %i[show move]
  def index
    @admin_lessons = @admin_course.lessons.order(:position)
  end

  def show; end

  def move
    position = params[:position].to_i
    if position.zero?
      @admin_lesson.move_to_top
    elsif position >= @course.lessons.count - 1
      @admin_lesson.move_to_bottom
    else
      @admin_lesson.insert_at(position + 1)
    end

    if @admin_lesson.save!
      render json: { message: 'success' }
    else
      render json: {message: 'error'}, status: :unprocessable_entity 
    end
  end

  private

  def set_course
    @admin_course = Course.find(params[:course_id])
  end

  def set_lesson
    @admin_lesson = @admin_course.lessons.find(params[:id])
  end
end
