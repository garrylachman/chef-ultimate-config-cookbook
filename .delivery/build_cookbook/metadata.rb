name 'build_cookbook'
maintainer 'Garry Lachman'
maintainer_email 'garry@lachman.co'
license 'mit'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)

depends 'delivery-truck'
