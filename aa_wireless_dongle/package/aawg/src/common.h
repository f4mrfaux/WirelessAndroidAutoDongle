#pragma once

#include <string>
#include <cstdint>
#include <optional>

enum SecurityMode: int;
enum AccessPointType: int;

struct WifiInfo {
    std::string ssid;
    std::string key;
    std::string bssid;
    SecurityMode securityMode;
    AccessPointType accessPointType;
    std::string ipAddress;
    int32_t port;
};

enum class ConnectionStrategy {
    DONGLE_MODE = 0,
    PHONE_FIRST = 1,
    USB_FIRST = 2
};

class Config {
public:
    static Config* instance();

    WifiInfo getWifiInfo();
    ConnectionStrategy getConnectionStrategy();
    int32_t getProtocolVersion();
    int32_t getConnectionRetries();
    bool getHighPerformanceMode();

    std::string getUniqueSuffix();
private:
    Config() = default;

    int32_t getenv(std::string name, int32_t defaultValue);
    std::string getenv(std::string name, std::string defaultValue);
    bool getenvBool(std::string name, bool defaultValue);

    std::string getMacAddress(std::string interface);

    std::optional<ConnectionStrategy> connectionStrategy;
    std::optional<int32_t> protocolVersion;
    std::optional<int32_t> connectionRetries;
    std::optional<bool> highPerformanceMode;
};

class Logger {
public:
    static Logger* instance();

    void info(const char *format, ...);
private:
    Logger();
    ~Logger();
};