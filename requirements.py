import configparser
c = configparser.ConfigParser()
c.read('setup.cfg')
print(c['options']['install_requires']+c['options.extras_require']['develop'])
