class AddPropertiesToDrawRule < ActiveRecord::Migration[6.0]
  def change
    add_column :draw_rules, :group_name, :string, optional: true
    add_column :draw_rules, :quantity, :integer, optional: true
  end
end
