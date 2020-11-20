//
//  BottomView.swift
//  Assignment
//
//  Created by Hariom Palkar on 19/11/20.
//

import SwiftUI

struct BottomView: View {
    @State public var Tapped = false
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center, spacing: 30){
                Text("Choose players")
                    .font(.title)
                
                HStack(alignment: .center, spacing: 50){
                    ForEach(0 ..< 2) { _ in
                        VStack(alignment: .center, spacing: 10){
                            Circle()
                                .fill(Color.gray)
                                .frame(width: 100, height: 80)
                            Text("Hariom Palkar")
                            Text("500")
                        }.font(.headline)
                    }
                }
                NavigationLink(destination: Bottom2(), isActive: $Tapped) { EmptyView() }
                Button(action: { withAnimation {
                    self.Tapped = true
                    print("hey")
                }}) {
                    Text("Next")
                        .bold()
                        .multilineTextAlignment(.center)
                }.frame(width: 380, height: 55)
                .background(Color(.green))
                .foregroundColor(.white)
                .cornerRadius(25)
            }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
        }
    }
}

struct BottomView_Previews: PreviewProvider {
    static var previews: some View {
        BottomView().previewLayout(.sizeThatFits)
    }
}
