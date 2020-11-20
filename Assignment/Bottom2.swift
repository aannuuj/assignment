//
//  Bottom2.swift
//  Assignment
//
//  Created by Hariom Palkar on 20/11/20.
//

import SwiftUI

struct Bottom2: View {
    @State public var Tapped = false
    @State  var coins : String = "555"
    var body: some View {
        NavigationView{
            VStack(alignment: .center, spacing: 20){
                VStack(spacing: 10){
                    Text("Reward Ration")
                        .font(.title)
                    Text("Life rewards those who takes risks")
                        .font(.callout)
                }
                HStack(alignment: .center, spacing: 10){
                    ForEach(0 ..< 3) { _ in
                        VStack(alignment: .center, spacing: 10){
                            Circle()
                                .fill(Color.gray)
                                .frame(width: 100, height: 60)
                        }.font(.headline)
                    }
                }
                HStack(alignment: .center, spacing: 20){
                    Text("Wallet Balance:")
                    Image("coin")
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .center)
                    Text("\(coins)")
                    Spacer()
                    Button(action:{}){
                        Image("Add")
                    }
                }.padding(25)
                NavigationLink(destination: Buttom3(), isActive: $Tapped) { EmptyView() }
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
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct Bottom2_Previews: PreviewProvider {
    static var previews: some View {
        Bottom2()
    }
}
