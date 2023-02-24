from configparser import ConfigParser
config = ConfigParser()
config.read('setup.cfg')
print(config['options']['install_requires']+config['options.extras_require']['develop'])