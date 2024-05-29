require 'rails_helper'

RSpec.describe 'courses/edit', type: :view do
  let(:course) do
    Course.create!(
      title: 'MyString',
      description: 'MyString'
    )
  end

  before(:each) do
    assign(:course, course)
  end

  it 'renders the edit course form' do
    render

    assert_select 'form[action=?][method=?]', course_path(course), 'post' do
      assert_select 'input[name=?]', 'course[title]'

      assert_select 'input[name=?]', 'course[description]'
    end
  end
end
