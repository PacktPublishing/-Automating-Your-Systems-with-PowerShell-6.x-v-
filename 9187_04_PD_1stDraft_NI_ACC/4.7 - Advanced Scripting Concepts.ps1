#Guidance on creating modules

  # Select at least one "NOUN" - Identify the infrastructure component to manage

   "Virtual Machines"

  # Use a company specific prefix so that your "VM" commands aren't confused with others

  "-XYZVirtualMachine"
  
  # Foreach NOUN you've chosen, choose some verbs for commands you want to create.
  #  Start with "New", for example, or "Get" and "Set"

  "New"
  "Remove"

# Create a function for each command:
  Function New-XYZVirtualMachine {

  }
  Function Remove-XYZVirtualMachine {

  }

# Build from there
#  - Get input from the team
#  - Add more functions and features as you need
#  - Continue to improve
#  - Use Source Control!



# Pester creates and runs tests against your code.

#Pester is a test framework, allowing you to validate that your
# PowerShell code functions as expected.

# Create a test framework
New-Fixture -Name "FunctionOrScriptName"
# Creates a test file and a new scriptfile with a function in it.

# Find out more about Pester with the built in help modules
Get-Help About_Pester

# See an example
Code "C:\Program Files\PowerShell\6.0.0-rc\modules\pester\Examples"

# Test-Driven Development
#  Uses tests as the guiding force for the development

#  Create the fixture
#  Create the tests that describe what your function does
#  THEN create the function that makes the tests pass

#About CLASSES

Help about_Classes

# Useful especially when creating DSC resources
# Also helps bridge gaps for developers that have been using classes in other languages
