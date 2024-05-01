# Libft

*Your very first own library*.

This project is about coding a C library.
It will contain a lot of general purpose functions your programs will rely upon.

## Requirements

Make sure you have the essentials to build C language.

* Ubuntu/Debian

```bash
sudo apt install -y build-essential
```

* Fedora/RHEL

```bash
sudo dnf groupinstall -y "C Development Tools and Libraries"
```

* Arch Linux

```bash
sudo pacman -S --noconfirm base-devel
```

* Void Linux

```bash
sudo xbps-install -Sy base-devel
```

## Build

```bash
git clone https://github.com/jaredyalves/libft.git
cd libft/project/
make
```

## Usage

Include when creating the executable.

```make
-L ./libft -lft
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

## License

[The Unlicense](https://choosealicense.com/licenses/unlicense/)
