import snowflake.connector


class SnowflakeAPI:
# instantiate client
            
    def __init__(self, user, password, account):
        try:
            self.con = snowflake.connector.connect(
                user=user, 
                password=password, 
                account=account
                )
        except Exception, e:
            print "Failed to Initialize Snowflake "+str(e.args)+", "+str(e)
    
    def runQuery(self, sqlText):
        self.con.cursor().execute("USE WAREHOUSE COMPUTE_WH")

    def runSelectQuery(self, sqlText):
        cur = self.con.cursor()
        return cur.execute(sqlText)
