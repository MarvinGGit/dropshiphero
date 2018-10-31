class CreateFacebookads < ActiveRecord::Migration[5.2]
  def change
    create_table :facebookads do |t|
      t.belongs_to :product, index: true
      t.text :adcopy
      t.string :videoadurl
      t.string :pictureadurl
      t.timestamps
    end
  end
end
