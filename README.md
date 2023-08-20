# auto-sync-time

This script is designed to automatically synchronize the system time using an online time server. It retrieves the current time from a specified URL using the HTTP Date header and then synchronizes the local system time accordingly. The script is especially useful for devices without an RTC (Real-Time Clock) module that need to maintain accurate time.

Features: 
* Retrieves current time from an online time server using the Date header.
* Converts the received time into a format compatible with the system's date command.
* Synchronizes the system time based on the received time.
* Provides feedback on the synchronization status and the current time.
* Monitors internet connectivity using the ping command before proceeding with time synchronization.
* Supports providing a custom URL or IP as an argument, defaulting to Google's URL if none is provided.

Usage:
To synchronize the system time, simply run the script in the terminal and provide the provided bug URL or IP address as an argument. For example:
```
./sync_time.sh bug.com

```

If no argument is provided, it will use "google.com" as the default time server:
```
./sync_time.sh
```

Download the script: (downloaded to /root)
```
wget --no-check-certificate https://raw.githubusercontent.com/frizkyiman/auto-sync-time/main/sync_time.sh -O /root/sync_time.sh && chmod +x /root/sync_time.sh
```

to run script at boot time:
```
sed -i '/exit 0/i /root/sync_time.sh bug.com' /etc/rc.local
```

add crontab scheduled task to script work regularly at 12AM every day:

```
0 12 * * * /root/sync_time.sh bug.com
```


Notes:
* Ensure that the script has execute permission (chmod +x sync_time.sh).
* The default URL is set to Google's URL (google.com).
* The script uses the ping command to monitor internet connectivity. It will display dots while waiting for a successful connection.
* If the provided bug URL/IP doesn't return a valid Date header, the script will display a failure message.
