require 'sinatra'; enable :sessions

get '/ep/get' do
  params['test'] # GET /ep/get?test=<img src=x onerror=alert(1)>
end

put '/ep/put' do
  params['test'] # PUT /ep/put?test=<img src=x onerror=alert(1)>
end

post '/ep/post' do
  params['test'] # POST /ep/post?test=<img src=x onerror=alert(1)>
end

delete '/ep/delete' do
  params['test'] # DELETE /ep/delete?test=<img src=x onerror=alert(1)>
end

head '/ep/head' do
  params['test'] # HEAD /ep/head?test=<img src=x onerror=alert(1)>
end

options '/ep/options' do
  params['test'] # OPTIONS /ep/options?test=<img src=x onerror=alert(1)>
end

patch '/ep/patch' do
  params['test'] # PATCH /ep/patch?test=<img src=x onerror=alert(1)>
end

link '/ep/link' do
  params['test'] # LINK /ep/link?test=<img src=x onerror=alert(1)>
end

unlink '/ep/unlink' do
  params['test'] # UNLINK /ep/unlink?test=<img src=x onerror=alert(1)>
end

get '/pvo/erb' do
  erb params['test'] # GET /pvo/erb?test=%3C%25%3D%20system('calc.exe')%20%25%3E
end

get '/pvo/haml' do
  haml params['test'] # GET /pvo/haml?test=%23%7B%20system('calc.exe')%20%7D
end

get '/pvo/builder' do
  builder params['test'] # GET /pvo/builder?test=system('calc.exe')
end

get '/pvo/liquid' do
  liquid params['test'], :locals => { :secret => "supersecret" } # GET /pvo/liquid?test=%7B%7B%20secret%20%7D%7D
end

get '/pvo/markdown' do
  markdown params['test'] # GET /pvo/markdown?test=%3Cimg%20src%3Dx%20onerror%3Dalert(1)%3E
end

get '/pvo/rdoc' do
  rdoc params['test'] # GET /pvo/rdoc?test=...
end

get '/pvo/asciidoc' do
  asciidoc params['test'] # GET /pvo/asciidoc?test=...
end

get '/pvo/markaby' do
  markaby params['test'] # GET /pvo/markaby?test=...
end

get '/pvo/nokogiri' do
  nokogiri params['test'] # GET /pvo/nokogiri?test=...
end

get '/pvo/slim' do
  slim params['test'] # GET /pvo/slim?test=...
end

get '/pvo/yajl' do
  yajl params['test'] # GET /pvo/yajl?test=...
end

get '/pvo/rabl' do
  rabl params['test'] # GET /pvo/rabl?test=...
end

post '/tde/request/:t' do
  t = %w[]
  test = request.accept.to_s+"\n"+
    request.preferred_type(t).to_s+"\n"+
    request.params.to_s+"\n"+
    request.get_header("test").to_s+"\n"+
    request.body.to_s+"\n"+
    request.script_name.to_s+"\n"+
    request.path_info.to_s+"\n"+
    request.query_string.to_s+"\n"+
    request.content_length.to_s+"\n"+
    request.user_agent.to_s+"\n"+
    request.referer.to_s+"\n"+
    request.authority.to_s+"\n"+
    request.cookies.to_s+"\n"+
    request.content_type.to_s+"\n"+
    request.host_authority.to_s+"\n"+
    request.host_with_port.to_s+"\n"+
    request.host.to_s+"\n"+
    request.hostname.to_s+"\n"+
    request.port.to_s+"\n"+
    request.forwarded_for.to_s+"\n"+
    request.forwarded_port.to_s+"\n"+
    request.forwarded_authority.to_s+"\n"+
    request.ip.to_s+"\n"+
    request.content_charset.to_s+"\n"+
    # request.form_data?.to_s+"\n"+
    request.GET.to_s+"\n"+
    request.POST.to_s+"\n"+
    request.params.to_s+"\n"+
    request.base_url.to_s+"\n"+
    request.url.to_s+"\n"+
    request.path.to_s+"\n"+
    request.fullpath.to_s+"\n"+
    request.accept_encoding.to_s+"\n"+
    request.accept_language.to_s+"\n"+
    request["test"].to_s+"\n"+
    request.env.to_s+"\n"+

    request.fetch_header('HTTP_USER_AGENT') do |k|
      test = test + k.to_s+"\n"
    end
  request.each_header do |k|
    test = test + k.to_s+"\n"
  end
  test
