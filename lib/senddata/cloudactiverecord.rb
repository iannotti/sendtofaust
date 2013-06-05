require "rubygems"
require "active_resource"
require "utils/cloudaccountingrecord"
require "common/faust_constants"

class CloudRecord < ActiveResource::Base
  self.format = :xml
end

class CloudSingleRecord
  def initialize(element)
    @element = element
    
  end
 
  def to_hash
    
    rh = {}
    rh[FaustCloudData.VMUUID] = @element[CloudAccountingRecord.VMUUID ]
    rh[FaustCloudData.LocalVMID] = @element[CloudAccountingRecord.MachineName]
    rh[FaustCloudData.Local_user] = @element[CloudAccountingRecord.LocalUserId]
    rh[FaustCloudData.Local_group] = @element[CloudAccountingRecord.LocalGroupId]
    rh[FaustCloudData.GlobalUserName] = @element[CloudAccountingRecord.GlobalUserName]
    rh[FaustCloudData.FQAN] = @element[CloudAccountingRecord.FQAN]
    rh[FaustCloudData.Status] = @element[CloudAccountingRecord.Status]
    rh[FaustCloudData.StartTime] = @element[CloudAccountingRecord.StartTime]
    rh[FaustCloudData.EndTime] = @element[CloudAccountingRecord.EndTime]
    rh[FaustCloudData.SuspendDuration] = @element[CloudAccountingRecord.SuspendDuration]
    rh[FaustCloudData.WallDuration] = @element[CloudAccountingRecord.WallDuration]
    rh[FaustCloudData.CpuDuration] = @element[CloudAccountingRecord.CpuDuration]
    rh[FaustCloudData.CpuCount] = @element[CloudAccountingRecord.CpuCount]
    rh[FaustCloudData.NetworkType] = @element[CloudAccountingRecord.NetworkType]
    rh[FaustCloudData.NetworkInbound] = @element[CloudAccountingRecord.NetworkInbound]
    rh[FaustCloudData.NetworkOutBound] = @element[CloudAccountingRecord.NetworkOutbound]
    rh[FaustCloudData.Memory] = @element[CloudAccountingRecord.Memory]
    rh[FaustCloudData.Disk] = @element[CloudAccountingRecord.Disk]
    rh[FaustCloudData.StorageRecordId] = @element[CloudAccountingRecord.StorageRecordId]
    rh[FaustCloudData.DiskImage] = @element[CloudAccountingRecord.ImageId]
    rh[FaustCloudData.CloudType] = @element[CloudAccountingRecord.CloudType]
   
    rh
    
    
  end
  
end  








 
  
  
  
  
  
  
  
  
