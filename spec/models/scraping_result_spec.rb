require 'rails_helper'

RSpec.describe ScrapingResult, type: :model do
  it { should validate_presence_of(:task_id) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:year) }
  it { should validate_presence_of(:km) }
  it { should validate_presence_of(:transmission) }
  it { should validate_presence_of(:body_type) }
  it { should validate_presence_of(:fuel) }
  it { should validate_presence_of(:final_plate) }
  it { should validate_presence_of(:color) }
  it { should validate_presence_of(:trade) }
end
