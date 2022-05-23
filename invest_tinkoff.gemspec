lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'invest_tinkoff/version'

Gem::Specification.new do |s|
  s.name        = 'invest_tinkoff'
  s.version     = InvestTinkoff::VERSION
  s.platform    = Gem::Platform::RUBY
  s.date        = '2022-05-23'
  s.summary     = 'invest_tinkoff'
  s.description = 'Tinkoff Invest Ruby Rest API Gem'
  s.authors     = ['Alexander Kalinichev']
  s.email       = 'alexander.kalinichev@gmail.com'
  s.files       = Dir.glob("{bin,lib}/**/*")
  s.require_paths = ['lib']
  s.homepage    = 'https://github.com/blackchestnut/invest_tinkoff'
  s.license     = 'MIT'

  s.required_ruby_version = '>= 2.3.0'

  s.add_runtime_dependency 'httparty', '~> 0.20', '>= 0.20.0'
end
