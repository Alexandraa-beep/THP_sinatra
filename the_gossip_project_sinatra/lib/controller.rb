require 'gossip'
require 'pry'

class ApplicationController < Sinatra::Base # Création d'une classe ApplicationController qui hérite (<) de la classe Sinatra :: Base. Grâce à l'héritage, ApplicationController aura toutes les fonctionnalités que propose la classe Sinatra::Base (= toutes les fonctionnalités de base de Sinatra).

  get '/' do #L'appli Sinatra "si quelqu'un va sur l'URL'/', execute le code qui suit!"
    erb :index, locals: {gossips: Gossip.all} # fichier index.erb
  end

get '/gossips/new/' do 
    erb :new_gossip
  end
  
post '/gossips/new/' do
  Gossip.new(params["gossip_author"], params["gossip_content"]).save #crée la nouvelle instance de Gossip. Et en lui appliquant un .save, on veut qu'elle soit inscrite dans la base de donnée./ params : params est un hash qui va stocker temporairement les informations que nous envoie l'utilisateur. Cela peut être une information quand il fait un GET 
redirect '/' # redirect et qui dit à Sinatra "maintenant, redirige le user vers cette route". Ainsi, pour rediriger vers la route '/', il faudra écrire redirect '/'
  end

get '/gossips/:id/' do 
    
    erb :show, locals: {gossips: Gossip.find(params["gossip_author"])}
  end

  get '/gossips/:id/edit/' do 
    erb :edit
end 

  post '/gossips/edit/:id' do
    Gossip.update(id,params["gossip_author"],params["gossip_content"])
    redirect '/'
  end
end
