json.array!(@ad_computer_accounts) do |ad_computer_account|
  json.extract! ad_computer_account, :id, :domain, :machine_account, :ou
  json.url ad_computer_account_url(ad_computer_account, format: :json)
end
