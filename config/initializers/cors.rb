Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "*",
            "our production front end domain"
    resource "*",
    headers: :any,
    methods: [:get, :post, :put, :patch, :delete, :options, :head],
     credentials: true,
    max_age: 86400
  end
end