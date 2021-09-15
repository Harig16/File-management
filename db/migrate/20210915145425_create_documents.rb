class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.string :title
      t.text :description
      t.string :attachment

      t.timestamps
    end
  end
end
