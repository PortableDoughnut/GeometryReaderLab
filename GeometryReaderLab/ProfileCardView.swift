//
//  ProfileCardView.swift
//  GeometryReaderLab
//
//  Created by Gwen Thelin on 1/31/25.
//

import SwiftUI

struct ProfileCardView: View {
	var description: String
	
	var body: some View {
		let card: ProfileCard = .init(description)
			
			VStack {
				card.image
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: .infinity, height: .infinity)
					.padding()
				Text(card.name)
					.font(.headline)
				Text(card.description)
					.font(.caption)
					.padding(.bottom)
			}
			.background(.gray.opacity(0.2))
			.cornerRadius(10)
			.padding(5)
		}
	}
