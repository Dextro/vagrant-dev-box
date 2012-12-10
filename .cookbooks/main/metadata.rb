maintainer       "Bert Pattyn"
maintainer_email "github@dextrose.be"
license          "MIT"
description      "Main cookbook to initiate the recipes"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

%w{ apt vim git curl ack tmux dkms lsof }.each do |cookbook|
  depends cookbook
end