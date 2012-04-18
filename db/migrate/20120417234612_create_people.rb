class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :phone
      t.date :birth_date
      t.string :document

      t.timestamps
    end
  end
end
