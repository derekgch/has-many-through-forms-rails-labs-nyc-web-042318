class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  accepts_nested_attributes_for :user, reject_if: proc { |attributes| attributes['name'].blank? }


  def user_attributes=(user_attributes)
    # byebug
    if user_attributes[:username] != nil && user_attributes[:username] != ""
      user_attributes.values.each do |user_attribute|
        user = User.find_or_create_by(username: user_attribute)
        self.user = user
      end
    end
  end

end
