# Reading from and Writing to the host
Get-Command  -Noun "Host"

# Clear the screen anytime
Clear-Host 

# Get input from the host.
# There are options for reading passwords using -AsSecureString parameter
# Send a message about what is expected with -Prompt parameter
Read-Host

# Write to the screen
# Helpful parameters are -ForegroundColor to set the color of the text
# and -NoNewLine if you're not done adding text to the line.
Write-Host "Hello, World!" -NoNewline
Write-Host "Hello, World!" -ForegroundColor DarkMagenta


# String formatting 
"Pi is {0}" -f [Math]::PI
"Pi is {0:n2} (that's {1:p} close enough anyway)" -f [Math]::PI, 0.99
