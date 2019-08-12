# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  sub_id     :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  has_many :post_subs, inverse_of: :post, dependent: :destroy
  has_many :subs,
    through: :post_subs,
    source: :sub
    
  belongs_to :user 
end
