import os
from ghastoolkit import CodeQLDatabases

local_databases = CodeQLDatabases()
local_databases.findDatabases(os.environ.get("CODEQL_DATABASES"))

for database in local_databases:
    print(f"{database.path}")
