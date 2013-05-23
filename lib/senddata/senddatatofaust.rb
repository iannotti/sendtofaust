require "rubygems"
require 'parse/starparser'
require 'senddata/storageactiverecord'

class SendDataToFaust
@@FileExt = ".done"
def initialize
  @path = $INPUT_XMLFILES_PATH
  @pathfull = $INPUT_XMLFILES_PATH + File::SEPARATOR
end
def sendAllData
  
  Dir.foreach(@path) do |item|
    next if item == '.' or item == '..' or item[/#{@@FileExt}/]
      fileName = @pathfull + item
    begin
    parse = StarParser.new(fileName)
      
    elements = parse.parseFile
    
    sendData(elements)
    #      set the file extention to done 
    FileUtils.mv(fileName,fileName +@@FileExt) 
    rescue  Exception => e
      next
    end
       
  end
end

def cleanFiles
  puts "qui " + @path + " - " + @pathfull
  Dir.foreach(@path) do |item|
     next if ! item[/#{@@FileExt}/]
     iLast = item.to_s.rindex(@@FileExt)
     itemNew = item.slice(0,iLast)
     FileUtils.mv(@pathfull + item, @pathfull + itemNew)
   end

end

private
def sendData(elements)
  
  EmiStorageRecord.site=$REMOTE_HOST
  puts "Token token=\"#{$TOKEN}\""
  EmiStorageRecord.headers['Authorization']="Token token=\"#{$TOKEN}\""
  EmiStorageRecord.timeout=$TIMEOUT.to_i
  EmiStorageRecord.proxy=""
  
  elements.each do |element|
    
    begin
      
      rowBuff = StorageRecord.new(element)
      row = EmiStorageRecord.new(rowBuff.to_hash)
      row.save
      if !row.valid?
        $LOG.error("Not valid row:  #{row.errors.full_messages}")
        next
##        raise Exception => "Not valid row:  #{row.errors.full_messages}"
      end
    rescue Exception => e
      $LOG.error("Error sending data: #{e.to_s}")
      next
##      raise Exception => e
    end
    
  end
end
end