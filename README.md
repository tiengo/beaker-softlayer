# beaker-softlayer

[Beaker's](https://github.com/puppetlabs/beaker) plugin that adds [Softlayer](http://www.softlayer.com/) as a hypervisor.

## USAGE:

First off all, you need a validated Softlayer account and your API key generated.


## Nodeset example

```yaml
HOSTS:
  debian-7-x64:
    roles:
      - master
    platform: debian-78-x86_64
    hypervisor: softlayer
    flavor_id: m1.tiny
    image_id: 0ae9e8bf-e5d0-455a-b4fc-181087e6f8f1
    datacenter: wdc01
    domain: 'beaker.me'
CONFIG:
  type: git
  softlayer_username: #{yoursoftlayerusername}
  softlayer_api_key: #{yoursoftlayerapi}
```