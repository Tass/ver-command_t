SPEC = Gem::Specification.new do |s|
  s.name = "ver-command_t"
  s.version = "0.1"
  s.date = "2010-08-24"
  s.author = "Simon Hafner"
  s.email = "hafnersimon@gmail.com"
  s.homepage = "http://github.com/Tass/ver-command_t"
  s.summary = "ver adaptation of the CommandT plugin for vim"
  s.files = Dir["{lib,ext,benchmarks,test}/**/*"] + ['LICENSE', 'README.md'] - ['ext/Makefile', 'ext/barracuda.o']
  s.test_files = Dir['spec/**/*']
  s.require_paths = ['ext', 'lib']
  s.extensions    = ['ext/extconf.rb']
end
