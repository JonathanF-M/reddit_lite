module ApplicationHelper
  def devise_mapping
    Devise.mappings[:user] # Change :user if you have another Devise model
  end

  def devise_resource
    User.new
  end

  def devise_resource_name
    :user
  end
end
