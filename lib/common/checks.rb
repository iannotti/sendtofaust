require "rubygems"

def checkStorageInput
if $INPUT_STORAGE.nil?
  $LOG.error("the directory with input files must be provided, check the #{$CONFIG_FILE} file")
  raise Exception => "the directory with input files must be provided, check the #{$CONFIG_FILE} file"
end
 if $TOKEN_STORAGE.nil?
    $LOG.error("the token value must be provided, check the #{$CONFIG_FILE} file")
    raise Exception => "the token value must be provided, check the #{$CONFIG_FILE} file"
 end
end
def checkCloudInput
if $INPUT_STORAGE.nil?
  $LOG.error("the directory with input files must be provided, check the #{$CONFIG_FILE} file")
  raise Exception => "the directory with input files must be provided, check the #{$CONFIG_FILE} file"
end
 if $TOKEN_STORAGE.nil?
    $LOG.error("the token value must be provided, check the #{$CONFIG_FILE} file")
    raise Exception => "the token value must be provided, check the #{$CONFIG_FILE} file"
 end
end
