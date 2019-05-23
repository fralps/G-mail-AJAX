class AddWasreadToEmail < ActiveRecord::Migration[5.2]
  def change
    add_column :emails, :wasread, :boolean
  end
end
