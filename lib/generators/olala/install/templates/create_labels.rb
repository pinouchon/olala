class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.string :label
      t.string :content

      t.timestamps
    end
  end
end
