import SwiftUI

struct ContentView: View {
    @State var tabIndex = Int()
    var body: some View {
        ZStack{
            switch tabIndex{
            case 0:
                LinksTabView()
            case 1:
                Color.red
            case 2:
                Color.pink
            case 3:
                Color.blue
            case 4:
                Color.white
            default:
                Color.gray
            }

            VStack{
                Spacer()
                CustomTabView(tabIndex: $tabIndex)
            }
            
        }
        .ignoresSafeArea()
        
    
    }
}

struct CustomTabView:View {
    @Binding var tabIndex:Int
    var body: some View {
        HStack{
            Spacer()
            Button(action: {
                tabIndex = 0
            }, label: {
                VStack{
                    Image(systemName: "link")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Links")
                        .font(.system(size: 12))
                }
                .foregroundColor(.black)
                .opacity(tabIndex == 0 ? 1: 0.2)


            })
            Spacer()
            Button(action: {
                tabIndex = 1
            }, label: {
                VStack{
                    Image(systemName: "book")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Courses")
                        .font(.system(size: 12))
                }
                .foregroundColor(.black)
                .opacity(tabIndex == 1 ? 1: 0.2)


                    
            })
            Spacer()

                Button(action: {
                    tabIndex = 2
                }, label: {
                    Image("plus")
                       
                    

            })
                .frame(width: 60, height: 60)
                .background(.blue)
                .cornerRadius(30)
                .shadow(color: .blue,radius: 2)
                .offset(x: 12 ,y: -30)
            Spacer()

            Button(action: {
                tabIndex = 3
            }, label: {
                VStack{
                    Image(systemName:"megaphone")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Campaigns")
                        .font(.system(size: 12))
                }
                .foregroundColor(.black)
                .opacity(tabIndex == 3 ? 1: 0.2)


            })
            Spacer()

            Button(action: {
                tabIndex = 4
            }, label: {
                VStack{
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Profile")
                        .font(.system(size: 12))
                }
                .foregroundColor(.black)
                .opacity(tabIndex == 4 ? 1: 0.2)


            })
            Spacer()
            
        }
       
        .frame(width: UIScreen.main.bounds.width, height: 80)
        .padding(.horizontal)
        .padding(.top, 30)
        .background(.white)
        .clipShape(CustomShape())
        .shadow(radius: 5)
        
    }
}

struct CustomShape: Shape{
    func path(in rect: CGRect) -> Path {
        Path{ path in
            
            path.move(to: CGPoint(x: 0, y: 35) )
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width , y: 35))
            
            path.addArc(center: CGPoint(x: rect.width / 2, y: 35), radius: 35, startAngle: .zero, endAngle: .init(degrees: 10) , clockwise: true)
        }
    }
    
    
}

#Preview {
    ContentView()
}
