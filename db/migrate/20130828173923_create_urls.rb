class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :original
      t.string :shortened
      t.integer :counter, :default => 0
      t.belongs_to :user
    end
  end
end
