class CreatePalindromes < ActiveRecord::Migration[7.0]
  def change
    create_table :palindromes, id: false do |t|
      t.integer :num, null: false
      t.string :result
      t.string :binaries
      t.integer :count
    end
    execute('ALTER TABLE palindromes ADD PRIMARY KEY(num);')
    add_index :palindromes, [:num], unique: true
  end
end
