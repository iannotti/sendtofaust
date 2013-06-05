require "rubygems"
require "rexml/document"
require "utils/cloudaccountingrecord"

class CloudParser
  
  @@Separator = ':'
  @@Record_Separator = "%%"
  
  def initialize(fileName_in) 
      @fileName = fileName_in
  end
  
  def parseFile
    
    $LOG.debug("entering parseFile, file name: #{@fileName}" )
    propsArray = []
    properties = {}
    if !File.exist?(@fileName)
        $LOG.error("The file #{properties_filename} does'nt exist!! ")
        raise Exception => "The file #{properties_filename} does'nt exist!! "
     end
     
     File.open(@fileName, 'r') do |properties_file|
       
      properties_file.read.each_line do |line|
        
        line.strip!
        if (line[0] != ?# and line[0] != ?= )
          i = line.index(@@Separator)
          if (i)
            properties[line[0..i - 1].strip] = line[i + 1..-1].strip
            puts "LLLLLLLLLL "+ line[0..i - 1].strip + " -------- "+ line[i + 1..-1].strip
          elsif(line.start_with?(@@Record_Separator))
            propsArray << GeneralUtils.Copyhash(properties)
            properties = {}
          else
            properties[line] = ''
          end
        end
      end
     end
     $LOG.debug("FILE " + @fileName)
     i = 0
      propsArray.each do |element| 
      element.each do |key, value|
       $LOG.debug("#{i} - " + key + " - " + value)
      end
      i +=1
     end

      propsArray
   end
   private

   def cleanHash(element)
     element[CloudAccountingRecord.CloudMessage] = nil
     element[CloudAccountingRecord.VMUUID] = nil
     element[CloudAccountingRecord.MachineName] = nil
     element[CloudAccountingRecord.LocalUserId] = nil
     element[CloudAccountingRecord.LocalGroupId] = nil
     element[CloudAccountingRecord.GlobalUserName] = nil
     element[CloudAccountingRecord.FQAN] = nil
     element[CloudAccountingRecord.Status] = nil
     element[CloudAccountingRecord.StartTime] = nil
     element[CloudAccountingRecord.EndTime] = nil
     element[CloudAccountingRecord.SuspendDuration] = nil
     element[CloudAccountingRecord.WallDuration] = nil
     element[CloudAccountingRecord.CpuDuration] = nil
     element[CloudAccountingRecord.CpuCount] = nil
     element[CloudAccountingRecord.NetworkType] = nil
     element[CloudAccountingRecord.NetworkInbound] = nil
     element[CloudAccountingRecord.NetworkOutbound] = nil
     element[CloudAccountingRecord.Memory] = nil
     element[CloudAccountingRecord.Disk] = nil
     element[CloudAccountingRecord.StorageRecordId] = nil
     element[CloudAccountingRecord.ImageId] = nil
     element[CloudAccountingRecord.CloudType] = nil
     element[CloudAccountingRecord.EndRecord] = nil
     element[CloudAccountingRecord.KeyValueSep] = nil

   end
    
  
end