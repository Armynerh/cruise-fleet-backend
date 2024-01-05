class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.boolean :availability
      t.string :photo
      t.float :cost

      t.timestamps
    end
  end
end
