class CreateTutors < ActiveRecord::Migration[6.1]
  def change
    create_table :tutors do |t|
      t.string :tutor_name
      t.string :course_id
      t.timestamps
    end
  end
end
