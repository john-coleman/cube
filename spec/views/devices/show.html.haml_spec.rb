require 'rails_helper'

RSpec.describe 'devices/show', type: :view do
  before(:each) do
    @device = assign(:device, FactoryGirl.create(:device))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Hostname/)
    expect(rendered).to match(/Domain/)
    expect(rendered).to match(/OS/)
  end
end
