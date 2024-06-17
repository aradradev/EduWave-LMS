class AddPremiumDescriptionToCourses < ActiveRecord::Migration[7.1]
  def change
    add_column :courses, :premium_description, :text
  end
end
