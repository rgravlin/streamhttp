require 'thin'
require 'uri'
require 'bundler/setup'
require 'sinatra'
require 'utf8-cleaner'

# Prevents UTF8 parsing errors
use UTF8Cleaner::Middleware

# Fixes Docker STDOUT logging
$stdout.sync = true

set :server_settings, :timeout => 3600
set :protection, true
set :server, :thin
disable :show_exceptions, :raise_errors, :dump_errors

get '/' do
  stream do |out|
    out << "check it out.\n"
    sleep 1
    out << "ya sumbitch.\n"
    sleep 2
    out << "it streams!\n"
  end
end
