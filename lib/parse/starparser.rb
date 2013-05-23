require "rubygems"
require "rexml/document"
require "common/constants"

class StarParser
  
  def initialize(fileName_in) 
    @fileName = fileName_in
    
  end
  def parseFile
      file = File.new( @fileName )
      doc = REXML::Document.new file 
      elements = []
      doc.elements.each("#{SRecords.StorageUsageRecords}/#{SRecords.StorageUsageRecord}") do |s|
      element = {}
            
      [SRecords.Site,
       SRecords.StorageMedia,
       SRecords.StorageShare,
       SRecords.StorageClass,
       SRecords.DirectoryPath,
       SRecords.ResourceCapacityUsed,
       SRecords.Resourcecapacityalloc,
       SRecords.StorageSystem,
       SRecords.StartTime,
       SRecords.EndTime ].each do |a|
        element[a] = s.elements[a].text 
       end
       [SRecords.CreateTime, SRecords.RecordId].each do |a|
          element[a] = s.elements[SRecords.RecordIdentity].attributes[a]
       end
       [SRecords.Group].each do |a|
          element[a] = s.elements[SRecords.SubjectIdentity].elements[a].text
       end
        
       elements << element
      end
      i = 0
      $LOG.debug("FILE " + @fileName)
      elements.each do |element| 
        element.each do |key, value|
          $LOG.debug("#{i} - " + getKey(key) + " - " + value)
        end
        i +=1
      end
      elements
end
  
  private 
  def getKey(fullName)
    iFirst = SRecords.FullPrefix.size
    iLast = fullName.size
    name = fullName.slice(iFirst,iLast)

  end
  
  
end

