# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "dw-theme"
  spec.version       = "0.1.0"
  spec.authors       = ["bohdan.shkabriy"]
  spec.email         = ["bodyanua@gmail.com"]

  spec.summary       = "Write a short summary, because Rubygems requires one."
  spec.homepage      = "http://localhost:4000"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select do |f|
    f.match(%r{^((_includes|_layouts|_sass|assets)/|(LICENSE|README)((\.(txt|md|markdown)|$)))}i)
  end
  
  spec.add_runtime_dependency "jekyll", "~> 3.8"

  spec.add_development_dependency "bundler", "~> 2.0.0"
  spec.add_development_dependency "rake", "~> 12.0"
end
