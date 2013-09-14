require 'sinatra'
require 'json'
require 'mongo'

get '/hi' do

	seed = [
		{
			'nome' => params["nome"] , 
			'sobrenome' => params["sobrenome"] , 
			'email' => params["email"] , 
			'senha' => params["senha"] 
		}
	]
	
	uri = "mongodb://localhost/test"
	client = Mongo::MongoClient.from_uri(uri)

	db_name = uri[%r{/([^/\?]+)(\?|$)}, 1]
	
	db = client.db(db_name)

	Users = db.collection("Users")

	Users.insert(seed)
	client.close()
	
end