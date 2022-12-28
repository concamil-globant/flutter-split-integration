import SplitAPI
import SnowflakeAPI

snowflakeUser = ''
snowflakePassword = ''
snowflakeAccount = ""
snowflakeWarehouse = ""
snowflakeSQL = "SELECT KEYNAME, TIME, SDK FROM EVENTS"

splitApiKey = 'Admin API Key'
splitEnvironment = "Production"
splitTrafficType = "user"

mySnowflake = SnowflakeAPI.SnowflakeAPI(snowflakeUser, snowflakePassword, snowflakeAccount) 
mySnowflake.runSelectQuery("USE WAREHOUSE "+snowflakeWarehouse)

events="["
for (KEYNAME, TIME, EVENTNAME) in mySnowflake.runSelectQuery(snowflakeSQL):
        print('{0}, {1}, {2}'.format(KEYNAME, TIME, EVENTNAME))
        event='{"eventTypeId": "'+EVENTNAME+'", "environmentName": "'+splitEnvironment+'", "trafficTypeName": "'+splitTrafficType+'", "key": "'+KEYNAME+'","timestamp": "'+str(TIME)+'"}'
        events=events+event+","

events=events[:-1]
events=events+"]"
print events

mySplit = SplitAPI.SplitAPI(splitApiKey)
mySplit.SendEvents(events)
