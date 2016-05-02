# Chef-GitSync Cookbook

Cookbook to synchronise Git repositories to a local disk and ensure they remain in sync.

## Usage

Intended to run in a production environment in order to synchronise the master branches of one or more repositories so that when changes are approved and merged they are promoted immediately to Production.

However you can synchronise any branch to any destination so this could have a variety of uses.

## Chef Zero configuration

### client.rb

```
cookbook_path 'C:\\Chef\\Cookbooks\\'
json_attribs 'C:\\Chef\\attributes.json'
chef_zero.enabled true
```

### attributes.json

```
{
	"run_list": [
		"recipe[chef-client::default]",
		"recipe[git::windows]",
		"recipe[git-to-disk::default]"
	],
	"chef_client": {
		"interval": "1800"
	},
	"stash-to-disk-sync": {
		"rootpath": "\\\\yourdomain.local\\code\\"
	}
		
}
```

##Dependencies

The above recipes require the following cookbooks be present:

- build-essential
- chef_handler
- chef-client
- cron
- dmg
- git
- logrotate
- seven_zip
- windows
- yum
- yum-epel
