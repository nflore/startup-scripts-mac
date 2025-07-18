#!/bin/bash
THUNDERBOLT_SERVICE_NAME="Thunderbolt Ethernet Slot 2"
OUTPUT_NAME="Office"

# Disable Thunderbolt Ethernet
networksetup -setnetworkserviceenabled "$THUNDERBOLT_SERVICE_NAME" off
sleep 1

# Open Sound settings and switch to AirPlay OUTPUT_NAME
osascript <<EOF
tell application "System Settings"
	activate
end tell

delay 1.2

tell application "System Events"
	tell application process "System Settings"
		repeat until (exists window 1)
			delay 0.2
		end repeat

        set soundPane to the first row of outline 1 of scroll area 1 ¬
            of group 1 of splitter group 1 of group 1 of window 1 ¬
            whose value of the first static text of UI element 1 is "Sound"
        set selected of soundPane to true

        repeat 30 times
            if exists (window "Sound") then exit repeat
            delay 0.2
        end repeat

        perform action "AXPress" of radio button 1 of tab group 1 ¬
            of group 2 of scroll area 1 of group 1 of group 2 ¬
            of splitter group 1 of group 1 of window "Sound"

        repeat 30 times
            try
                set outputRow to (first row of outline 1 of scroll area 1 ¬
                    of group 2 of scroll area 1 of group 1 of group 2 ¬
                    of splitter group 1 of group 1 of window "Sound" ¬
                    whose (value of the first static text of group 1 of UI element 1) is "$OUTPUT_NAME")
                set selected of outputRow to true
                exit repeat
            end try
            delay 0.5
        end repeat
	end tell
end tell

delay 1

tell application "System Settings" to quit
EOF

# Re-enable Thunderbolt
networksetup -setnetworkserviceenabled "$THUNDERBOLT_SERVICE_NAME" on