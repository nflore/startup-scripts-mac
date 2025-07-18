# startup-scripts-mac

macOS startup scripts to automate workflows.

| Script | Purpose | Folder |
| ------ | ------- | ------ |
| **Switch to AirPlay Audio** | Temporarily disables Thunderbolt Ethernet, switches system output to a specified AirPlay device, then re-enables Thunderbolt Ethernet. Workaround for silent output that occurs when Wi-Fi + Thunderbolt are active while routing audio over AirPlay. | [`scripts/switch-airplay-output`](scripts/switch-airplay-output) |

## Quick start

```bash
git clone https://github.com/nflore/startup-scripts-mac.git
cd startup-scripts-mac/scripts/switch-airplay-output
./switch_airplay_output.sh   # test run
