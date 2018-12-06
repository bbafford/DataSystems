select  ji.id as ID,
		TIMESPENT as TimeSpent,
        issuenum as TicketNumber,
        iss.pname as IssueStatus,
        it.pname as IssueType,
		Created as CreationDate,
		RESOLUTIONDATE as ClosedDate,
        Version.version as FixVersion
		
 from jiraissue ji left join  
		(SELECT jiraissue.id as Version_id,  
			vname as Version
		FROM projectversion,
			nodeassociation,
			jiraissue
		WHERE ASSOCIATION_TYPE = 'IssueFixVersion'
			AND SINK_NODE_ID = projectversion.id
			AND SOURCE_NODE_ID = jiraissue.id
			and projectversion.project = 10091) as Version
		on ji.id = version.version_id
	left join issuestatus iss 
        on	ji.issuestatus = iss.id
	left join issuetype it
		on 	ji.issuetype = it.id
  where project= 10091 
 
 
 

