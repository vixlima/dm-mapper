require 'spec_helper_integration'

describe "Using Arel engine" do
  include_context 'Models and Mappers'

  before(:all) do
    setup_db

    insert_user 1, 'John',  18
    insert_user 2, 'Jane',  21
    insert_user 3, 'Piotr', 29

    user_mapper
  end

  let(:user_model) {
    mock_model('User') {
      include DataMapper::Model

      attribute :id,   Integer, :key => true
      attribute :name, String
      attribute :age,  Integer
    }
  }

  it "actually works ZOMG" do
    users = DM_ENV[user_model].all

    users.should have(3).items

    user1, user2, user3 = users

    user1.name.should eql('John')
    user1.age.should be(18)

    user2.name.should eql('Jane')
    user2.age.should be(21)

    user3.name.should eql('Piotr')
    user3.age.should be(29)
  end
end