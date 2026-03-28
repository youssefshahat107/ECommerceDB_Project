USE master
GO

-------------------------
-- FULL BACKUP
-------------------------

BACKUP DATABASE ECommerceDB
TO DISK = 
'N'C:\Program Files\Microsoft SQL Server\MSSQL17.SERVER3\MSSQL\Backup\Full_ECommerceDB\Full_ECommerceDB.bak''
WITH 
INIT,
CHECKSUM,
STATS = 10
GO


-------------------------
-- DIFFERENTIAL BACKUP
-------------------------

BACKUP DATABASE ECommerceDB
TO DISK = 
'N'C:\Program Files\Microsoft SQL Server\MSSQL17.SERVER3\MSSQL\Backup\Diff_ECommerceDB\Diff_ECommerceDB.bak''
WITH 
DIFFERENTIAL,
INIT,
CHECKSUM,
STATS = 10
GO


-------------------------
-- LOG BACKUP
-------------------------

BACKUP LOG ECommerceDB
TO DISK = 
'N'C:\Program Files\Microsoft SQL Server\MSSQL17.SERVER3\MSSQL\Backup\Log_ECommerceDB\Log_ECommerceDB.trn''
WITH 
CHECKSUM,
STATS = 10
GO


-------------------------
-- RESTORE DATABASE
-------------------------

-- Step 1: Full

RESTORE DATABASE ECommerceDB
FROM DISK =
'N'C:\Program Files\Microsoft SQL Server\MSSQL17.SERVER3\MSSQL\Backup\Full_ECommerceDB\Full_ECommerceDB.bak''
WITH NORECOVERY
GO

-- Step 2: Differential

RESTORE DATABASE ECommerceDB
FROM DISK =
'N'C:\Program Files\Microsoft SQL Server\MSSQL17.SERVER3\MSSQL\Backup\Diff_ECommerceDB\Diff_ECommerceDB.bak''
WITH NORECOVERY
GO

-- Step 3: Log

RESTORE LOG ECommerceDB
FROM DISK =
'N'C:\Program Files\Microsoft SQL Server\MSSQL17.SERVER3\MSSQL\Backup\Log_ECommerceDB\Log_ECommerceDB.trn''
WITH RECOVERY
GO