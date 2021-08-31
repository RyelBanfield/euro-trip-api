require 'net/http'
require 'uri'
domain = ENV['AUTH0_DOMAIN']

class JsonWebToken
  def self.verify(token)
    JWT.decode(token, nil,
               true, # Verify the signature of this token
               algorithm: 'RS256',
               iss: domain,
               verify_iss: true,
              #  aud: Rails.application.credentials.auth0[:api_identifier],
               verify_aud: true) do |header|
      jwks_hash[header['kid']]
    end
  end

  def self.jwks_hash
    jwks_raw = Net::HTTP.get URI("#{domain}/.well-known/jwks.json")
    jwks_keys = Array(JSON.parse(jwks_raw)['keys'])
    jwks_keys
      .map do |k|
      [
        k['kid'],
        OpenSSL::X509::Certificate.new(
          Base64.decode64(k['x5c'].first)
        ).public_key
      ]
    end.to_h
  end
end
