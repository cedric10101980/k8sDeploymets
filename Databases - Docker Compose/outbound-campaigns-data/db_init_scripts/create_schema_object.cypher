CREATE CONSTRAINT campaign_name_constraint IF NOT EXISTS FOR (c:Campaign) REQUIRE c.name IS UNIQUE;
CREATE CONSTRAINT strategy_name_constraint IF NOT EXISTS FOR (s:Strategy) REQUIRE s.name IS UNIQUE;
CREATE CONSTRAINT channelprovider_name_constraint IF NOT EXISTS FOR (cp:ChannelProvider) REQUIRE cp.name IS UNIQUE;
CREATE INDEX ix_job_id IF NOT EXISTS FOR (jb:Job) ON (jb.id);
CREATE INDEX ix_campaign_id IF NOT EXISTS FOR (cm:Campaign) ON (cm.id);
CREATE INDEX ix_attempt_jobid IF NOT EXISTS FOR (m:Attempt) ON (m.jobId);
CREATE INDEX ix_attempt_id IF NOT EXISTS FOR (m:Attempt) ON (m.attemptId);
CREATE INDEX ix_campaign_lastexecutedon IF NOT EXISTS FOR (m:Campaign) ON (m.lastExecutedOn);
CREATE INDEX ix_job_status IF NOT EXISTS FOR (m:Job) ON (m.status);
CREATE INDEX ix_deletedcampaign_id IF NOT EXISTS FOR (m:DeletedCampaign) ON (m.id);

