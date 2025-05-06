# Software Updates for Wireless Android Auto Dongle

This branch contains software updates to enhance compatibility with newer Android phones and improve the stability of the wireless Android Auto dongle. These updates are experimental and designed to work with all supported hardware platforms.

## Key Improvements

1. **Protocol Version Negotiation**
   - Added support for protocol version negotiation to enhance compatibility with newer phones
   - New WifiVersionRequest and WifiVersionResponse protocol messages
   - Default to protocol v2 but fall back to v1 for older devices

2. **Improved Connection Stability**
   - Extended TCP timeout from 10 to 30 seconds for better stability with newer phones
   - Added TCP keepalive settings to prevent connections from dropping
   - Configurable connection retry count

3. **Performance Enhancements**
   - Added high performance mode option
   - Reduced retry delay when in high performance mode
   - Improved socket handling

## New Configuration Options

Added the following configuration options to `/etc/aawgd.conf`:

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

## Using Both Hardware and Software Updates

If you want to combine the Orange Pi Zero 2W hardware support with these software updates, you can merge this branch with the hardware-specific branch.

## Troubleshooting

If you experience connection issues with a specific phone model:

1. Try setting `AAWG_PROTOCOL_VERSION=1` for older Android devices
2. Increase `AAWG_CONNECTION_RETRIES` if the connection takes longer to establish
3. Enable `AAWG_HIGH_PERFORMANCE=1` for faster reconnection attempts

## Technical Details

The implementation enhances the Android Auto Wireless protocol communication with:

1. Version negotiation messages
2. Enhanced TCP socket configuration
3. Improved Bluetooth connection retry logic
4. Configurable protocol settings