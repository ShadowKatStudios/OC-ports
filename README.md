# OC-ports

OC-ports provides a database and library for using said database to cross-reference between protocol names and network port numbers. The database also contains the entity that registered the port(s) and, if applicable, a link to more information.

## API

The portinfo API provides one funciton:

    portinfo.search(*query*, [*database*]) table: result

The search() function takes your *query* - either a string or a port number - and searches the database, defaulting to the OC ports database, for your query, returning the first result as a table in the format:

 - name
 - port
 - registered by
 - more information

This is more than enough to use for simple port lookups and generating tables.
