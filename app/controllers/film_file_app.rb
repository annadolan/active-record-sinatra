class FilmFile < Sinatra::Base
attr_reader :id
set :method_override, true

  get '/' do
    @films = Film.all
    erb :dashboard
  end

  get '/films' do
    @films = Film.all
    erb :films_index
  end

  get '/films/new' do
    erb :new
  end

  post '/films' do
    film = Film.new({"title"=>params[:film][:title], "year"=>params[:film][:year].to_i, "box_office_sales"=>params[:film][:box_office_sales]})
    film.save
    redirect '/films'
  end

  get '/genres' do
    @genres = Genre.all
    erb :genres_index
  end

  get '/directors' do
    @directors = Director.all
    erb :directors_index
  end

  get '/directors/:id' do
    @director = Director.find(params[:id])
    erb :show
  end

  get '/films/:id' do
    @film = Film.find(params[:id])
    erb :show_film
  end

  get '/films/:id/edit' do
    @film = Film.find(params[:id])
    erb :edit
  end

  put '/films/:id' do |id|
    Film.update(id.to_i, params[:film])
    redirect "/films/#{id}"
  end

  delete '/films/:id' do |id|
    Film.destroy(id.to_i)
    redirect '/films'
  end
end
