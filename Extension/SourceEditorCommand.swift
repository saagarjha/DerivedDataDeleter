//
//  SourceEditorCommand.swift
//  Extension
//
//  Created by Saagar Jha on 11/17/19.
//  Copyright © 2019 Saagar Jha. All rights reserved.
//

import Foundation
import XcodeKit

class SourceEditorCommand: NSObject, XCSourceEditorCommand {
	lazy var connection: NSXPCConnection = {
		let connection = NSXPCConnection(serviceName: Bundle.init(for: Self.self).bundleIdentifier!.replacingOccurrences(of: "Extension", with: "Helper"))
		connection.remoteObjectInterface = NSXPCInterface(with: DerivedDataDeleterProtocol.self)
		connection.resume()
		return connection
	}()

	deinit {
		connection.invalidate()
	}

	func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void) -> Void {
		(connection.remoteObjectProxyWithErrorHandler {
			completionHandler($0)
		} as? DerivedDataDeleterProtocol)?.deleteDerivedData {
			completionHandler($0)
		}
	}
}
