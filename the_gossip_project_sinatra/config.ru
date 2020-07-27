require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'controller'

run ApplicationController

# Les lignes demandent simplement au serveur d'exécuter le contenu de la classe ApplicationController.