end

get "/pvo/body0" do
  body = params['test']
  [body] # GET /pvo/body0?test=%3Cimg%20src%3Dx%20onerror%3Dalert(1)%3E
end

get "/pvo/body1" do
  body params['test'] # GET /pvo/body1?test=%3Cimg%20src%3Dx%20onerror%3Dalert(1)%3E
end

get "/pvo/body2" do
  body params['test'] do |k|
    k # GET /pvo/body2?test=%3Cimg%20src%3Dx%20onerror%3Dalert(1)%3E
  end
end

get "/pvo/redirect" do
  redirect params['test'] # GET /pvo/redirect?test=https%3A%2F%2Fptsecurity.com%2F
end

get "/pvo/error" do
  error 200, params['test'] # GET /pvo/error?test=%3Cimg%20src%3Dx%20onerror%3Dalert(1)%3E
end

get "/pvo/not_found" do
  not_found params['test'] # GET /pvo/not_found?test=%3Cimg%20src%3Dx%20onerror%3Dalert(1)%3E
end

get "/pvo/headers0" do
  response.status = 302; headers params['test'] => "https://ptsecurity.com/" # GET /pvo/headers0?test=Location
end

get "/pvo/headers1" do
  response.status = 302; headers "Location" => params['test'] # GET /pvo/headers1?test=https%3A%2F%2Fptsecurity.com%2F
end

get "/tde/session/set" do
  session['test'] = params['test'] # GET /tde/session/set?test=%3Cimg%20src%3Dx%20onerror%3Dalert(1)%3E
  "/tde/session/set"
end

get "/tde/session/get" do
  session['test']
end

get "/pvo/send_file" do
  send_file params['test'] # GET /pvo/send_file?test=../../../../../../../../../../windows/win.ini
end

get "/pvo/back" do
  back # GET + `Referer: https://ptsecurity.com/`
end

before '/ep/after/:test' do |test|
  `#{test}` # GET /ep/after/calc.exe
end

after '/ep/before/:test' do |test|
  `#{test}` # GET /ep/before/calc.exe
end

get "/pvo/set_cookie" do
  response.set_cookie(params['name'], { domain: params['domain'],
                                        path: params['path'],
                                        max_age: params['max_age'],
                                        expires: Time.parse(params['expires']),
                                        secure: params['secure'],
                                        httponly: params['httponly'],
                                        same_site: params['same_site'],
                                        value: params['value']}) # GET /pvo/set_cookie?name=SESSID&domain=ptsecurity.com&path=%2Fhackerapp%2F&max_age=1000000&expires=2030-01-01&same_site=None&value=evilsessid
end

get "/pvo/add_header" do
  response.status = 302; response.add_header params['name'], params['value'] # GET /pvo/add_header?name=Location&value=https%3A%2F%2Fptsecurity.com%2F
end

get "/pvo/location=" do
  response.status = 302
  response.location = params['test'] # GET /pvo/location=?test=https%3A%2F%2Fptsecurity.com%2F
end

get "/pvo/set_cookie_header=" do
  response.set_cookie_header = params['test'] # GET /pvo/set_cookie_header=?test=SESSID%3Devilsessid
end

get "/pvo/[]=" do
  response.status = 302; response[params['name']] = params['value'] # GET /pvo/[]=?name=Location&value=https%3A%2F%2Fptsecurity.com%2F
end
