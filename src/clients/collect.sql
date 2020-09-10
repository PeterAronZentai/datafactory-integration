select 
    Client, 
    newid() UniqueId 
from 
    @{pipeline().parameters.TransferTableName} 
GROUP BY Client