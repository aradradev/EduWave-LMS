require 'rails_helper'

RSpec.describe 'lessons/show', type: :view do
  before(:each) do
    assign(:lesson, Lesson.create!(
                      title: 'Title',
                      description: 'MyText',
                      paid: false,
                      course: nil
                    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
