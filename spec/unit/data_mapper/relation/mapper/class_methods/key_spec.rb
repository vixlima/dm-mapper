require 'spec_helper'

describe Relation::Mapper, '.key' do
  subject { object.key(:id) }

  let(:object) { Class.new(described_class) }

  let(:id) { Attribute.build(:id, :type => Integer) }

  before { object.attributes << id }

  it { should be(object) }

  it "sets given attribute as the key" do
    subject.attributes[:id].should be_key
  end
end
