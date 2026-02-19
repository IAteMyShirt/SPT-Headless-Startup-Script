SPT + Fika Headless Auto-Launcher

A "Smart-Check" batch utility for Sarkov Project T (SPT) and Fika. This script automates the boot sequence on Windows startup, ensuring the server is fully initialized by monitoring network ports before launching the headless client.
🌟 Why use this?

Normally, launching SPT requires manual intervention: open the server, wait for it to load, then open the client. This script:

    Starts on Boot: Automatically begins the process when you log into Windows.

    Smart Port Monitoring: Uses netstat to listen for Port 6969. It won't try to launch Fika until the server is actually "listening."

    Error Handling: Alerts you immediately if your shortcuts are missing or paths are incorrect.

🛠️ Setup Instructions
1. Requirements

    SPT & Fika installed (Default path: C:\Games\SPT\).

    Two Shortcuts: You must create shortcuts for your Server and Headless Manager named exactly:

        SPT.Server.lnk

        FikaHeadlessManager.lnk

2. Installation

    Place the SPT-Launcher.bat file into your main SPT folder.

    Ensure your shortcuts are also in C:\Games\SPT\.

    To run on Startup: * Press Win + R, type shell:startup, and hit Enter.

        Right-click and drag the script into that folder, then select Create shortcuts here.

🔍 How the Script Works (Technical Breakdown)

The script follows a 3-step validation process:

    The Delay: A 5-second buffer allows Windows services to settle before starting the server.

    Port Validation: ```batch
    netstat -ano | findstr :6969 | findstr LISTENING

    This loop prevents the "Headless Manager" from opening too early, which often causes connection timeouts or crashes in Fika.

    Launch: Once the port is active, it triggers the Fika Headless Manager and closes itself to save system resources.

🆘 Troubleshooting

    "Port 6969 not found": Ensure your SPT server config hasn't changed the default port. If you use a custom port, edit the :CHECK_PORT section in the .bat file.

    "File not found": This script looks specifically in C:\Games\SPT\. If your game is on a different drive (e.g., D:\SPT), right-click the .bat file, select Edit, and change the file paths to match your drive letter.

    Stuck on "Waiting for Server": If the server window is open but the script keeps looping dots (...), check your Windows Firewall to ensure Port 6969 isn't being blocked locally.
