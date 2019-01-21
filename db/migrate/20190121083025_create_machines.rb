class CreateMachines < ActiveRecord::Migration[5.2]
  def change
    create_table :machines do |t|
      t.string :name
      t.string :kana
      t.string :judgment
      t.string :manufacturer
      t.string :spec
      t.string :archetype
      t.date :introduction_date
      t.string :introduction_season
      t.string :overview
      t.string :feature
      t.string :evaluation_point
      t.string :pros_and_cons
      t.string :problem
      t.string :other
      t.string :conclusion
      t.string :annotation

      t.timestamps
    end
  end
end
