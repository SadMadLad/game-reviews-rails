class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :title, null: false
      t.string :about, null: false
      t.integer :number_of_reviews, default: 0
      t.integer :likes, default: 0
      t.integer :dislikes, default: 0
      t.string :img_path, default: "https://images.unsplash.com/photo-1669896108052-3bb3aad0ccff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80", null: false

      t.timestamps
    end
  end
end
