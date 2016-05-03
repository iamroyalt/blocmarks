require 'rails_helper'

RSpec.describe User, type: :model do

  include Devise::TestHelpers
  let (:user) {create(:user, confirmed_at: Time.now)}

end
