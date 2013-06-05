require 'securerandom'

get '/' do
  # Look in app/views/index.erb
  @urls = Url.all
  erb :index
end

#stops to increase counter by 1
get '/:id' do
  
  @url = Url.find(params[:id])
  @counter = @url.counter += 1
  @url.update_attribute(:counter, @counter)

  redirect "#{@url.original_url}"
end

#user input url creates new in db
post '/' do
  @original_url = params[:input_url]
  @shortened_url = "key.c/#{SecureRandom.hex(3)}"
  @errors = []
  @url = Url.create(:original_url => @original_url, :short_url => @shortened_url, :counter => 0)
  
  if @url.errors.full_messages.length > 0
    @errors = @url.errors.full_messages
    erb :index
  else
    redirect '/'
  end

  
end
