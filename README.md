# Office Login

This project automates the login process to a hosted desktop environment using a PowerShell script.

## Instructions

### 1. Set the Path to ChromeDriver

You will need to set the path to the directory where `chromedriver.exe` is located. The `chromedriver.exe` used in this project is included in the repository under the `chromedriver-win64` folder.

If you need a different version of ChromeDriver, you can download it from the following sources:
- [ChromeDriver Downloads](https://sites.google.com/chromium.org/driver/downloads)
- [Chrome for Testing](https://googlechromelabs.github.io/chrome-for-testing/)

Make sure to download the version that matches your installed version of Google Chrome.

### 2. Update Your Credentials

Replace the following placeholders in the script with your actual credentials:
- `<Your-UserName>`: Replace with your username.
- `<Your-Password>`: Replace with your password.
- `<Your-PIN>`: Replace with your PIN.

### 3. Modify the Download Path (if needed)

If the `.ica` file is downloaded to a different location than the default, update the download path in the script to reflect the correct location on your system.

### 4. Running the Script

Once you've updated the script, follow these steps:

1. Right-click on the `.ps1` file and select **"Run with PowerShell"**.
2. The script will open a PowerShell terminal and a Chrome window.
3. In the PowerShell terminal, you will be prompted to enter your **RSA Token**. Enter your RSA token when prompted.

### 5. Completion

- The hosted desktop session will start automatically.
- Both the Chrome and PowerShell sessions will close when the process is finished.

You are all done! The script will handle the login process, enter your credentials, download the hosted desktop ica file, open the hosted machine and close the automation sessions automatically.

## Troubleshooting

If you encounter any issues with the script, ensure that:
- The path and version of your `chromedriver.exe` is correct.
- The credentials are updated correctly in the script.
- RSA Token value is being entered on time.
- The `.ica` file path is correct if it is downloaded to a different location.
