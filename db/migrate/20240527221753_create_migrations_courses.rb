class CreateMigrationsCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :migrations_courses, id: false do |t|
      t.belongs_to :category
      t.belongs_to :course

      t.timestamps
    end
  end
end
