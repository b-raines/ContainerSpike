class CCUrlProtocol < NSURLProtocol
  attr_accessor :connection

  def self.canInitWithRequest(request)
    if change_collective_url?(request.URL.absoluteString) && !url_handled?(request)
      puts "******\n"
      puts request.URL.absoluteString
      puts "\n"

      return true
    end
  end

  def self.canonicalRequestForRequest(request)
    request
  end

  def startLoading
    new_request = request.mutableCopy
    NSURLProtocol.setProperty(true, forKey: 'CCUrlProtocolHandled', inRequest: new_request)
    if SessionManager.auth_token
      new_request.setValue(SessionManager.auth_token, forHTTPHeaderField: 'Authorization')
    end

    puts new_request.valueForHTTPHeaderField('Authorization')
    puts new_request.HTTPBody

    self.connection = NSURLConnection.connectionWithRequest(new_request, delegate: self)
  end

  def stopLoading
    self.connection.cancel
    self.connection = nil
  end

  def connection(connection, didReceiveResponse: response)
    self.client.URLProtocol(self, didReceiveResponse: response, cacheStoragePolicy: NSURLCacheStorageNotAllowed)
  end

  def connection(connection, didReceiveData: data)
    self.client.URLProtocol(self, didLoadData: data)
  end

  def connectionDidFinishLoading(connection)
    self.client.URLProtocolDidFinishLoading(self)
  end

  def connection(connection, didFailWithError: error)
    self.client.URLProtocol(self, didFailWithError: error)
  end

  private

  def self.url_handled?(request)
    NSURLProtocol.propertyForKey('CCUrlProtocolHandled', inRequest: request)
  end

  def self.change_collective_url?(url)
    url.match(/^http(s)?:\/\/(\w)*\.changecollective\./)
  end
end
