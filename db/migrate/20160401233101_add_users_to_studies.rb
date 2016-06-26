class AddUsersToStudies < ActiveRecord::Migration
  def change
  	add_reference :studies, :user, index: true
  end
end
