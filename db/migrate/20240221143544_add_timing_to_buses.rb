class AddTimingToBuses < ActiveRecord::Migration[7.1]
  def change
    add_column :buses, :timing, :string
  end
end
