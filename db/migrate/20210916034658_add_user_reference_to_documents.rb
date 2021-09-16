class AddUserReferenceToDocuments < ActiveRecord::Migration[6.0]
  def change
    add_reference :documents, :user, foreign_key: true
  end
end
