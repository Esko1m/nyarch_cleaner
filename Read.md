# NyArch Cleaner

NyArch Cleaner is a simple and efficient system cleanup tool for Arch Linux and its derivatives. It helps you clean your **Pacman cache**, remove **orphan packages**, and clear **temporary files** while keeping a log of all cleanup activities.

---

## Features

* **Pacman Cache Cleaning** – Free up space by removing cached packages.
* **Orphan Packages Removal** – Identify and remove packages that are no longer needed.
* **Temporary Files Cleaning** – Clear `/tmp` and `/var/tmp` directories.
* **Cleanup History Logging** – Maintains a log of all cleanup activities with timestamps.
* **Easy Installation** – Install via source or precompiled binary.

---

## Installation

### 1. Clone the Repository

```bash
git clone https://github.com/Esko1m/nyarch_cleaner.git
cd nyarch_cleaner
```

### 2. Run the Installer

```bash
sudo ./install.sh
```

The installer will:

1. Check if **Cargo** is installed.
2. If not found, it installs **Rust and Cargo** automatically.
3. Build the project in **release mode**.
4. Copy the binary to `/usr/local/bin`.
5. Create a log folder at `/var/log/nyarch_cleaner`.

After installation, you can run:

```bash
nyarch_cleaner
```

from anywhere.

---

## Usage

Run the tool and select an option:

```text
Select an option:
[1] Clean pacman cache
[2] Clean orphan packages
[3] Clean temp files
[4] Exit
```

* **Option 1:** Cleans Pacman cache.
* **Option 2:** Removes orphan packages.
* **Option 3:** Clears temporary files.
* **Option 4:** Exits the program.

---

## Logging

NyArch Cleaner keeps a log of all cleanup actions in:

```
/var/log/nyarch_cleaner/cleanup_history.log
```

Each entry includes:

* Timestamp
* Task performed
* Status (success/failure)
* Details of affected files or packages

Example:

```
[2025-10-26 20:00:00] Task: Clean pacman cache, Status: Success, Details: 1.2 GB cleared
```

---

## Uninstallation

To uninstall NyArch Cleaner:

```bash
sudo rm /usr/local/bin/nyarch_cleaner
sudo rm -rf /var/log/nyarch_cleaner
```

---

## Dependencies

* Rust (>= 1.90.0)
* Cargo
* NyArch Linux (or derivatives)

---

## Contributing

Feel free to fork, submit issues, or make pull requests.
contributed by Deep.

---

## License

This project is **MIT Licensed**.
