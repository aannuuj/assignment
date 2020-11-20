//
//  ViewExt.swift
//  Assignment
//
//  Created by Hariom Palkar on 18/11/20.
//

import Foundation
import SwiftUI

public extension View {
    func fillParent(alignment: Alignment = .center) -> some View {
        self
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: alignment
            )
    }
}
