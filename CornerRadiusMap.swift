//
//  File.swift
//  PContributionsView
//
//  Created by 박준하 on 2022/11/22.
//

import Foundation

open class CornerRadiusMap {
    private final var ConrnerRadiusList: [Int] = []
    
    public static func checkCount(_ count: Int) throws {
        if(count > 10) {
            throw ContributionsError.OutOfCornerRadius
        }
    }
}

