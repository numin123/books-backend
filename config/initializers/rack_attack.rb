# Rack::Attack.safelist('allow-localhost') do |req|
#   '127.0.0.1' == req.ip || '::1' == req.ip
# end

Rack::Attack.throttle('req/ip', limit: 5, period: 60.seconds) do |req|
  if req.path == '/api/books' && req.post?
    req.ip
  end
end

Rack::Attack.throttle('req/ip', limit: 5, period: 60.seconds) do |req|
  if req.path =~ %r{^/api/books/\d+$} && req.put?
    req.ip
  end
end

Rack::Attack.throttle('req/ip', limit: 5, period: 60.seconds) do |req|
  if req.path =~ %r{^/api/books/\d+$} && req.delete?
    req.ip
  end
end

Rack::Attack.throttled_responder = lambda do |env|
  [429, { 'Content-Type' => 'application/json' }, [{ error: 'Throttle limit reached. Retry later.' }.to_json]]
end
