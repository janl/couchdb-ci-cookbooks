case node["platform"]
when "centos","fedora"

  rpm_forge = "rpmforge-release-0.5.2-2.el6.rf.#{node["kernel"]["machine"]}.rpm"

  remote_file "/tmp/#{rpm_forge}" do
    source "http://packages.sw.be/rpmforge-release/#{rpm_forge}"
  end

  rpm_package "/tmp/#{rpm_forge}"

  cookbook_file "/etc/yum.repos.d/erlang.repo" do
    source "centos-erlang.repo"
  end

  packages = ["help2man", "python-sphinx", "python-docutils", "python-pygments", "texlive-latex", "texlive-texmf-fonts",
              "texinfo", "gnupg", "autoconf", "automake", "libtool", "perl-Test-Harness",
              "esl-erlang", #"erlang-etap", "erlang-erts", "erlang-os_mon", "erlang-eunit",
              "libicu-devel", "js-devel", "curl-devel",
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
