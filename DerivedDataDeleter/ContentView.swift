//
//  ContentView.swift
//  DerivedDataDeleter
//
//  Created by Saagar Jha on 11/17/19.
//  Copyright © 2019 Saagar Jha. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	static let spacing = 10

	let instructions = [
		#"Open System Preferences."#,
		#"Open the Extensions Pane."#,
		#"Select "Xcode Source Editor" from the pane on the right."#,
		#"Ensure that the checkbox next to \#(AppDelegate.appName) is checked."#,
		#"Restart Xcode and enjoy! You can find \#(AppDelegate.appName) in the Editor menu."#,
	]

	var body: some View {
		VStack(alignment: .leading, spacing: 10) {
			Text("To enable this extension:")
				.font(.headline)
			VStack(alignment: .leading) {
				ForEach(instructions.indices, id: \.self) { index in
					HStack(alignment: .top, spacing: 10) {
						Text("\(index + 1).")
							.frame(minWidth: 20)
						Text(self.instructions[index])
							.lineLimit(nil)
							.fixedSize(horizontal: false, vertical: true)
					}
				}
			}
		}
		.padding()
		.frame(width: 480)
	}
}


struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
