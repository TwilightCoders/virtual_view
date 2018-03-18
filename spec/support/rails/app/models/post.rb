class Post < ::ActiveRecord::Base
  self.table_name = "documents"

  belongs_to :user
  has_many :comments
end
