class CreatePartners < ActiveRecord::Migration[7.0]
  def change
    create_table :partners do |t|
      t.string :name
      t.string :cpf
      t.string :cnpj
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
