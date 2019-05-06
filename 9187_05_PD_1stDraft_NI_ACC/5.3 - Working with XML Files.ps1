Set-Location C:\
Clear-Host

Copy-Item C:\temp3\Servers.rdg C:\temp

#Any XML file will work here, and Remote Desktop Connection Manager is a free download if you want to use that.
$RDCManPath = "C:\temp\Servers.rdg"
$RDCManContent = Get-Content $RDCManPath
$RDCManContent.GetType()

[XML]$RDCManXML = Get-Content $RDCManPath
$RDCManXML.GetType()

try {
  Clear-Host
  Write-Host "Attempting to import an XML file"
  $XMLImport = Import-Clixml -Path C:\temp\Servers.rdg
}
catch {
  "Error: $_"
}

try {
  Clear-Host
  Write-Host "Getting a process object and exporting as XML"
  Get-Process | Select-Object -First 1  | Export-Clixml C:\temp\process_export.XML
  Write-Host "Importing the process object from the XML file"
  $XMLProcessImport = Import-Clixml C:\temp\process_export.XML
  Write-Host "Here's the contents of the imported object"
  $XMLProcessImport   
}
catch {
  "Error: $_"
}

#Let's compare the content of RDCManContent and RDCManXML
$RDCManContent
$RDCManXML

Code $RDCManPath

#Terminology
 #Nodes in XML can be thought of as the same as these collapsible headings in the XML file.
  #There are child nodes, sibling nodes, parent and grandparent nodes

 #Attributes

 #InnerXML - the XML code of the node, but only INSIDE the node tag

 #OuterXML - the XML code of the node, INCLUDING the node tag

 #Searching with XPath
 # Searching for one node with a specific path 
 $RDCManXML | Select-Xml -XPath "/RDCMan/file/properties/name" | Select-Object -ExpandProperty Node

 # Searching for any node that matches a pattern
 $RDCManXML | Select-Xml -XPath "//group" | select-object -ExpandProperty Node

 # Searching for all nodes with an attribute called "programVersion" that has a value of "2.7"
 $RDCManXML | Select-XML –Xpath "//*[@programVersion='2.7']" | Select-Object -ExpandProperty Node

 # Filtering by text
 $RDCManXML | Select-XML –Xpath "//group/properties/name[text()='Domain']/../.."
 
 # Applying it... Add all of the servers in a server list as a new server node in the Domain group 
 $RDCManPath = "C:\temp\Servers.rdg"
 [XML]$RDCManXML = Get-Content $RDCManPath

  #Clone a node 
 $GroupXPath = "//group/properties/name[text()='Domain']/../.."
 $GroupNode = $RDCManXML | Select-XML –Xpath $GroupXPath | Select-Object -ExpandProperty Node 
 $ClonedServerNode = $GroupNode.server.Clone()

 #Modify the clone
 $ClonedServerNode.properties.name = "DC01"

 #Add the cloned node into the XML 
 $RDCManXML.RDCMan.file.group[0].AppendChild($ClonedServerNode)

 #Save the XML back out to file.
 $RDCManXML.Save($RDCManPath)
  
 
 CODE $RDCManPath
