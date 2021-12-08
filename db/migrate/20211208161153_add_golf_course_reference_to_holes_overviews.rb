class AddGolfCourseReferenceToHolesOverviews < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :holes_overviews, :golf_courses
    add_index :holes_overviews, :golf_course_id
    change_column_null :holes_overviews, :golf_course_id, false
  end
end
