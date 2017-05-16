# Hace require de los gems necesarios.
# Revisa: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Require gems we care about
require 'rubygems'

require 'uri'
require 'pathname'

require 'pg'
require 'active_record'
require 'logger'

require 'sinatra'
require "sinatra/reloader" if development?

require 'erb'

require 'twitter'

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

# Configura los controllers y los helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'uploaders', '*.rb')].each { |file| require file }

# Configura la base de datos y modelos 
require APP_ROOT.join('config', 'database')


     credenciales = YAML.load_file(File.join('config', 'credenciales.yml'))

credenciales.each do |key, value|
  #llenamos el hash ENV con los keys y values del archivo twitter.yaml
  ENV[key] = value
end


  $client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV["consumer_key"]
    config.consumer_secret     = ENV["consumer_secret"]
    config.access_token        = ENV["access_token"]
    config.access_token_secret = ENV["access_token_secret"]

end
#se configura el archivo de manera que la variable credenciales traera del archivo yaml los datos
# de las credenciales colocamos la ruta le asignamos el valor y la iteramos como key y values que asu vez 
# ietramos y colocamos el value entre comiilas de esta manera nos conectamos con twitter.