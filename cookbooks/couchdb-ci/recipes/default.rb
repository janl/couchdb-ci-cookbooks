case node["platform"]
when "CentOS","Fedora"
  packages = ["help2man", "python-sphinx", "python-docutils", "python-pigments", "texlive-latex", "texlive-latex-fonts",
              "texinfo", "gnupg", "autoconf", "automake", "autoconf-archive", "libtool", "perl-Test-Harness",
              "erlang-etap", "erlang-erts", "erlang-os_mon", "erlang-eunit", "libicu-devel", "js-devel", "curl-devel",
              "git"]
  package_provider = Chef::Provider::Package::Yum
else
  Chef::Log.error("#{node["platform"]} is currently not supported")
  raise
end

packages.each do |package_name|
  package "Installing #{package_name} via #{package_provider}" do
    name package_name
    provider package_provider
  end
end
