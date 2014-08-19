class MarvinCallback < ActiveRecord::Base
  validates :guid, :uniqueness => true, :presence => true, :format => { with: /\A[0-9a-f]{8}(-[0-9a-f]{4}){3}-[0-9a-f]{12}\z/ }
  validates :timestamp, :presence => true
end
