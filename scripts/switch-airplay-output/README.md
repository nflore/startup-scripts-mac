### 2. `scripts/switch-airplay-output/README.md`

# Switch to AirPlay Audio

Temporarily disables Thunderbolt Ethernet, switches system output to a specified AirPlay device, then re-enables Thunderbolt Ethernet. Workaround for silent output that occurs when Wi-Fi + Thunderbolt are active while routing audio over AirPlay.

To do this, we open the System Preferences UI to switch to Sound and pick our AirPlay device out of the list.

## Files

| File | Description |
| ---- | ----------- |
| `switch_airplay_output.sh` | Bash + AppleScript that performs the switch. Edit the **variables at the top** (`THUNDERBOLT_SERVICE_NAME` and `OUTPUT_NAME`) to match your system. |
| `com.nflore.switch_airplay_output.plist` | LaunchAgent that runs the script automatically at user login. |

## Installation

```bash
# 1. Copy the script somewhere on your PATH
sudo cp switch_airplay_output.sh /usr/local/bin
sudo chmod +x /usr/local/bin/switch_airplay_output.sh

# 2. Load the LaunchAgent
mkdir -p ~/Library/LaunchAgents
cp com.nflore.switch_airplay_output.plist ~/Library/LaunchAgents/
launchctl load ~/Library/LaunchAgents/com.nflore.switch_airplay_output.plist
```