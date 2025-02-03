//
//  ProfileCard.swift
//  GeometryReaderLab
//
//  Created by Gwen Thelin on 1/31/25.
//

import SwiftUI

struct ProfileCard: Identifiable {
	var id: UUID = UUID()
	
	var name: String
	var image: Image {
		let randomIndex = Int.random(in: 0..<ProfileCard.systemImages.count)
		return ProfileCard.systemImages[randomIndex]
	}
	
	private var _description: String = ""
	
	var description: String {
		get { return _description }
		set {
			if newValue.count <= 10 {
				_description = newValue
			} else {
				print("Description must be 10 characters or fewer.")
			}
		}
	}
	
	static let systemImages: [Image] = [
		Image(systemName: "star.fill"),
		Image(systemName: "heart.fill"),
		Image(systemName: "moon.fill"),
		Image(systemName: "cloud.fill")
	]
	
	static let firstNames: [String] = [
		"Gwen", "John", "Emma", "Oliver", "Sophia",
		"Liam", "Ava", "James", "Isabella", "Benjamin"
	]
	
	static let lastNames: [String] = [
		"Smith", "Johnson", "Williams", "Brown", "Jones",
		"Miller", "Davis", "Garcia", "Martinez", "Rodriguez"
	]
	
	var randomName: String {
		let randomFirstIndex = Int.random(in: 0..<ProfileCard.firstNames.count)
		let randomLastIndex = Int.random(in: 0..<ProfileCard.lastNames.count)
		return "\(ProfileCard.firstNames[randomFirstIndex]) \(ProfileCard.lastNames[randomLastIndex])"
	}
}

extension ProfileCard {
	init(name: String, description: String) {
		self.name = name
		self._description = description
	}
	
	init(_ description: String) {
		name = ProfileCard.firstNames.randomElement()! + " " + ProfileCard.lastNames.randomElement()!
		self._description = description
	}
}
