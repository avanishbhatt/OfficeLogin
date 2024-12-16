﻿# Installing Selenium module
if (-not (Get-Module -ListAvailable -Name Selenium)) {
    Install-Module -Name Selenium -Force -Scope CurrentUser
}

# Importing the Selenium module
Import-Module Selenium

# Setting up the Chrome Driver
$webDriverDirectory = "C:\Users\HP\Downloads\ChromeDriver\" # Path to the directory of Chrome Driver 
$driver = Start-SeChrome -WebDriverDirectory $webDriverDirectory

# Open the URL in Chrome browser
$url = "http://mydesk.morganstanley.com/"
$driver.Navigate().GoToUrl($url)

# Credentials and log in
$wait = New-Object OpenQA.Selenium.Support.UI.WebDriverWait($driver, [TimeSpan]::FromSeconds(20))
$usernameField = $wait.Until([OpenQA.Selenium.Support.UI.ExpectedConditions]::ElementIsVisible([OpenQA.Selenium.By]::Id("userName")))
$passwordField = $driver.FindElementById("pw_elem")
$pinField = $driver.FindElementById("securid_elem")
$goButton = $driver.FindElementByXPath("//button[contains(@class, 'loginActionBtn')]")

$usernameField.SendKeys("<Your-UserName>")
$passwordField.SendKeys("Your-Password")
$securID = Read-Host "Enter the RSA Token"
$pinField.SendKeys("<Your-PIN>"+$securID)
$goButton.Click()

$hostedDesktopButton = $wait.Until([OpenQA.Selenium.Support.UI.ExpectedConditions]::ElementIsVisible([OpenQA.Selenium.By]::XPath("//a[contains(text(), 'Hosted Desktop')]")))
$hostedDesktopButton.Click()

$filePath = "C:\Users\HP\Downloads\launchExtMSAD.ica"

$timeout = (Get-Date).AddSeconds(20)
while (-not (Test-Path $filePath) -and (Get-Date) -lt $timeout) {
    Start-Sleep -Seconds 1
}

if (Test-Path $filePath) {
    Start-Process $filePath
} else {
    Write-Host "File not found within the timeout period."
}

# Clean up
$driver.Quit()