//
//  ContentView.swift
//  GeometryReaderLab
//
//  Created by Gwen Thelin on 1/31/25.
//

import SwiftUI

struct ContentView: View {
	@Environment(\.horizontalSizeClass) var horizontalSizeClass
	@Environment(\.verticalSizeClass) var verticalSizeClass
	
	let profileDataset: [ProfileCardView] = [
		ProfileCardView(description: "A pal"),
		ProfileCardView(description: "Another pal"),
		ProfileCardView(description: "A new pal"),
		ProfileCardView(description: "One more pal")
	]
	
	var body: some View {
		GeometryReader { geometry in
			var gridItemWidth: Double {
				max((geometry.size.width / 2.6) - 20, 100)
			}
			
			var gridItemHeight: Double {
				max((geometry.size.height / 3) - 20, 100)
			}
			
			if horizontalSizeClass == .compact {
				ScrollView(.vertical) {
					LazyVGrid(columns: [
						GridItem(.fixed(gridItemWidth)),
						GridItem(.fixed(gridItemWidth))
					], alignment: .center, spacing: 10) {
						ForEach(profileDataset, id: \.description) { profile in
							ProfileCardView(description: profile.description)
						}
					}
					.padding(10)
				}
			}
			if horizontalSizeClass == .regular {
				ScrollView(.horizontal) {
					LazyHGrid(rows: [
						GridItem(.fixed(gridItemHeight)),
						GridItem(.fixed(gridItemHeight)),
						GridItem(.fixed(gridItemHeight))
					], alignment: .center, spacing: 10) {
						ForEach(profileDataset, id: \.description) { profile in
							ProfileCardView(description: profile.description)
						}
					}
					.padding(10)
					.padding()
				}
			}
		}
	}
}

#Preview {
    ContentView()
}
