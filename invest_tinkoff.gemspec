lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'invest_tinkoff/version'

Gem::Specification.new do |s|
  s.name        = 'invest_tinkoff'
  s.version     = '0.9.0'
  s.date        = '2022-05-23'
  s.summary     = 'invest_tinkoff'
  s.description = 'Tinkoff Invest Ruby Rest API Gem'
  s.authors     = ['Alexander Kalinichev']
  s.email       = 'alexander.kalinichev@gmail.com'
  s.files       = Dir.glob("{bin,lib}/**/*")
  s.require_paths = ['lib']
  s.homepage    = 'https://github.com/blackchestnut/invest_tinkoff'
  s.license     = 'MIT'
end
