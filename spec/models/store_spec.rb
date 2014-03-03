# == Schema Information
#
# Table name: stores
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  address      :string(255)
#  city         :string(255)
#  state        :string(255)
#  country      :string(255)
#  neighborhood :string(255)
#  hours        :string(255)
#  categories   :string(255)
#  zip          :string(255)
#  tel          :string(255)
#  latitude     :decimal(10, 7)
#  longitude    :decimal(10, 7)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'spec_helper'

describe Store do
  pending "add some examples to (or delete) #{__FILE__}"
end
