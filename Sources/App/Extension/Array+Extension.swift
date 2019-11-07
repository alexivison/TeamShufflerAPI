//
//  Array+Extension.swift
//  App
//
//  Created by tuominen-aleksi on 2019/11/07.
//

import Foundation

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
    
    func split() -> (left: [Element], right: [Element]) {
        let ct = self.count
        let half = ct / 2
        let leftSplit = self[0 ..< half]
        let rightSplit = self[half ..< ct]

        return (left: Array(leftSplit), right: Array(rightSplit))
    }
}
