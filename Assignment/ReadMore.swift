//
//  ReadMore.swift
//  Assignment
//
//  Created by Hariom Palkar on 19/11/20.
//

import SwiftUI

struct ReadMore: View {
    
    var desc : String
    var body: some View {
        
        Text("\(desc)")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}

struct ReadMore_Previews: PreviewProvider {
    static var previews: some View {
        ReadMore(desc: "")
    }
}
