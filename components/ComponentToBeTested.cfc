<cfcomponent name="ComponentToBeTested" output="false">

	<cfproperty name="a" type="any" />
	<cfproperty name="b" type="any" />
	<cfproperty name="component" type="ComponentToBeMocked">

	<cffunction name="setComponent" access="public" output="false" returntype="void">
		<cfargument name="component" type="any" required="true" />
		<cfset this.component = arguments.component />
		<cfreturn />
	</cffunction>
	
	<cffunction name="getA" access="public" output="false" returntype="any">
		<cfreturn this.a />
	</cffunction>

	<cffunction name="setA" access="public" output="false" returntype="void">
		<cfargument name="a" type="any" required="true" />
		<cfset this.a = arguments.a />
		<cfreturn />
	</cffunction>

	<cffunction name="getB" access="public" output="false" returntype="any">
		<cfreturn this.b />
	</cffunction>

	<cffunction name="setB" access="public" output="false" returntype="void">
		<cfargument name="b" type="any" required="true" />
		<cfset this.b = arguments.b />
		<cfreturn />
	</cffunction>

	<cffunction name="init" output="false">
        <cfargument name="mocked" required="true">
        <cfset this.component = arguments.mocked>
        <cfreturn this>
    </cffunction>
	
	<cffunction name="functionA" access="public" output="false" returntype="string">
		<cfargument name="a" type="string" required="false" />
		<!--- TODO: Implement Method --->
		<cfreturn arguments.a/>
	</cffunction>

	<cffunction name="FunctionB" access="public" output="false" returntype="string">
		<cfargument name="b" type="string" required="false" />
		<!--- TODO: Implement Method --->
		<cfreturn arguments.b/>
	</cffunction>
	
	<cffunction name="FunctionC" access="public" output="false" returntype="string">
		<cfargument name="C" type="string" required="false" />
		<cfset string = functionA(arguments.C)>
		
		<cfreturn string/>
	</cffunction>
	
	<cffunction name="FunctionD" access="public" output="false" returntype="string">
		<cfargument name="d" type="string" required="false" />
		<cfscript>
			retorno =  this.component.functionC(arguments.d);
			return retorno;	
		</cfscript>
	</cffunction>
	
	<cffunction name="FunctionE" access="public" output="false" returntype="string">
		<cfargument name="e" type="string" required="false" />
		<cfscript>
			retorno1 =  this.component.functionC(arguments.e);
			retorno2 =  this.component.functionC(arguments.e);
			return retorno1&"-"&retorno2;	
		</cfscript>
	</cffunction>
	
	<cffunction name="FunctionF" access="private" output="false" returntype="string">
		<cfreturn "Foo">
	</cffunction>
	
	<cffunction name="FunctionG" access="public" output="false" returntype="string">
		<cfargument name="e" type="string" required="true" />
		<cfargument name="f" type="string" required="true" />
		<cfargument name="g" type="string" required="true" />
		<cfscript>
			return this.component.FunctionG(arguments.e,arguments.f,arguments.g);	
		</cfscript>
	</cffunction>
	
	<cffunction name="FunctionH" access="public" output="false" returntype="boolean">
		<cfargument name="h" type="string" required="true" />
		<cfargument name="g" type="array" required="true" />
		<cfscript>
			return arraycontains(arguments.g,arguments.h);	
		</cfscript>
	</cffunction>
</cfcomponent>