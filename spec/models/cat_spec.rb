require 'rails_helper'

RSpec.describe Cat, type: :model do
  it 'should validate if a name was created' do
    cat = Cat.create
    expect(cat.errors[:name]).to_not be_empty
  end
  it 'should validate if an age was added' do
    cat = Cat.create
    expect(cat.errors[:age]).to_not be_empty
  end
  it 'should validate if an enjoys text was added' do
    cat = Cat.create
    expect(cat.errors[:enjoys]).to_not be_empty
  end
  it 'should validate if an image was added' do
    cat =Cat.create
    expect(cat.errors[:image]).to_not be_empty
  end
  it 'should validate that enjoys is at least 10 characters' do
  cat = Cat.create enjoys:"Naps"
  expect(cat.errors[:enjoys]).to_not be_empty
end
end
