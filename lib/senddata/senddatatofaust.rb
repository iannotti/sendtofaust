require "rubygems"
require 'parse/storageparser'
require 'parse/cloudparser'
require 'senddata/storageactiverecord'
require 'senddata/cloudactiverecord'

class SendDataToFaust
@@FileExt = ".done"
def initialize(data_type, path_in = nil, token = "" )
  if  path_in != nil
    @path = path_in
    @pathfull = path_in + File::SEPARATOR
  end
  @token = token
  @datatype = data_type
  
end

def sendData
  
  Dir.foreach(@path) do |item|
    next if item == '.' or item == '..' or item[/#{@@FileExt}/]
      fileName = @pathfull + item
    begin
      case @datatype
      when DataType::STORAGE
        parse = StorageParser.new(fileName)
        elements = parse.parseFile
        sendSrData(elements)
      when DataType::CLOUD
        parse = CloudParser.new(fileName)
        elements = parse.parseFile

        sendCloudData(elements)
      else
        $LOG.error("Data Type not valid:  #{@datatype}")
        raise ArgumentError, 'Data Type not valid:  #{@datatype}'
        
      end
    
    #      set the file extention to done 
    FileUtils.mv(fileName,fileName +@@FileExt) 
    rescue  Exception => e
      next
    end
  end
end

def cleanFiles
  Dir.foreach(@path) do |item|
     next if ! item[/#{@@FileExt}/]
     iLast = item.to_s.rindex(@@FileExt)
     itemNew = item.slice(0,iLast)
     FileUtils.mv(@pathfull + item, @pathfull + itemNew)
   end

end

private
def sendSrData(elements)
  
  EmiStorageRecord.site=$REMOTE_HOST
  $LOG.debug "Token token=\"#{@token}\""
  EmiStorageRecord.headers['Authorization']="Token token=\"#{@token}\""
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
  def sendCloudData(elements)
    
    CloudRecord.site=$REMOTE_HOST
    puts @token
    $LOG.debug "Token token=\"#{@token}\""
    CloudRecord.headers['Authorization']="Token token=\"#{@token}\""
    CloudRecord.timeout=$TIMEOUT.to_i
    CloudRecord.proxy=""
     
    elements.each do |element|
      
      begin
        
        rowBuff = CloudSingleRecord.new(element)
        row = CloudRecord.new(rowBuff.to_hash)
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