# Orange Pi Zero 2W Optimizations

The Orange Pi Zero 2W branch includes specific optimizations to take advantage of the improved hardware capabilities compared to Raspberry Pi boards. This document details the enhancements made specifically for Orange Pi.

## Bluetooth Enhancements

### Increased Transmit Power
- Orange Pi Zero 2W's Bluetooth radio supports higher transmission power
- Configured to use higher power class via HCI commands in boot scripts
- Bluetooth name prefix changed to "OPiAuto-" for easier identification

### Improved Connection Settings
- Reduced retry delay times (5-10 seconds instead of 10-20)
- FastConnectable mode enabled for quicker pairing
- Enhanced ReconnectUUIDs configuration for better reconnection reliability

### Scanning Optimizations
- More aggressive scanning for better range detection
- Enhanced connection retry logic specific to the RTL8723CS chip

## WiFi Optimizations

### Advanced Hostapd Configuration
- Added IEEE 802.11n support
- Optimized beacon interval and DTIM periods
- Enhanced QoS (Quality of Service) settings for better streaming
- Customized WMM (Wireless Multimedia) parameters for reduced latency

### 5GHz Support Detection
- Automatically detects if 5GHz WiFi is supported
- Creates dual-band setup with both 2.4GHz and 5GHz networks if supported
- Optimized 5GHz configuration with 802.11ac support
- Separate networks with optimized settings for each band

### WiFi Module Optimization
- Enhanced RTL8723CS driver parameters for better performance
- Disabled power management for maximum throughput
- Enabled VHT (Very High Throughput) features
- Optimized AMPDU/AMSDU settings for improved data rates
- Advanced beamforming capabilities enabled

### WiFi Network Performance
- Custom WiFi interface configuration with optimized parameters
- TX power control for maximum range
- TX queue optimizations for low latency
- Buffer memory optimizations for better throughput
- Kernel QoS support for traffic prioritization

### TCP/IP Performance
- Enhanced socket buffer sizes (128KB)
- TCP_NODELAY enabled for lower latency
- Increased socket priority for main connections
- Increased connection backlog for better handling of multiple devices
- Low latency mode enabled for TCP connections

## USB Performance Enhancements

### Enhanced Buffer Settings
- Increased USB buffer size for better throughput
- Dynamic buffer size adjustment based on available memory
- Custom USB controller configuration for the Allwinner H618 SoC

### Gadget Mode Optimizations
- Manufacturer string set to "Orange Pi Auto" for better identification
- Optimized USB descriptor configuration

## System-level Improvements

### Power Management
- Added power management optimizations for the Allwinner H618 SoC
- Enhanced kernel configuration for better power efficiency

### Default Configurations
- Pre-configured for optimal performance on Orange Pi hardware
- Default high-performance mode enabled
- Increased connection retry count (5 instead of 3)
- Protocol version set to 2 by default

## Using Orange Pi Optimizations

The optimizations are automatically applied when running on Orange Pi Zero 2W hardware. No manual configuration is required as the system detects the hardware at boot time.

### Dual-Band WiFi Support

If your Orange Pi Zero 2W supports 5GHz WiFi, the system will automatically create two WiFi networks:
- `AAWirelessDongle` - 2.4GHz network for compatibility
- `AAWirelessDongle-5G` - 5GHz network for higher performance

You can connect your phone to either network. The 5GHz network will provide better performance if your phone is within range.

### Building the Image

To build an image for Orange Pi Zero 2W with all optimizations:

```shell
$ docker compose run --rm opi02w
```

This will generate an SD card image for the Orange Pi Zero 2W with all hardware-specific enhancements enabled.