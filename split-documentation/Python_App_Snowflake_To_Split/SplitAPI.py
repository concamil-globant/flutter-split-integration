import json
import requests

class SplitAPI:
# instantiate client
            
    def __init__(self, adminApiKey):
        try:
            self.apiToken=adminApiKey
        except Exception, e:
            print "Failed to Initialize Split Admin API "+str(e.args)+", "+str(e)
    
    
    def AddWhiteListToSplit(self, workspaceId, environmentName, splitName, whitelistKey):
        try:
            URL = "https://api.split.io/internal/api/v2/splits/ws/"+workspaceId+"/"+splitName+"/environments/"+environmentName
            fp = requests.patch(URL, 
                                headers={"Content-Type":"application/json", "Authorization": "Bearer "+self.apiToken},  
                                data='[{"op": "add", "path": "/treatments/0/keys/-", "value": "'+whitelistKey+'"}]')
            js= json.loads(fp.content)
            print fp.content
            return js
        except Exception, e:
            print "Failed to add Whitelist ",  e.args,str(e)


    def AddNewWhiteListToSplit(self, workspaceId, environmentName, splitName, whitelistKey):
        try:
            URL = "https://api.split.io/internal/api/v2/splits/ws"+workspaceId+"/"+splitName+"/environments/"+environmentName
            fp = requests.patch(URL, 
                                headers={"Content-Type":"application/json", "Authorization": "Bearer "+self.apiToken},  
                                data='[{"op": "add", "path": "/treatments/0/keys", "value": ["'+whitelistKey+'"]}]')
            js= json.loads(fp.content)
            print fp.content
            return js
        except Exception, e:
            print "Failed to add Whitelist ",  e.args,str(e)



    def GetSplitDefinition(self, workspaceId, splitName, environmentName):
        try:
            URL = "https://api.split.io/internal/api/v2/splits/ws/"+workspaceId+"/"+splitName+"/environments/"+environmentName
            fp = requests.get(URL, 
                                headers={"Content-Type":"application/json", "Authorization": "Bearer "+self.apiToken})
            js= json.loads(fp.content)
            print fp.content
            return js
        except Exception, e:
            print "Failed to get definition ",  e.args,str(e)
            
            
        
    def SendEvents(self, events):
        try:
            URL = "https://events.split.io/api/events/bulk"
            fp = requests.post(URL, 
                                headers={"Content-Type":"application/json", "Authorization": "Bearer "+self.apiToken},  
                                data=events
                                )
            if fp.status_code==202:
                return "Accepted"
            js= json.loads(fp.content)
            print fp.content
            return js
        except Exception, e:
            print "Failed to add Events ",  e.args,str(e)
             
    def GetSegmentKeys(self, segmentName, environmentId):
        try:
            URL = "https://api.split.io/internal/api/v2/segments/"+str(environmentId)+"/"+segmentName+"/keys"
            fp = requests.get(URL, 
                                headers={"Content-Type":"application/json", "Authorization": "Bearer "+self.apiToken})
            js= json.loads(fp.content)
            print fp.content
            return js
        except Exception, e:
            print "Failed to get Segment keys ",  e.args,str(e)

    def UpdateSegmentKeys(self, segmentName, environmentId, keys):
        try:
            URL = "https://api.split.io/internal/api/v2/segments/"+str(environmentId)+"/"+segmentName+"/upload"
            fp = requests.put(URL,data=keys,  
                                headers={"Content-Type":"application/json", "Authorization": "Bearer "+self.apiToken, 
                                         })
            js= json.loads(fp.content)
            print fp.content
            return js
        except Exception, e:
            print "Failed to update Gegment ",  e.args,str(e)

    def GetWorkspaceId(self, workspace):
        try:
            URL = "https://api.split.io/internal/api/v2/workspaces"
            fp = requests.get(URL, 
                                headers={"Content-Type":"application/json", "Authorization": "Bearer "+self.apiToken})
            js= json.loads(fp.content)
            print fp.content
            wsId=''
            for ws in js['objects']:
                if  ws['name']==workspace:
                    wsId=ws['id']
            return wsId
        except Exception, e:
            print "Failed to get Workspace Id ",  e.args,str(e)


    def GetEnvironmentId(self, workspaceId, environmentName):
        try:
            URL = "https://api.split.io/internal/api/v2/environments/ws/"+workspaceId
            fp = requests.get(URL, 
                                headers={"Content-Type":"application/json", "Authorization": "Bearer "+self.apiToken})
            js= json.loads(fp.content)
            print fp.content
            envId=''
            for env in js:
                if  env['name']==environmentName:
                    envId=env['id']
            return envId
        except Exception, e:
            print "Failed to get Environment Id ",  e.args,str(e)













