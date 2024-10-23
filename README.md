# Server Stats Script

## Purpose

This Bash script, `server-stats.sh`, is designed to provide a concise overview of essential server performance metrics. It offers insights into CPU usage, memory consumption, disk utilization, and process activity.

## Usage

1. **Save the script**: Copy the script code and save it as `server-stats.sh`.

2. **Make it executable (optional)**: If necessary, grant execution permissions using:

   ```sh
   chmod +x server-stats.sh
   ```

3. **Run the script**: Execute the script from the terminal:
   ```sh
   ./server-stats.sh
   ```

## Output

The script will generate a detailed report, including:

- **Basic Server Information**: OS version, uptime, load average, logged-in users, and failed login attempts.
- **Resource Utilization**: CPU usage, memory usage (total, used, free), and disk usage (used, free).
- **Process Activity**: Top 5 processes by CPU and memory consumption.

## Customization

- **Additional Metrics**: Feel free to extend the script by adding more metrics or modifying existing ones to suit your specific needs.
- **Partition Selection**: For disk usage, adjust the partition path (`/`) if you want to monitor a different partition.

## Prerequisites

- A Linux-based server.
- Basic understanding of Bash scripting.

## Notes

- The script relies on standard Linux commands like `vmstat`, `free`, `ps`, `uptime`, and `last`. Ensure these commands are available on your system.
- For more accurate disk usage information, consider using tools like `df` or `du` with appropriate options.
- Customize the script to gather specific metrics or format the output according to your preferences.

## Example Output

```md
**Server Stats**

- OS Version: Ubuntu 22.04.2 LTS
- Uptime: 16 days, 12:34:56
- Load Average: 0.12 0.23 0.34
- Logged In Users: 2
- Failed Login Attempts (last boot): 0

**CPU Usage:** 15.2%

**Memory Usage:**

- Total: 16 GB
- Used: 8.5 GB (53.12%)
- Free: 7.5 GB

**Disk Usage (/):**

- Used: 85%
- Free: 15%

**Top 5 Processes by CPU Usage:**

- PID %CPU COMMAND
  - 1234 20.0 firefox
  - 2345 15.0 chrome
  - 3456 10.0 mysql
  - 4567 5.0 apache2
  - 5678 3.0 ssh

**Top 5 Processes by Memory Usage:**

- PID %MEM COMMAND
  - 1234 30.0 firefox
  - 2345 25.0 chrome
  - 3456 20.0 mysql
  - 4567 15.0 apache2
  - 5678 10.0 ssh
```
