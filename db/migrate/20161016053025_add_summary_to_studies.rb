class AddSummaryToStudies < ActiveRecord::Migration
  def change
    add_column :studies, :summary, :string
  end
end
