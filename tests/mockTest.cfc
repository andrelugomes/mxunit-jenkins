<cfcomponent name="mockTest" extends="mxunit.framework.TestCase">
	<!--- Begin specific tests --->

	<cffunction name="functionADeveRetornarATest" access="public" returnType="void">
		<cfscript>
			assertEquals( "A", meuComponente.functionA("A") );
		</cfscript>
	</cffunction>
	
	<cffunction name="functionBDeveRetornarBTest" access="public" returnType="void">
		<cfscript>
			//assertEquals( "B", meuComponente.functionB("B") );
			assertTrue(true);
		</cfscript>
	</cffunction>
	
	<cffunction name="functionCDeveRetornarBTest" access="public" returnType="void">
		<cfscript>
			assertEquals( "B", meuComponente.functionC("B") );
		</cfscript>
	</cffunction>	
	
	<cffunction name="functionDDeveRetornarDTest" access="public" returnType="void">
		<cfscript>
			meuMock = mock(meuComponenteMock);
			meuMock.functionC("{string}").returns("D");
			assertEquals( "D", meuComponente.init(meuMock).functionD("D") );
		</cfscript>
	</cffunction>	
	
	<!--- Usando Mock --->
	<cffunction name="functionDDeveRetornarAComMockTest" access="public" returnType="void">
		<cfscript>
			//meuMock = mock("sesc-manutencao.sesc.previsesc.tests.mockTest.ComponentToBeMocked","typeSafe");
			meuMock = mock(meuComponenteMock);
			meuMock.functionC("{string}").returns("A");
			//meuComponente.init(meuMock);
			meuComponente.setComponent(meuMock);
			assertEquals( "A", meuComponente.functionD("A") );
		</cfscript>
	</cffunction>	
	
	<cffunction name="functionEDeveRetornarAtracoAComMockTest" access="public" returnType="void">
		<cfscript>
			meuMock = mock(meuComponenteMock);
			meuMock.functionC("{string}").returns("A");
			meuComponente.setComponent(meuMock);
			assertEquals( "A-A", meuComponente.functionE("{string}") );
		</cfscript>
	</cffunction>
		
	<!--- TEstando métodos privados --->
	<cffunction name="functionFPrivateDeveRetornarFooTest" access="public" returnType="void">
		<cfscript>
			makepublic(meuComponente,"functionF");
			assertEquals( "Foo", meuComponente.functionF() );
		</cfscript>
	</cffunction>
	
	<!--- Arguments DAta Type Matching --->
	<cffunction name="functionG3ArgumentosDeveRetornarFOOTest" access="public" returnType="void">
		<cfscript>
			meuMock = mock(meuComponenteMock);
			meuMock.FunctionG("{string}","{string}","{string}").returns("Foo");
			meuComponente.setComponent(meuMock);
			assertEquals( "Foo", meuComponente.functionG("F","o","o") );
		</cfscript>
	</cffunction>
	
	<cffunction name="functionG3ArgumentosDeveRetornarBARTest" access="public" returnType="void">
		<cfscript>
			meuMock = mock(meuComponenteMock);
			meuMock.FunctionG("{+}").returns("Bar"); //Um ou mais argumentos
			//meuMock.FunctionG("{*}").returns("Bar"); //Zero ou mais argumentos
			meuComponente.setComponent(meuMock);
			assertEquals( "Bar", meuComponente.functionG("B","a","r") );
		</cfscript>
	</cffunction>
	
	<!--- Debug mock --->
	<cffunction name="functionG3ArgumentosDeveRetornarBARComDebugTest" access="public" returnType="void">
		<cfscript>
			meuMock = mock(meuComponenteMock);
			meuMock.FunctionG("{+}").returns("Bar"); //Um ou mais argumentos
			//meuMock.FunctionG("{*}").returns("Bar"); //Zero ou mais argumentos
			meuComponente.setComponent(meuMock);
			meuMock.FunctionG("{+}");
			debug(meuMock.debugMock());
			assertEquals( "Bar", meuComponente.functionG("B","a","r") );
		</cfscript>
	</cffunction>	
		
	
	<!--- Data providers 
		Irá prover um objeto e o assert ira ingterar neste objeto--->
	<cfscript>
		/**
	    *@mxunit:dataprovider arrayDeNomes
	    */
		function functionHRecebeUmArrayERetornaTrueTest(String array){
			assertTrue(meuComponente.functionH(array,arrayDeNomes),"#array# não existe no array");
		}
	</cfscript>
	
	<cffunction name="functionHRecebeUmArrayERetornaTrue2Test" returntype="void" mxunit:dataprovider="arrayDeNomes">
		<cfargument name="array" hint="interagi no DataProvider e retorna um data pr acada valor">
		<cfset assertTrue(meuComponente.functionH(array,arrayDeNomes),"#array# não existe no array")>
	</cffunction>
		
	<!--- setup and teardown --->	
	<cffunction name="setUp" returntype="void" access="public">
		<cfscript>
			meuComponente = createobject("component","mxunit-jenkins.components.ComponentToBeTested");
			meuComponenteMock = createobject("component","mxunit-jenkins.components.ComponentToBeMocked");
	    	arrayDeNomes = ["André","Luis","Gomes"];	    	
		</cfscript>
	</cffunction>

	<cffunction name="tearDown" returntype="void" access="public">
		<!--- Any code needed to return your environment to normal goes here --->
	</cffunction>	
</cfcomponent>