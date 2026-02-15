import os
from ghastoolkit import CodeQLDatabases

local_databases = CodeQLDatabases()
if loc := os.environ.get("CODEQL_DATABASES"):
    local_databases.findDatabases(loc)

for database in local_databases:
    print(f"{database.name}\t{database.language}\t{database.created}\t{database.path}")
