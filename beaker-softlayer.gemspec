# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "beaker-softlayer"
  s.version     = '0.0.1'
  s.authors     = ["Andre Tiengo"]
  s.email       = ["andretiengo@gmail.com"]
  s.homepage    = "https://github.com/tiengo/beaker-softlayer"
  s.summary     = %q{Let's test Puppet, using Softlayer!}
  s.description = %q{Puppetlabs accceptance testing harness, using Softlayer as a hypervisor}
  s.license     = 'Apache2'

  s.files         = [ "lib/beaker/hypervisor/softlayer.rb" ]
  s.require_paths = [ "lib" ]

end