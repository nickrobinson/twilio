class CreateSidCol < ActiveRecord::Migration
  def change
    add_column :calls, :account_sid, :string
    add_column :calls, :call_sid, :string
  end
end
