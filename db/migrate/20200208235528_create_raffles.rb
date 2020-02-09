class CreateRaffles < ActiveRecord::Migration[6.0]
  def change
    create_table :raffles do |t|

      t.belongs_to :user, index: true, foreign_key: true
      t.string :title
      t.string :post_id, unique: true
      t.string :winning_username
      t.boolean :completed


      t.timestamps
    end
  end
end
