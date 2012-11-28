-- Look at Current Trace Flags
dbcc tracestatus()

--DBCC TRACEON (1204, 3605, -1)
--1204 to record deadlocks
--3605 send it to the error log
--  -1  to apply to all sessions
-- Turn if off with the TraceOff command
--DBCC TRACEOFF (1204, 3605, -1)


--Create a deadlock Victim.
--Run this in 1 window
SET DEADLOCK_PRIORITY LOW ;
GO
BEGIN TRANSACTION

UPDATE dbo.locking
--SELECT * FROM dbo.locking
SET whattolock = 'scott'
WHERE rowid = 2;

WAITFOR DELAY '00:00:10'

UPDATE dbo.locking
SET whattolock = 'scott'
WHERE rowid = 2

Select  * from dbo.locking
--COMMIT TRANSACTION


--Run this in a second window
BEGIN TRANSACTION

UPDATE dbo.locking
--SELECT * FROM dbo.locking
SET whattolock = 'scott'
WHERE rowid = 2;

WAITFOR DELAY '00:00:10'

UPDATE dbo.locking
SET whattolock = 'scott'
WHERE rowid = 2

Select  * from dbo.locking
--COMMIT TRANSACTION
