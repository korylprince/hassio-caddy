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
