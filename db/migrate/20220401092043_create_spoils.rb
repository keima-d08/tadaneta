class CreateSpoils < ActiveRecord::Migration[6.0]
  def change
    create_table :spoils do |t|

      t.timestamps
    end
  end
end
