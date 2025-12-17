![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)![Spotify](https://img.shields.io/badge/Spotify-1ED760?style=for-the-badge&logo=spotify&logoColor=white)
# 🔊 Spicetify Windows Installer
## ✨ Overview

This PowerShell script searches for Spotify and Spicetify installations on your system "AppData/Roaming" to update them. If Spotify is not found, it WILL AUTOMATICALLY INSTALL the official Spotify client before setting up Spicetify.

## 🚀 Key Features

- **Spotify Installer:** The script can install Official Spotify! (from: https://download.scdn.co/SpotifyFullSetup.exe)
- **Spicetify Installer:** It can install Spicetify too. (runs the official Spicetify script: iwr -useb https://raw.githubusercontent.com/spicetify/cli/main/install.ps1 | iex)
- **Spicetify Updater:** Just runs spicetify upgrade, restore and applies backup automatically to the user.

## 🛠️ Installation and Setup

### Prerequisites

To run this project locally, you will need:

- Windows 10/11 (I think it's compatible with oldier Windows too, but you'll need to install for yourself, cuz Spotify removed the Win7 installer from the website).
- Incompatible with the Microsoft Store version of Spotify. Please uninstall it first and run the script to install Spotify Win32 version from the official site.

### Step 1: Clone the Repository
```bash
git clone https://github.com/semdoce/spicetify-install-script-windows.git
cd spicetify-install-script-windows
```
### Step 2: Run the script
By default, Windows has a restricted execution policy to prevent malicious scripts from running automatically. There's two ways to run the project:
* Run normally:
```bash
powershell -File ".\SpicetifyScript.ps1"
```
* If the first fails:
```bash
powershell -ExecutionPolicy Bypass -File ".\SpicetifyScript.ps1"
# This will get the script running, if the first fails. 
```


## 💡 Creation Process

- I thought that re-installing Spicetify everytime Spotify had an update was slow. So, I created a script that tests if the user have Spotify folder on AppData. If not found, **WILL INSTALL** Official Spotify, and then it will search for Spicetify folder on AppData. If not found, will install Spicetify too.
- This way, if both folders exist and you run the program, the script just presumes that the user is running it to fix a broken Spicetify installation, then it will try to fix by upgrading and, if it doesn't work, it will run spicetify restore, that does a clean reset on Spotify folder. After that, it will apply backup to restore your themes and plugins, as easy as one click (actually, a right-click and a left-click, or a command-line... line.)

## 🧠 What I Learned

- Powershell cmdlets are really powerful, I learned how to run a .exe with Invoke-WebRequest (iwr) and wait until a proccess goes finished. Also, $LASTEXITCODE works like a charm.


## 🔮 Features to implement:
* If the installation point wasn't "AppData/Roaming", the script will try to install again (wont work correctly).
* Check if your Spotify was updated, and upgrade spicetify on the start.
* Ask the user to install Spotify or not.
* Maybe create a bash version.
* Ask the user if they want to install some plugins that i do think are cool if it's the first installation.
