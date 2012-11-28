use hellotekpub
GO

-- Use the below to generate a bunch of backup entries in the 
-- logs.  You might need to run a full backup first.
Declare @looper int = 1

While @looper < 800
BEGIN

update dbo.locking
SET whattolock = 'rob'
where rowid = 1;

SET @looper += 1;

BACKUP LOG [hellotekpub] TO  DISK = N'C:\_sqlserverdbs\tlogbackups\tlog.bak' WITH FORMAT, INIT, NAME = N'hellotekpub-Transaction Log  Backup', COMPRESSION;

WAITFOR DELAY '00:00:01'

END




/*  Full backup?  Here you go!
BACKUP DATABASE [hellotekpub] TO  DISK = N'C:\_sqlserverdbs\hellotekpub.bak' WITH NOFORMAT, INIT,  NAME = N'hellotekpub-Full Database Backup', SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10
GO

*/