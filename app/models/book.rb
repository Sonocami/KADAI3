class Book < ApplicationRecord
  belongs_to :user

validates:title, presence:true
validates:body,  presene:true

end
