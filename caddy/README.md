# About

This unofficial add-on gives an easy way to add [Caddy](https://caddyserver.com/) to your [Hass.io](https://home-assistant.io/hassio/) device.

# Why?

There's [another Caddy add-on](https://github.com/bestlibre/hassio-addons/tree/master/caddy_proxy) already, so why this one? That add-on is geared towards using Caddy as a simple proxy, but I wanted another option where I can just write a Caddyfile.

# Installation

See the actual [repository](https://github.com/korylprince/hassio-caddy/) for installation instructions.

# Configuration

Using the [SSH](https://home-assistant.io/addons/ssh/) or [Samba](https://home-assistant.io/addons/samba/) add-ons, create the `/share/caddy` folder. Place a Caddyfile at `/share/caddy/Caddyfile`. There's also access to the `/ssl` folder if you want to use certificates from another add-on, or use this add-on to create certificates for other add-ons. Finally, this add-on uses Host networking so you can listen on any ports you need.

You can pass flags to Caddy by using the `flags` option in the Hass.io config. Example:

    {
        "flags": [
            "-agree",
            "-email",
            "user@example.com"
            ]
    }

You can also pass environment variables to Caddy by using the `env_vars` option in the Hass.io config. Example:

    {
        "env_vars": [
            "CLOUDFLARE_EMAIL=mail@example.com",
            "CLOUDFLARE_API_KEY=1f25dc1b6deb8e65948ca61d157f3038c"
            ]
    }

**Note**: The string is parsed as bash after being JSON-decoded, so if you need to include spaces or other special characters, you can wrap your value in quotes: `"SPECIAL=\"some spaces\""`

# Updates/Plugins

#### Explanation
This add-on uses the [latest version of Caddy built for Alpine Linux.](https://pkgs.alpinelinux.org/packages?name=caddy&branch=v3.9) This version usually lags behind the latest Caddy stable version.

Additionally, due to the way Caddy plugins work<sup>1</sup>, it's impossible to allow arbitrary plugins (or any at all) with this packaged Caddy.

Luckily, since Caddy is written in Go, it compiles to a single binary which makes it easy to run a custom Caddy build with whatever version and plugins you want.

#### Custom Caddy binaries
You can [build your own version of Caddy](https://github.com/mholt/caddy#build), but it's really easy to download a custom build from [Caddy's website](https://caddyserver.com/download). Make sure to select the correct Linux architecture (Raspberry Pi's will use ARMv6 or ARMv7 depending on the version of the hardware and OS.) The binary is the file named `caddy` in the root of the downloaded `.tar.gz` file.

#### Install
To use a custom binary, just name it `caddy.bin` and place it in the same folder (`/share/caddy/`) as your `Caddyfile`. Restart the add-on to start using the custom version.

<sup>1</sup> Caddy plugins are currently built directly into the binary. Go, the language Caddy is written in, does have some support for building plugins, but Caddy doesn't currently support this (as far as I can tell, at least.)
