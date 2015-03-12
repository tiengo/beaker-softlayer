require 'fog'

module Beaker

  class Softlayer < Beaker::Hypervisor

    SLEEPWAIT = 5

    def initialize(softlayer_hosts, options)
      @options = options
      @logger = options[:logger]
      @hosts = softlayer_hosts
      @vms = []
      @softlayer_username = @options[:softlayer_username]
      @softlayer_api_key = @options[:softlayer_api_key]
      @sl ||= ::Fog::Compute.new ({:provider => "softlayer",
                                               :softlayer_username => @softlayer_username,
                                               :softlayer_api_key => @softlayer_api_key,
                                 })
    end
  
    def provision
      @hosts.each do |host|
        host[:vmhostname] = generate_host_name
        @logger.notify "Provisioning Softlayer #{host} compute instance"
        opts = {
          :name       => host[:vmhostname],
          :flavor_id  => host[:flavor_id],
          :image_id   => host[:image_id],
          :datacenter => host[:datacenter],
          :domain     => host[:domain],
          :key_pairs  => [ @sl.key_pairs.first ],
        }
        vm = @sl.servers.create(opts)

        @logger.notify "Waiting for #{host.name} (#{host[:vmhostname]}) to respond"
        vm.wait_for { ready? }
        host[:ip] = vm.public_ip_address
        @vms << vm
      end
    end
  
    def cleanup
      @logger.notify "Cleaning Softlayer created instances"
      @vms.each do |vm|
          @logger.notify "Destroying host: #{vm.name}"
          vm.destroy
      end
    end
  end
end