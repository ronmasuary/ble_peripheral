#if os(iOS)
    import Flutter
#elseif os(macOS)
    import Cocoa
    import FlutterMacOS
#endif
import Foundation
// import CoreBluetooth

public class BlePeripheralPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        var messenger: FlutterBinaryMessenger? = nil
        #if os(iOS)
            messenger = registrar.messenger()
        #elseif os(macOS)
            messenger = registrar.messenger
        #endif
        // let bleCallback = BleCallback(binaryMessenger: messenger!)
        // let api = BlePeripheralDarwin(bleCallback: bleCallback)
        // BlePeripheralChannelSetup.setUp(binaryMessenger: messenger!, api: api)
    }
}

private class BlePeripheralDarwin: NSObject, BlePeripheralChannel {
    
    var bleCallback: BleCallback
    // lazy var peripheralManager: CBPeripheralManager = .init(delegate: self, queue: nil, options: nil)
    // var cbCentrals = [CBCentral]()

    init(bleCallback: BleCallback) {
        self.bleCallback = bleCallback
        super.init()
    }

    func initialize() throws {
        print("Initialize called")
        print("isAdvertising false")
    }

    func isSupported() throws -> Bool {
        print("isSupportedCalled")
        // TODO: implement this
        return false
    }

    func isAdvertising() throws -> Bool {
        return false
    }

    func addServices(services: [BleService]) throws {
        services.forEach { service in
            print("iOS not implemented")
        }
    }

    func startAdvertising(services: [UUID], serviceDatas: [UUID : FlutterStandardTypedData], localName: String) throws {
        // let cbServices = services.map { uuidString in
        //     CBUUID(string: uuidString.value)
        // }
        // var advertisementData: [String: Any] = [:]
        // var serviceDataArray: [CBUUID: Data] = [:]
        
        // for (uuid, data) in serviceDatas {
        //     serviceDataArray[CBUUID(string: uuid.value)] = NSData(data)
        // }
        
        // advertisementData[CBAdvertisementDataServiceDataKey] = serviceDataArray
        
        // advertisementData[CBAdvertisementDataLocalNameKey] = localName
        // peripheralManager.startAdvertising(advertisementData)
        print("startAdvertising called")
    }

    func stopAdvertising() throws {
        print("stopAdvertising called")
    }

    func updateCharacteristic(central: BleCentral, characteristic: BleCharacteristic, value: FlutterStandardTypedData) throws {
        print("updateCharacteristic called")
        // let centralDevice: CBCentral? = cbCentrals.first(where: { device in
        //     central.uuid.value == device.identifier.uuidString
        // })
        // let char: CBMutableCharacteristic? = characteristic.find()
        // if centralDevice == nil {
        //     throw CustomError.notFound("\(central.uuid.value) device not found")
        // } else if char == nil {
        //     throw CustomError.notFound("\(characteristic.uuid.value) characteristic not found")
        // } else {
        //     peripheralManager.updateValue(value.toData(), for: char!, onSubscribedCentrals: [centralDevice!])
        // }
    }
}

