require 'addressable/uri'
require 'rest-client'

def get_index
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.html',
    query_values: { 'users[name]' => "Alex" }
  ).to_s

  # query_values = { 'users[name]' => "Alex" }
  # puts RestClient.post(url, query_values)


  puts RestClient.post(url)
end

def update_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/1.json',
  ).to_s

  begin
    puts RestClient.put(
      url,
      { 'user[name]' => 'Aleksey' }
    )
  rescue RestClient::Exception => e
    puts e.message
  end
end

# update_user

def create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

  begin
    puts RestClient.post(
      url,
      { user: { name: "Gizmo", email: "gizmo@gizmo.gizmo" } }
    )
  rescue RestClient::Exception => e
    puts e.message
  end
end

create_user


def show_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/4.json'
  ).to_s

  begin
    puts RestClient.get(url)
  rescue RestClient::Exception => e
    puts e.message
  end
end

# show_user


def destroy_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/3.json',
  ).to_s

  begin
    puts RestClient.delete(url)
  rescue RestClient::Exception => e
    puts e.message
  end
end

# destroy_user
