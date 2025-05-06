# Unified Updates for Wireless Android Auto Dongle

This branch contains both hardware and software updates for the Wireless Android Auto Dongle project. It combines:

1. Hardware support for the Orange Pi Zero 2W
2. Software enhancements for improved protocol compatibility and connection stability

## Hardware Support: Orange Pi Zero 2W

The Orange Pi Zero 2W hardware support includes:

- Support for Allwinner H618 SoC (quad-core Cortex-A53)
- USB OTG/gadget mode configuration for H618
- WiFi and Bluetooth support for the RTL8723CS chip
- Boot scripts and SD card image generation
- Build system integration

This allows creating a Wireless Android Auto dongle using the affordable Orange Pi Zero 2W board as an alternative to Raspberry Pi boards.

## Software Enhancements

The software updates include:

- Protocol version negotiation for compatibility with newer Android phones
- Improved connection stability with TCP keepalive
- Configurable connection retry mechanism
- Enhanced performance settings
- New configuration options

## Using the Unified Updates

### Building for Orange Pi Zero 2W

```shell
$ docker compose run --rm opi02w
```

This will generate an SD card image for the Orange Pi Zero 2W with all software enhancements included.

### Configuration Options

In addition to the standard configuration options, the following new options are available in `/etc/aawgd.conf`:

```
## Protocol Version
## Set the protocol version to use with the phone. This may help with compatibility for certain phones.
## Options: 1 (legacy), 2 (includes version negotiation support)
## Default: 2
#AAWG_PROTOCOL_VERSION=2

## Connection Retries
## Number of times to retry connecting to the phone if the initial connection fails.
## Default: 3
#AAWG_CONNECTION_RETRIES=3

## Enable High Performance Mode
## Optimize for performance but may use more power
## Default: 0 (disabled)
#AAWG_HIGH_PERFORMANCE=0
```

## Compatibility

This unified branch is backward compatible with all previously supported Raspberry Pi boards while adding support for Orange Pi Zero 2W and enhancing the software for all platforms.

## Troubleshooting

Refer to the README.md for general troubleshooting steps. For specific issues:

- For hardware-specific issues on Orange Pi Zero 2W, make sure you're using the correct USB-C port for OTG mode
- For connection issues with specific phones, try adjusting the protocol version and connection retries settings