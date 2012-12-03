<cfcomponent name="ComponentToBeMocked" output="false">
	
	<cffunction name="FunctionC" access="package" output="false" returntype="string">
		<cfargument name="C" type="string" required="false" />
		<cfreturn arguments.C/>
	</cffunction>
	
	<cffunction name="FunctionG" access="public" output="false" returntype="string">
		<cfargument name="e" type="string" required="true" />
		<cfargument name="f" type="string" required="true" />
		<cfargument name="g" type="string" required="true" />
		<cfscript>
			return arguments.e&arguments.f&arguments.g;	
		</cfscript>
	</cffunction>
</cfcomponent>