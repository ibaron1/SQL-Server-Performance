SELECT wait_type, wait_time_ms, blocking_session_id, session_id, percent_complete
FROM sys.dm_exec_requests
WHERE wait_type = 'RESOURCE_SEMAPHORE';
