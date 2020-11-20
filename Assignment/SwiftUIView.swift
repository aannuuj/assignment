//
//  SwiftUIView.swift
//  Assignment
//
//  Created by Hariom Palkar on 19/11/20.
//

import SwiftUI

struct SwiftUIView: View {
    
    let name = "Hariom"
    let itemHeight:CGFloat = 500
    let imageHeight:CGFloat = 400
    let SVWidth = UIScreen.main.bounds.width - 40
    
    @State private var showBottomSheet = false
    @State var expandedItem = Item(name: "", description: "", subtitle: "", image: "", logo: "")
    @State var expandedScreen_startPoint = CGRect(x: 0, y: 0, width: 100, height: 100)
    @State var expandedScreen_returnPoint = CGRect(x: 0, y: 0, width: 100, height: 100)
    @State var expandedScreen_shown = false
    @State var expandedScreen_willHide = false
    @State var showingDetail = false
    
    var body: some View {
        ZStack{
            Color.white.edgesIgnoringSafeArea(.all)
            ScrollView{
                HStack{
                    VStack(alignment: .leading){
                        Text("Welocme back \(name)!")
                            .font(.system(size: 18, weight: .bold, design: .default))
                            .foregroundColor(.gray)
                        Text("Play Now").font(.system(size: 40, weight: .bold, design: .default)).foregroundColor(.black)
                    }
                    Spacer()
                }
                .padding(.init([.leading, .top , .trailing]))
                
                ForEach(items, id: \.id){thisItem in
                    GeometryReader{geo -> AnyView in
                        return AnyView(
                            ZStack{
                                Image(thisItem.image)
                                    .resizable()
                                    .scaledToFill()
                                    .opacity(0.9)
                                    .frame(width:self.SVWidth, height: self.itemHeight)
                                    .clipped()
                                    .background(Color.white)
                                    VStack(alignment: .leading){
                                        HStack{
                                            VStack(alignment: .leading)
                                            {
                                                HStack(alignment: .top){
                                                    ZStack{
                                                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                                                        .fill(Color.black)
                                                        .frame(width: 130, height: 130)
                                                        .shadow(color: .init(red: 0.1, green: 0.1, blue: 0.1) , radius: 11 , x: 0, y: 4)
                                                        Image(thisItem.logo)
                                                            .resizable()
                                                            .frame(width: 80, height: 80)
                                                            .padding(5)
                                                    }.opacity(0.9)
                                                    Spacer()
                                                }
                                                
                                            }.padding()
                                            Spacer()
                                        }
                                        Spacer()
                                        Text("\(thisItem.subtitle)")
                                            .font(.system(size: 48, weight: .bold, design: .default))
                                            .foregroundColor(.init(white: 0.9)).opacity(0.9)
                                            .padding(.init([.leading, .top , .bottom]))
                                        Button(action: {
                                            self.expandedItem = thisItem
                                            let x = geo.frame(in: .global).minX
                                            let y = geo.frame(in: .global).minY
                                            let thisRect = CGRect(x: x,y: y,width:self.SVWidth,height: self.itemHeight)
                                            self.expandedScreen_returnPoint = thisRect
                                            self.expandedScreen_startPoint =  thisRect
                                            Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { (timer) in
                                                self.expandedScreen_shown = true
                                                self.expandedScreen_startPoint =  CGRect(x: 0,y: 0,width:UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height) }
                                        }){
                                            Text("Check")
                                        }.frame(width: 300, height: 55)
                                        .background(Color(.white))
                                        .foregroundColor(.black)
                                        .cornerRadius(15)
                                        .padding(.init([.leading, .bottom]))
                                        .shadow(color: .init(red: 0.1, green: 0.1, blue: 0.1) , radius: 11 , x: 0, y: 4 )
                                    }
                                    .frame(width: self.SVWidth)
                                    
                            }
                            .cornerRadius(15).foregroundColor(.white)
                            .shadow(color: .init(red: 0.1, green: 0.1, blue: 0.1) , radius: 11 , x: 0, y: 4))
                    }.background(Color.clear.opacity(0.4))
                    .frame(height:self.itemHeight)
                    .padding(.init([.leading, .trailing , .bottom]), 20)
                }.coordinateSpace(name: "forEach")
                
                //ForEach_End
            }
            GeometryReader{geo -> AnyView in
                let thisItem = self.expandedItem
                return AnyView(
                    ZStack{
                        Color.white.edgesIgnoringSafeArea(.all)
                        ScrollView{
                            VStack(){
                                ZStack{
                                    VStack(alignment: .center, spacing: 50){
                                        Spacer()
                                            .frame(height: 20)
                                        VStack(alignment: .leading, spacing: 20){
                                            HStack(alignment: .center){
                                                ZStack{
                                                RoundedRectangle(cornerRadius: 25, style: .continuous)
                                                    .fill(Color.black)
                                                    .frame(width: 130, height: 130)
                                                    .shadow(color: .init(red: 0.1, green: 0.1, blue: 0.1) , radius: 11 , x: 0, y: 4)
                                                    Image(thisItem.logo)
                                                        .resizable()
                                                        .frame(width: 120, height: 120)
                                                        .padding(25)
                                                }

                                                HStack(alignment: .center, spacing: 10){
                                                    Text(thisItem.subtitle)
                                                        .font(.title)
                                                        .fontWeight(.semibold)
                                                    Spacer()
                                                }.padding(.top)
                                            }
                                            Text("\(thisItem.description)")
                                                .lineLimit(2)
                                                .font(.system(size: 18, weight: .bold, design: .default))
                                                .foregroundColor(.black)
                                        }.padding(.leading)
                                        Button(action: {self.showingDetail.toggle()}, label: {
                                            Text("READ MORE")
                                                .fontWeight(.semibold)
                                        }).accentColor(.green)
                                        .sheet(isPresented: $showingDetail) {
//                                            ReadMore(desc: thisItem.description)
                                                }
                                        ScrollView(.horizontal, showsIndicators: false) {
                                            HStack{
                                                ForEach(0 ..< 5) {_ in
                                                    Image("Image")
                                                        .resizable()
                                                        .frame(width: 200, height: 300)
                                                }
                                            }
                                        }.padding(.leading)
                                        Button(action: { withAnimation {
                                            self.showBottomSheet.toggle()
                                          }}) {
                                            Text("DOWNLOAD\n30MB")
                                                .bold()
                                                .multilineTextAlignment(.center)
                                        }.frame(width: 330, height: 55)
                                        .background(Color(.green))
                                        .foregroundColor(.white)
                                        .cornerRadius(25)
                                        
                                    }
                                }
                            }
                        }
                        .frame(width: self.expandedScreen_startPoint.width, height: UIScreen.main.bounds.height)
                        .background(Color.white)
                        .cornerRadius(self.expandedScreen_shown ? 0 : 15 )
                        .animation(.easeInOut(duration: 0.2))
                        .offset(x: self.expandedScreen_startPoint.minX, y: self.expandedScreen_startPoint.minY)
                        
                        Button(action: {
                            self.expandedScreen_willHide = true
                            self.expandedScreen_startPoint = self.expandedScreen_returnPoint
                            self.expandedScreen_shown = false
                            Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { (timer) in
                                self.expandedScreen_willHide = false
                            }
                        }){
                            Image(systemName: "multiply")
                                .foregroundColor(.black)
                                .font(.system(size: 25))
                                .padding(.trailing, 30)
                                .padding(.top)
                                .opacity(self.expandedScreen_shown ? 1 : 0.0)
                                .animation(
                                    Animation.easeInOut(duration: 0.3)
                                )
                        }.offset(x: (UIScreen.main.bounds.width/2) - 30, y: (-1 * UIScreen.main.bounds.height/2) + 60)
                    }
                )
            }.edgesIgnoringSafeArea(.top)
            .opacity(self.expandedScreen_shown ? 1 : 0.0)
            .animation(
                Animation.easeIn(duration: 0.02)
                    .delay(self.expandedScreen_willHide ? 0.2 : 0)
            )
            BottomSheetModal(display: $showBottomSheet) {
             Bottom2()
            }
        }
    }
}



struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
