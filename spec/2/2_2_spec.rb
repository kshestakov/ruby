# frozen_string_literal: true

require './lib/2/2_2'

RSpec.describe '2_2, HtmlBuilder:' do
  it 'builds html correctly' do
    builder = HtmlBuilder.draw do
      html do
        form(action: '/', method: 'POST') do
          label 'First name:', for: 'first_name'
          input type: 'text', id: 'first_name', name: 'first_name', value: 'John'
          label 'Last name:', for: 'last_name'
          input type: 'text', id: 'last_name', name: 'last_name', value: 'Doe'
          input type: 'submit', value: 'Submit'
        end
      end
    end

    expect(builder.to_s).to eq('<html>
  <form action="/" method="POST">
    <label for="first_name">First name:</label>
    <input type="text" id="first_name" name="first_name" value="John"></input>
    <label for="last_name">Last name:</label>
    <input type="text" id="last_name" name="last_name" value="Doe"></input>
    <input type="submit" value="Submit"></input>
  </form>
</html>
')
  end
end
