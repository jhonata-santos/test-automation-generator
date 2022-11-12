require 'colorize'
require 'excon'
require 'json'
require 'lucky_case/string'
require 'yaml'
require 'pry'
require 'i18n'
require 'rake'
require 'rubocop'
require 'rubocop-checkstyle_formatter'

Dir[File.join(File.dirname(__FILE__), '../core/**/*.rb')].sort.each { |file| require file }

I18n.config.available_locales = :en
