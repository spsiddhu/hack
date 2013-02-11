class CreateProgrammers < ActiveRecord::Migration
  def change
    create_table :programmers do |t|
      t.string :Hacker_name
      t.string :Skillset
      t.string :City
      t.string :email

      t.timestamps
    end
  end
end
