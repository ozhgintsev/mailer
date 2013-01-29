class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.text      :question
      t.text      :answer
      t.string    :user_name
      t.string    :email
      t.integer   :status, :default => 0
      t.integer   :user_id

      t.timestamps
    end
  end
end
