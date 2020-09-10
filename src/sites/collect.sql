WITH 
    unique_site_references AS (
    SELECT 
        DISTINCT Site 
    FROM
        -- historic_zed3_importing 
        @{pipeline().parameters.TransferTableName}	
    -- WHERE
        -- Site not in select distinct internal_id from Sites
    )
SELECT 
    s.Site,
    newid() UniqueId,
    (select top 1 c.id from Clients c where c.internal_id = a.Client) ClientId,
    a.Client,
    a.Address1,
    a.Address2,
    a.Address3,
    a.[Premises Name],
    a.City,
    a.[Post Code]
FROM 
    unique_site_references s
CROSS APPLY (
    SELECT
    top 1 i.* 
    FROM
    -- historic_zed3_importing 
        @{pipeline().parameters.TransferTableName} i
    WHERE
        i.Site = s.Site
) a
