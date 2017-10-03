class Word < ActiveRecord::Base
  belongs_to(:words)
  validates(:name, :presence => true, uniqueness: { case_sensitive: false})
  before_save(:capitalize_first_letter)
  validates :name, format: { with: /[a-zA-Z]/}


  private

 def capitalize_first_letter
   name = self.name.split(" ")
   self.name = name.map{|word| word.capitalize}.join(" ")
 end
end
