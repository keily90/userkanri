class CreateFbusers < ActiveRecord::Migration
  def change
    create_table :fbusers do |t|
      t.string :name
      t.string :acesstoken
      t.string :acesstokensecect
      t.boolean :status

      t.timestamps
    end
  end
end
