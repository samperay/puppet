# Puppet

## Descriptions
Configure puppet/client on the server and write your own manifests to manage nodes, lets test to see if it all works. 

### Puppet master/client setup and testing 
centralized managemnt node on configuring would be compiled for configuration, files, templates,
and custom plugins to its managed nodes. Simple and default configuration file would be using the filename **puppet.conf**.  
Once you have installed your puppet master server, ensure your NTP is in sync. replace your pupper.conf from this git to your puppermater server **/etc/puppet/puppet.conf**.Ensure your services are up and running. Register your puppet client to your master server and its been able to comminicate. copy files of **puppet.conf ntp.conf** from master server to clients and make sure service is runing fine.  

Create a manifest **site.pp** which creates file in some folder if all your puppet master is working fine.  
Need to know more on implementation details ```http://sunlnx.blogspot.com/2016/11/installconfigure-puppet-serverpuppet.html```


### Pupper manifests/modules
we could configure different puppet modules for different **environment**(developemnt, testing, pre-production, producton .. etc) and to achieve we need to deficen environment path to be defined in config files. Create two directories for produciton and testing and you could download enviroment to place in */etc/puppet/environment* we would test by creating a file from different environments. 

How to implement details can be found in ```http://sunlnx.blogspot.com/2016/11/puppet-manifests-and-modules-in.html```  

I tried to dockerize both and created a image so as to save time and not to re-configure or re-install. you could test using the containers and once your testings are completed can be removed. If you have installed docker try to pull both the images and start to fireup the containers  

```docker pull sunlnx/puppetmaster```
```docker pull sunlnx/puppetclient```  

### Fire your containers interactively    

#### puppetmaster  
```docker run -it --name puppetmaster --hostname puppetmaster.example.com sunlnx/puppetmaster /bin/bash```  
```service puppetmaster restart```  

#### puppetclient  
```docker run -it --name puppetclient --hostname puppetclient.example.com sunlnx/puppetclient /bin/bash```
