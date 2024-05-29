class CreateJoinTableCategoriesCourses < ActiveRecord::Migration[7.1]
  def change
    create_join_table :categories, :courses do |t|
      t.index :category_id
      t.index :course_id
    end
  end
end
