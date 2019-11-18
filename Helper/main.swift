//
//  main.swift
//  Helper
//
//  Created by Saagar Jha on 11/17/19.
//  Copyright © 2019 Saagar Jha. All rights reserved.
//

import Foundation

class DerivedDataDeleter: DerivedDataDeleterProtocol {
	func deleteDerivedData(completion: (Error?) -> Void) {
		do {
			try FileManager.default.removeItem(at:
				UserDefaults(suiteName: "com.apple.dt.Xcode")?
					.string(forKey: "IDECustomDerivedDataLocation")
					.flatMap(URL.init(fileURLWithPath:)) ??
				URL(fileURLWithPath:
					NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first!)
					.appendingPathComponent("Developer", isDirectory: true)
					.appendingPathComponent("Xcode", isDirectory: true)
					.appendingPathComponent("DerivedData", isDirectory: true)
			)
		} catch {
			completion(error)
		}
		completion(nil)
	}
}

class Service: NSObject, NSXPCListenerDelegate {
	func listener(_ listener: NSXPCListener, shouldAcceptNewConnection newConnection: NSXPCConnection) -> Bool {
		newConnection.exportedInterface = NSXPCInterface(with: DerivedDataDeleterProtocol.self)
		newConnection.exportedObject = DerivedDataDeleter()
		newConnection.resume()
		return true
	}
}

let service = Service()
let listener = NSXPCListener.service()
listener.delegate = service
listener.resume()

