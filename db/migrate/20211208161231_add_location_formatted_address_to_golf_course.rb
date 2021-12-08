class AddLocationFormattedAddressToGolfCourse < ActiveRecord::Migration[6.0]
  def change
    add_column :golf_courses, :location_formatted_address, :string
  end
end
