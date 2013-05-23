require "rubygems"
require "active_resource"
require "common/faust_constants"

class EmiStorageRecord < ActiveResource::Base
  self.format = :xml
end

class StorageRecord
  def initialize(element)
    @element = element
    
  end
 
  def to_hash
    
    rh = {}
    rh[FaustStorageData.RecordIdentity] = @element[SRecords.RecordId]
    rh[FaustStorageData.Site] = @element[SRecords.Site]
    rh[FaustStorageData.StorageMedia] = @element[SRecords.StorageMedia]
    rh[FaustStorageData.StorageShare] = @element[SRecords.StorageShare]
    rh[FaustStorageData.StorageClass] = @element[SRecords.StorageClass]
    rh[FaustStorageData.DirectoryPath] = @element[SRecords.DirectoryPath]
    rh[FaustStorageData.ResourceCapacityUsed] = @element[SRecords.ResourceCapacityUsed]
    rh[FaustStorageData.ResourceCapacityAllocated] = @element[SRecords.Resourcecapacityalloc]
    rh[FaustStorageData.StorageSystem] = @element[SRecords.StorageSystem]
    rh[FaustStorageData.Group] = @element[SRecords.Group]
    rh[FaustStorageData.StartTime] = @element[SRecords.StartTime]
    rh[FaustStorageData.EndTime] = @element[SRecords.EndTime]
    rh
    
  end
  
end