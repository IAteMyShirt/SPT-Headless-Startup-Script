SPT + Fika Headless Auto-Launcher (Universal)

A "Smart-Check" automation utility for Sarkov Project T (SPT) and Fika. This script handles the heavy lifting of your startup sequence by monitoring your network ports to ensure the server is fully "Listening" before firing up the game client.
🚀 Key Features

    Universal Pathing: Uses !BASE_DIR! to detect its own location. No drive letter editing required.

    Smart Port Detection: Uses netstat to monitor Port 6969. It won't launch the client until the server is actually ready.

    Direct Execution: Launches FikaHeadlessManager.exe directly from the root folder.

🛠️ Installation & Setup
1. File Placement

Move this script (Start_Fika.bat) into your Main SPT Directory (the one containing SPT.Server.lnk and FikaHeadlessManager.exe).
2. Create the Server Shortcut
**Should have been done automatically after installing SPT**

Because the SPT Server often needs specific start arguments, you must create a shortcut:

    Right-click SPT.Server.exe -> Create Shortcut.

    Rename that shortcut to exactly: SPT.Server.lnk.

    Ensure this shortcut is in the same folder as the script.

3. (Optional) Run on Windows Startup

If you want the game to be ready the moment you sit down:

    Press Win + R, type shell:startup, and hit Enter.

    Alt + Drag the Start_Fika.bat into that folder to create a shortcut there.

⚙️ How it Works

    Initial Buffer: Waits 5 seconds to let Windows background services stabilize.

    Server Launch: Starts the SPT.Server.lnk shortcut.

    Port Check Loop: Every 2 seconds, it pings the local network.

        netstat -ano | findstr :6969 | findstr LISTENING

    Client Launch: Once the server is live, it triggers FikaHeadlessManager.exe and closes itself.

⚠️ Troubleshooting

    Missing .lnk Error: Ensure your server shortcut is named exactly SPT.Server.lnk. Windows sometimes hides file extensions; make sure it isn't SPT.Server.lnk.lnk.

    Looping Dots: If the script stays on [WAIT], your server might be using a different port. Check your server's http.json config file to confirm it is using 6969.
