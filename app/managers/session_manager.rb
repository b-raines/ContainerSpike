class SessionManager < AFHTTPSessionManager
  class << self
    BASE_URL = 'https://staging.changecollective.com/'

    def shared
      Dispatch.once { @shared = default_manager }

      @shared
    end

    def default_manager
      config = NSURLSessionConfiguration.defaultSessionConfiguration
      config.protocolClasses = [CCUrlProtocol]
      self.alloc.initWithBaseURL(NSURL.URLWithString(BASE_URL), sessionConfiguration: config)
    end

    def sign_in(params = {}, &block)
      shared.sign_in(params, &block)
    end

    def sign_out
      shared.sign_out
    end

    def auth_token
      shared.auth_token
    end
  end

  def sign_in(params = {}, &block)
    POST(
      'api/v2/session',
      parameters: params,
      success: ->(task, response) {
        store_auth_token(response)
        block.call(nil) if block
      },
      failure: ->(task, error) {
        puts "Sign in error: #{error.localizedDescription}"
        block.call(error) if block
      }
    )
  end

  def sign_out
    reset_auth_token
  end

  def auth_token
    keychain = FXKeychain.defaultKeychain
    keychain.objectForKey('authToken')
  end

  private

  def store_auth_token(response)
    keychain = FXKeychain.defaultKeychain
    token = response.fetch('user', {}).fetch('auth_token', '').to_s
    keychain.setObject(token, forKey: 'authToken')
  end

  def reset_auth_token
    keychain = FXKeychain.defaultKeychain
    keychain.removeObjectForKey('authToken')
  end
end
