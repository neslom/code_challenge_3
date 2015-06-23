def login_with_oauth(service = :github)
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[service] = OmniAuth::AuthHash.new({
    uid: "123456789",
    info: {
      name: "neslom",
      image: "https://avatars.githubusercontent.com/u/8800860?v=3",
    },
    credentials: {
      token: "2442504061-52NtnkpgGzSDtwKr74l7tZ10XVNt3VfVqDbeXg6"
    }
  })
  visit "/auth/#{service}"
end
