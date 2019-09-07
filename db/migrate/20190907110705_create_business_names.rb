class CreateBusinessNames < ActiveRecord::Migration[5.2]
  def change
    create_table :business_names do |t|
      t.string :name

      t.timestamps
    end
  end
end
