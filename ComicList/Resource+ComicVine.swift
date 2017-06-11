//
//  Resource+ComicVine.swift
//  ComicList
//
//  Created by Guille Gonzalez on 12/03/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation
import Networking

let apiKey = "08c6d00e1a91440a50564c01f711016dc6572d51"
private let apiURL = URL(string: "http://www.comicvine.com/api")!

extension Resource where M: JSONDecodable {

	init(comicVinePath path: String, parameters: [String: String]) {
		self.init(
			url: apiURL.appendingPathComponent(path),
			parameters: parameters,
			decode: decode(data:)
		)
	}
}
