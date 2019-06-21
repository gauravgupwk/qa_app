class AddTableTopicsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :topics_users, id: false do |t|
      t.belongs_to :topic, index: true
      t.belongs_to :user, index: true
    end
  end
end
