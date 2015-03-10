class Article < ActiveRecord::Base
  default_scope { order('id desc')} #注意是'id desc'
  belongs_to :user
end
