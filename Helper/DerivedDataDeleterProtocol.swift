//
//  DerivedDataDeleterProtocol.swift
//  Helper
//
//  Created by Saagar Jha on 11/17/19.
//  Copyright © 2019 Saagar Jha. All rights reserved.
//

import Foundation

@objc protocol DerivedDataDeleterProtocol {
	func deleteDerivedData(completion: @escaping (Error?) -> Void)
}
