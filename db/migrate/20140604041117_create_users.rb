class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :access_token
      t.string :refresh_token
      t.timestamps
    end

    add_index \
      :users,
      :email,
      :unique => true
  end
end
