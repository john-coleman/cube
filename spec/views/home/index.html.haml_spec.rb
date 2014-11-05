require 'rails_helper'

RSpec.describe 'home/index.html.haml', type: :view do
  it 'renders the index' do
    render
    expect(rendered).to include('Welcome To Cube')
    assert_select 'div>div', html: %r{img alt="srs" alt_text="cube_logo" src="/assets/srs\.jpg"}
  end
end
