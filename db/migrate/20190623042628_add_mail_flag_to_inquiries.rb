class AddMailFlagToInquiries < ActiveRecord::Migration[5.2]
  def change
    add_column :inquiries, :mail_flag, :integer
  end
end
