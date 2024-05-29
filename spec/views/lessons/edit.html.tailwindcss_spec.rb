require 'rails_helper'

RSpec.describe 'lessons/edit', type: :view do
  let(:lesson) do
    Lesson.create!(
      title: 'MyString',
      description: 'MyText',
      paid: false,
      course: nil
    )
  end

  before(:each) do
    assign(:lesson, lesson)
  end

  it 'renders the edit lesson form' do
    render

    assert_select 'form[action=?][method=?]', lesson_path(lesson), 'post' do
      assert_select 'input[name=?]', 'lesson[title]'

      assert_select 'textarea[name=?]', 'lesson[description]'

      assert_select 'input[name=?]', 'lesson[paid]'

      assert_select 'input[name=?]', 'lesson[course_id]'
    end
  end
end
