ShopifyApp.configure do |config|
  config.application_name = "MobintumOnDemandVol2"
  config.api_key = "58836700a3cb2433197e13904bafb3de"
  config.secret = "ffd0aafdb36c7f26e36b03d0a319ce33"
  config.scope = 'read_customers, read_orders, write_products'

  config.session_repository = Shop
  config.embedded_app = true
  config.after_authenticate_job = false
  host = "http://f7206db4.ngrok.io"
  topics = ['orders/update', 'orders/create']
  config.webhooks = topics.each_with_object([]) do |topic, acc|
    acc << {
      topic: topic,
      format: "json",
      address: "#{host}/webhooks/#{topic.parameterize(separator: '_')}"
    }
  end
end
