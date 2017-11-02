class AddPicAttToComment < ActiveRecord::Migration[5.1]
  def change
    add_attachment :comments, :pic
  end
end
