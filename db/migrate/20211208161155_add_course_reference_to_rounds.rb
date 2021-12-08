class AddCourseReferenceToRounds < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :rounds, :golf_courses, column: :course_id
    add_index :rounds, :course_id
    change_column_null :rounds, :course_id, false
  end
end
