Gem::Specification.new do |s|
    s.name               = 'mixItRuby'
    s.version            = '0.0.0'
    s.date               = '2014-05-25'
    s.summary            = "MixItRuby! mixes json in erb + CLI"
    s.description        = "A gem for mixing a nested json structure in erb files"
    s.authors            = ["Erhard Karger"]
    s.email              = 'erhard@kargers.org'
    s.homepage           = 'http://rubygems.org/gems/mixItRuby'
    s.license            = 'MIT'
    git_files            = `git ls-files`.split("\n") rescue ''
    s.files              = git_files 
    s.test_files         = `git ls-files -- {test,spec,features}/*`.split("\n")
    s.executables        = %w(mixit)
    s.require_paths      = ["lib"]
end
