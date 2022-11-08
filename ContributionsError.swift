//
//  ContributionsError.swift
//  PContributionsView
//
//  Created by 박준하 on 2022/11/08.
//

import Foundation

public enum ContributionsError : Error {
    case OutOfColorSize
}

extension ContributionsError : CustomStringConvertible {
    public var description: String {
        switch self {
        case .OutOfColorSize:
            return "Size of Colors must be 5."
        }
    }
}
