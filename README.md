# Windows 11 IoT Enterprise LTSC 2024 Converter

A simple one-click batch script that automates the conversion process from a supported Windows edition to **Windows 11 IoT Enterprise LTSC 2024**.

Created by **Sherin Sunny**.

---

## Features

* Automatic SKU folder deployment
* Licensing component refresh
* Removal of existing product key information
* KMS configuration cleanup
* Installation of Microsoft generic conversion key
* Automatic startup of required Windows services
* One-click execution

---

## Requirements

* Windows 11 (supported edition)
* Administrator privileges
* IoTEnterpriseS SKU folder
* Genuine Windows 11 IoT Enterprise LTSC 2024 product key for activation

---

## Folder Structure

Place the files as shown below:

```text
Win11IoT/
│
├── convert.bat
└── IoTEnterpriseS/
```

---

## Usage

1. Download or copy the project files.
2. Ensure the `IoTEnterpriseS` folder is located beside `convert.bat`.
3. Right-click `convert.bat`.
4. Select **Run as Administrator**.
5. Wait for the script to complete.
6. Restart the computer.
7. Open:

```text
Settings → System → Activation
```

8. Enter your genuine Windows 11 IoT Enterprise LTSC 2024 product key.

---

## What the Script Does

### Step 1 – Deploy SKU Files

Copies the `IoTEnterpriseS` folder into:

```text
C:\Windows\System32\spp\tokens\skus
```

### Step 2 – Refresh Licensing Components

Runs:

```cmd
slmgr /rilc
```

### Step 3 – Remove Existing Licensing Information

Runs:

```cmd
slmgr /upk
slmgr /ckms
slmgr /cpky
```

### Step 4 – Install Conversion Key

Installs Microsoft's generic conversion key:

```cmd
slmgr /ipk KBN8V-HFGQ4-MGXVD-347P6-PDQGT
```

### Step 5 – Start Required Services

Starts:

* LicenseManager
* Windows Update (wuauserv)

---

## Important Notes

* The included generic key does **not** activate Windows.
* A valid Windows 11 IoT Enterprise LTSC 2024 license is required.
* This script must be executed with Administrator privileges.
* Always create a system backup before modifying licensing components.

---

## Disclaimer

This project is provided for educational and deployment automation purposes only.

The author is not responsible for any damage, data loss, licensing issues, or unsupported configurations resulting from the use of this script.

Use at your own risk.

---

## Author

**Sherin Sunny**

GitHub: Add your GitHub profile here.
