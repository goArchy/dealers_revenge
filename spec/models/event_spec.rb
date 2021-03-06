require 'spec_helper'

describe Event do
  let(:user) { FactoryGirl.create(:user) }

  before { @event = user.events.build(description: "Lorem Ipsum", first_name: "John", last_name: "Smith", ssn: 5555, address: "555 Yoda Dr.", zip: 55555 ) }

  subject { @event }

  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  it { should respond_to(:description) }
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:ssn) }
  it { should respond_to(:address) }
  it { should respond_to(:zip) }
  its(:user) { should == user }

  describe "when user_id is not present" do
    before { @event.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank description" do
    before { @event.description = " " }
    it { should_not be_valid }
  end

  describe "with blank ssn" do
    before { @event.ssn = " " }
    it { should_not be_valid }
  end

  describe "with blank first_name" do
    before { @event.first_name = " " }
    it { should_not be_valid }
  end

  describe "with blank last_name" do
    before { @event.last_name = " " }
    it { should_not be_valid }
  end

  describe "with blank dob" do
    before { @event.dob = " " }
    it { should_not be_valid }
  end
end

