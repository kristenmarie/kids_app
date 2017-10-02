class Letter < ActiveRecord::Base
  has_and_belongs_to_many(:words)
  validates(:name, :presence => true, uniqueness: { case_sensitive: false})
  before_save(:capitalize_first_letter)


  private

 def capitalize_first_letter
   name = self.name.split(" ")
   self.name = name.map{|word| word.capitalize}.join(" ")
 end
end
