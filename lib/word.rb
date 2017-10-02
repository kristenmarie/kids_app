class Word < ActiveRecord::Base
  has_and_belongs_to_many(:letters)
  validates(:name, :presence => true)
  before_save(:capitalize_first_letter)


  private

 def capitalize_first_letter
   name = self.name.split(" ")
   self.name = name.map{|word| word.capitalize}.join(" ")
 end
end
