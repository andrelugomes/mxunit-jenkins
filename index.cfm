<cfoutput>TEstes de execução de testes com Jenkins</cfoutput>
<cfdirectory action="list" directory="#GetDirectoryFromPath(ExpandPath("*.*"))#" name="dir">
<cfdump var="#dir#">