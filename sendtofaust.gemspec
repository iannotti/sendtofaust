# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sendtofaust/version'



Gem::Specification.new do |mygem|
  mygem.name          = "sendtofaust"
  mygem.version       = Sendtofaust::VERSION
  mygem.authors       = ["Laura Iannotti"]
  mygem.email         = ["laura.iannotti@to.infn.it"]
  mygem.description   = %q{Send the accounting data to the faust web application using a web service}
  mygem.summary       = %q{summary}
  mygem.homepage      = ""

  mygem.files = Dir['lib/**/*.rb'] + Dir['bin/*'] +Dir['conf/*']
  mygem.bindir        = 'bin'
  mygem.executables   = mygem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  mygem.test_files    = mygem.files.grep(%r{^(test|spec|features)/})
  
  mygem.require_paths  =["lib","conf"]
  
   
  mygem.has_rdoc      = true
 
  mygem.add_dependency "ldap2ssm"
  mygem.add_dependency "activeresource"
 
end
