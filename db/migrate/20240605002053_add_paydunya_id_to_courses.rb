class AddPaydunyaIdToCourses < ActiveRecord::Migration[7.1]
  def change
    add_column :courses, :paydunya_id, :string
  end
end
