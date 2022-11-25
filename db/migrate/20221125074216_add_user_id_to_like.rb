# frozen_string_literal: true

class AddUserIdToLike < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :author, references: :users, null: false, foreign_key: { to_table: :users }
  end
end