DBCC TRACESTATUS

Pretty valuable flags - 
610     1     1     0  - minimal loggings
3226     1     1     0  - Don't throw backups into main logs
4199     1     1     0 -  allow query plans to use latest fixes

--2371 -  Changes to automatic update stats

;-T3226;-T610;-T4199



http://serverfault.com/questions/29393/easier-way-to-remember-trace-flags-in-sql-server?rq=1
   * 6xx are Storage Engine access methods
   * 8xx are buffer pool
   * 12xx are lock manager
   * 14xx are database mirroring
   * 25xx, 52xx are DBCC related
   * 30xx, 31xx, 32xx are backup/restore
   * 36xx are SQL Server general 'run-time'
   * 55xx are FILESTREAM
   * 73xx, 74xx are query execution
   * 76xx are full text related (?)
   * 75xx are cursors
   * 82xx are replication

