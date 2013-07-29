# Cookbooks for ci

```
gem install berkshelf
berks install --path vendor/cookbooks
```

Install chef on the server/node:

```
sudo true && curl -L https://www.opscode.com/chef/install.sh | sudo bash
```

## Testing cookbooks

Install Vagrant via a [downloader](http://downloads.vagrantup.com/).

```
vagrant plugin install vagrant-berkshelf
vagrant up
```

