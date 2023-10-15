//
//  ContactInformation.swift
//  Hw4
//
//  Created by Damir Nabiullin on 15.10.2023.
//

import UIKit

struct ContactInformation: Hashable, Identifiable {
    var id: UUID = UUID()
    var fullName: String
    var avatar: UIImage?
}
