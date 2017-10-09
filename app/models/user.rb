class User < ActiveRecord::Base
  validates :username, presence: true,
             length: {minimum:3, maximum:25}, 
             uniqueness: {case_sensitive: false}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i           
  validates :eamil, presence: true,
             length: {maximum: 125}, uniqueness: {case_sensitive: false}, 
             format: {width: VALID_EMAIL_REGEX} 

end