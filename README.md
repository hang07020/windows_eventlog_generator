# Windows Event Log Generator

A simple **PowerShell script** that continuously writes test entries into the **Windows Application Event Log**.  
This tool is useful for testing log collection pipelines, monitoring agents, or SIEM integrations (e.g., Exabeam, Splunk, Elastic).

---

## Features
- Writes incrementing log entries with a 3-digit counter (`001`, `002`, … `999`, then loops).  
- Adds a timestamp to each event message.  
- Uses the **Application** log with a custom source (`TestLogSource`).  
- Generates a new event every **5 seconds**.  
- Event type: **Information**, Event ID: **1001**.  

---

## Requirements
- Windows OS  
- PowerShell (tested on 5.1 and 7.x)  
- Administrative privileges (required when creating the event source for the first time)  

---

## Usage
1. Save the script as `eventlog_generator.ps1`.  
2. Open **PowerShell as Administrator** (important for creating the event source).  
3. Run the script:
   ```powershell
   .\eventlog_generator.ps1
   ```

4. To stop, press `Ctrl + C`.  

---

## Example Output

**Event Viewer → Windows Logs → Application**

Example log entries:

```
Event ID:   1001
Source:     TestLogSource
Type:       Information
Message:    001 - Test log entry at 2025-09-01 12:00:00

Event ID:   1001
Source:     TestLogSource
Type:       Information
Message:    002 - Test log entry at 2025-09-01 12:00:05
```

The counter resets after `999` and continues from `001`.

---
