class Word < ActiveRecord::Base
  belongs_to(:words)
  validates(:name, :presence => true, uniqueness: { case_sensitive: false})
end
