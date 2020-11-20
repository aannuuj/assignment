////
////  ContentView.swift
////  Assignment
////
////  Created by Hariom Palkar on 18/11/20.
////
//
//import SwiftUI
//
//struct ContentView: View {
//    @State public var Tapped = false
//    var body: some View {
//        NavigationView{
//            VStack(alignment: .center, spacing: 20){
//                Text("PLAY")
//                    .font(.headline)
//                ZStack(alignment: .leading){
//                    RoundedRectangle(cornerRadius: 25, style: .continuous)
//                        .fill(Color.orange)
//                        .frame(width: 350, height: 500)
//                    VStack(alignment: .leading, spacing: 180){
//                        RoundedRectangle(cornerRadius: 25, style: .continuous)
//                            .fill(Color.yellow)
//                            .frame(width: 100, height: 100)
//                        
//                        Button(action: { withAnimation {
//                            self.Tapped.toggle()}
//                        }) {
//                            Text("Button")
//                        }.frame(width: 300, height: 55)
//                        .background(Color(.green))
//                        .foregroundColor(.white)
//                        .cornerRadius(25)
//                    }.padding(.leading, 20)
//                }
//                NavigationLink(destination: DetailsView(), isActive: $Tapped) { EmptyView() }
//                Rectangle()
//                    .fill(Color.yellow)
//                    .frame(width: 350, height: 200)
//                    .cornerRadius(20, corners: [.topLeft, .topRight])
//            }
//           
//        }
//        }
//        
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//
//extension View {
//    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
//        clipShape( RoundedCorner(radius: radius, corners: corners) )
//    }
//}
//struct RoundedCorner: Shape {
//    
//    var radius: CGFloat = .infinity
//    var corners: UIRectCorner = .allCorners
//    
//    func path(in rect: CGRect) -> Path {
//        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//        return Path(path.cgPath)
//    }
//}
