$logName = "Application"
$source = "TestLogSource"

# Ensure the event source exists (requires admin rights the first time)
if (!(Get-EventLog -LogName $logName -Source $source -ErrorAction SilentlyContinue)) {
    New-EventLog -LogName $logName -Source $source
}

# Initialize counter
$counter = 1

Write-Host "Starting Windows Event Log Generator..."
Write-Host "Writing events to log: $logName with source: $source"
Write-Host "Press Ctrl+C to stop."

# Generate logs every 5 seconds
while ($true) {
    # Format the counter as a 3-digit number (001, 002, ...)
    $counterFormatted = "{0:D3}" -f $counter

    # Create the log message
    $message = "$counterFormatted - Test log entry at $(Get-Date)"

    # Write to the Event Log
    Write-EventLog -LogName $logName `
                   -Source $source `
                   -EntryType Information `
                   -EventId 1001 `
                   -Message $message

    Write-Host "[$(Get-Date -Format 'HH:mm:ss')] Wrote event: $message"

    # Increment the counter and reset after 999
    $counter = if ($counter -ge 999) { 1 } else { $counter + 1 }

    # Wait for 5 seconds
    Start-Sleep -Seconds 5
}
