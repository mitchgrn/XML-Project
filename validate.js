//JavaScript: Loads XML document and validates i against XSD schema.
//Usage: validate XMLfilename XSDfilename {optional_namespace}

var oArg = WScript.Arguments;

if (oArg.length < 2 || oArg.length > 3) //test for input argument
{
   WScript.Echo ("Usage : validate XMLfilename XSDfilename {optional_namespace}");
   WScript.Quit();
}

xmlIn	= oArg(0) + ".xml";
xsdIn	= oArg(1) + ".xsd";
if(oArg.length == 3)
	ns = oArg(2);
else
	ns = "";

var cache = new ActiveXObject("Msxml2.XMLSchemaCache.6.0");
cache.add(ns, xsdIn);

var xmldoc = new ActiveXObject("Msxml2.DOMDocument.6.0");
xmldoc.async = false;
xmldoc.schemas = cache;
xmldoc.load(xmlIn);

if(xmldoc.parseError.errorCode != 0)
	WScript.Echo("PARSE ERROR on line " +xmldoc.parseError.line
	            +".\n" +xmldoc.parseError.reason);
else
	WScript.Echo(xmlIn + " successfully validates against " + xsdIn);