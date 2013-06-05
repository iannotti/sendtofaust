require "rubygems"
require 'fileutils'
require 'logger'
require 'utils/general'


currentDir =File.dirname(__FILE__).to_s + "/../../"

$CONF_DIR = currentDir + "conf"



#get data to send to faust (remove from here to split the program
config_file = $CONF_DIR + File::SEPARATOR + "faust.properties"
faust_properties = GeneralUtils.LoadProperties(config_file)
logfilename = faust_properties["logfile"]
$CONFIG_FILE = config_file
$LOG =  Logger.new(STDOUT)
if logfilename.nil?
  $LOG =  Logger.new(STDOUT)
else
   if !File.exist?(logfilename)
    GeneralUtils.CheckDir(File.dirname(logfilename))
    FileUtils.touch(logfilename)
  end
  $LOG =  Logger.new(logfilename.to_s)
end
$LOG.level=Logger::DEBUG

$REMOTE_HOST= faust_properties["uri"]

if $REMOTE_HOST.nil?
  $LOG.error("remote host to send the data must be provided")
  exit($EXIT_FATAL)
end
  
$INPUT_STORAGE = faust_properties["input_storage"]
$TOKEN_STORAGE = faust_properties["token_storage"]
$TIMEOUT = faust_properties["timeout"]
if $TIMEOUT.nil?
  $TIMEOUT = 10
end
$INPUT_CLOUD = faust_properties["input_cloud"]
$TOKEN_CLOUD = faust_properties["token_cloud"]
