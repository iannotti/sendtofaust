require "rubygems"

class FaustStorageData
  
  @@AttributeType = "attributeType"
  @@DirectoryPath = "directoryPath"
  @@EndTime = "endTime"
  @@FileCount = "fileCount"
  @@Group = "group"
  @@GroupAttribute = "groupAttribute"
  @@LocalGroup = "localGroup"
  @@LocalUser = "localUser"
  @@LogicalCapacityUsed = "logicalCapacityUsed"
  @@RecordIdentity = "recordIdentity"
  @@ResourceCapacityAllocated = "resourceCapacityAllocated"
  @@ResourceCapacityUsed = "resourceCapacityUsed"
  @@Site = "site"
  @@StartTime = "startTime"
  @@StorageClass = "storageClass"
  @@StorageMedia = "storageMedia"
  @@StorageShare = "storageShare"
  @@StorageSystem = "storageSystem"
  @@UserIdentity = "userIdentity"
  
  def FaustStorageData.AttributeType
    @@AttributeType
  end
  def FaustStorageData.DirectoryPath
    @@DirectoryPath
  end
  def FaustStorageData.EndTime
    @@EndTime
  end
  def FaustStorageData.FileCount
    @@FileCount
  end
  def FaustStorageData.Group
    @@Group
  end
  def FaustStorageData.GroupAttribute
    @@GroupAttribute
  end
  def FaustStorageData.LocalGroup
    @@LocalGroup
  end
  def FaustStorageData.LocalUser
    @@LocalUser
  end
  def FaustStorageData.LogicalCapacityUsed
    LogicalCapacityUsed
  end
  def FaustStorageData.RecordIdentity
    @@RecordIdentity
  end
  def FaustStorageData.ResourceCapacityAllocated
    @@ResourceCapacityAllocated
  end
  def FaustStorageData.ResourceCapacityUsed
    @@ResourceCapacityUsed
  end
  def FaustStorageData.Site
    @@Site
  end
  def FaustStorageData.StartTime
    @@StartTime
  end
  def FaustStorageData.StorageClass
    @@StorageClass
  end
  def FaustStorageData.StorageMedia
    @@StorageMedia
  end
  def FaustStorageData.StorageShare
    @@StorageShare
  end
  def FaustStorageData.StorageSystem
    @@StorageSystem
  end
  def FaustStorageData.UserIdentity
    @@UserIdentity
  end
end
  
  
class DataType
 STORAGE = 1
 CLOUD = 2
 
end

class FaustCloudData
    @@FQAN = "FQAN"
    @@VMUUID = "VMUUID"
    @@CloudType = "cloudType"
    @@CpuCount = "cpuCount" 
    @@CpuDuration = "cpuDuration"
    @@Disk = "disk" 
    @@DiskImage = "diskImage"
    @@EndTime = "endTime"
    @@GlobalUserName = "globaluserName"
    @@LocalVMID = "localVMID"
    @@Local_group = "local_group"
    @@Local_user = "local_user"
    @@Memory = "memory"
    @@NetworkInbound = "networkInbound"
    @@NetworkOutBound = "networkOutBound"
    @@NetworkType = "networkType"
    @@Publisher_id  = "publisher_id"
    @@StartTime = "startTime"
    @@Status = "status"
    @@StorageRecordId = "storageRecordId"
    @@SuspendDuration = "suspendDuration"
    @@WallDuration = "wallDuration"
     
    def FaustCloudData.FQAN
      @@FQAN
    end
    def FaustCloudData.VMUUID
      @@VMUUID
    end
    def FaustCloudData.CloudType
      @@CloudType
    end
    def FaustCloudData.CpuCount
      @@CpuCount
    end
    def FaustCloudData.CpuDuration
      @@CpuDuration
    end
    def FaustCloudData.Disk
      @@Disk
    end
    def FaustCloudData.DiskImage
      @@DiskImage
    end
    def FaustCloudData.EndTime
      @@EndTime
    end
    def FaustCloudData.GlobalUserName
      @@GlobalUserName
    end
    def FaustCloudData.LocalVMID
      @@LocalVMID
    end
    def FaustCloudData.Local_group
      @@Local_group
    end
    def FaustCloudData.Local_user
      @@Local_user
    end
    def FaustCloudData.Memory
      @@Memory
    end
    def FaustCloudData.NetworkInbound
      @@NetworkInbound
    end
    def FaustCloudData.NetworkOutBound
      @@NetworkOutBound
    end
    def FaustCloudData.NetworkType
      @@NetworkType
    end
    def FaustCloudData.Publisher_id
      @@Publisher_id
    end
    def FaustCloudData.StartTime
      @@StartTime
    end
    def FaustCloudData.Status
      @@Status
    end
    def FaustCloudData.StorageRecordId
      @@StorageRecordId
    end
    def FaustCloudData.SuspendDuration
      @@SuspendDuration
    end
    def FaustCloudData.WallDuration
      @@WallDuration
    end
     
      
  
end