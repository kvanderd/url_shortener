class Url < ActiveRecord::Base
  # Remember to create a migration!
  validates :short_url, :uniqueness => true
  validates :original_url, :uniqueness => true
  validates :original_url, :format => { :with => /^((https:\/\/)|(http:\/\/))?(www.).*\..*/,
    :message => "Not a valid url ('http://'' or 'https://' is required)" }
end
