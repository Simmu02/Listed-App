

import SwiftUI



func getGreeting()->String{
    
    let calender = Calendar.current
    let currentHour = calender.component(.hour, from: Date())
    let greeting:String
    
    if currentHour >= 18 {
        greeting = "Good Evening"
    } else if currentHour >= 12 {
        greeting =  "Good Afternoon"
    } else {
        greeting =  "Good Morning"
    }
    return greeting
}

struct LinksTabView: View {
    let rows = [GridItem(.fixed(150))]
    @State var data:ApiResponseModel?
    @State var recentDataList = [LinksData]()
    @State var topLinksList = [LinksData]()
    @State var linksBtnIndex = Int()
    
    // 92 51 207

    // 14 111 255

    // 255 233 236
    // 255 179 25

   

    var body: some View {
        ScrollView(showsIndicators: false){
            
            ZStack{
                Color.blue
                VStack{
                    Spacer()
                    
                    HStack{
                        Text("DashBoard")
                            .font(.title)
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                        Spacer()
                        Button(action: {}, label: {
                            Image("settings")
                        })
                        .frame(width: 40, height: 40)
                        .background(.white.opacity(0.1))
                        .cornerRadius(10)
                        
                    }
                    .padding()
                    .padding(.horizontal)
                    .padding(.top, 60)
                   
                    
                    Spacer()
                    
                    VStack{
                        HStack{
                            Text(getGreeting())
                                .font(.system(size: 18))
                                .foregroundStyle(Color.gray)
                            Spacer()
                        }
                        .padding(.top, 40)
                        .padding(.horizontal)
                        
                        HStack{
                            Text("Simarjeet Kaur")
                                .font(.title)
                                .bold()
                            Image("hand")
                            Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.top, 4)
                        //TODO: Grid
                        AreaChart()
                        ScrollView(.horizontal, showsIndicators: false){
                            
                            LazyHGrid(rows: rows,spacing: 15, content: {
                                LocationGridView(data:  GridModel(image: "clicks", title: "Today's Clicks", color: Color(red: 92/255, green: 51/255,blue: 207/255)),value: "\(data?.todayClicks ?? 0)")
                                LocationGridView(data: GridModel(image: "location", title: "Top Location", color: Color(red: 14/255, green: 111/255, blue: 255/255)), value: data?.topLocation ?? "")
                                LocationGridView(data:  GridModel(image: "globe", title: "Source", color: Color(red: 255/255, green: 78/255, blue: 100/255)), value: data?.topSource ?? "")
                                LocationGridView(data:  GridModel(image: "time", title: "Start Time", color: Color(red: 255/255, green: 179/255, blue: 25/255)), value: data?.startTime ?? "")
                            })
                            
                        }
                        .padding()
                        
                        
                        Button(action: {}, label: {
                            Image("Arrows")
                            Text("View Analytics")
                                .foregroundStyle(Color.black)
                                .font(.system(size: 14))
                                .bold()
                        })
                        .frame(width: UIScreen.main.bounds.width - 40, height: 40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray, lineWidth: 1)
                        )
                        
                        .padding()
                        //TODO: List
                        ListHeaderButtons(btnIndex: $linksBtnIndex)
                        VStack{
                            List{
                                if self.linksBtnIndex == 0{
                                    ForEach(recentDataList, id: \.urlId){i in
                                        LinksList(linkData: i)
                                            .listRowInsets(EdgeInsets())
                                            .padding(.top ,14)
                                        
                                    }
                                }
                                
                                else if linksBtnIndex == 1{
                                    ForEach(topLinksList, id: \.urlId){i in
                                        LinksList(linkData: i)
                                            .listRowInsets(EdgeInsets())
                                            .padding(.top,14)
                                        
                                    }

                                }
                            }.listRowSpacing(20)
                                .frame(minHeight: 664)
                        
                        }
                            
                        
                        Button(action: {}, label: {
                           
                                Image("link_black")
                                Text("View all links")
                                    .foregroundStyle(.black)
                                    .bold()
                             
                        })
                        .frame(width: UIScreen.main.bounds.width - 40, height: 55)
                        .overlay{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray.opacity(0.3), lineWidth: 2)
                        }
                        .padding(.top)
                        Button(action: {
                            
                            let whatsappDeepLinkUrl = "whatsapp://send?phone=+91\(data?.supportWhatsappNumber ?? "")"
                            if let urlString = whatsappDeepLinkUrl.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed){
                                if let whatsappUrl = URL(string: urlString){
                                    if UIApplication.shared.canOpenURL(whatsappUrl){
                                        UIApplication.shared.openURL(whatsappUrl)
                                    }
                                }else{
                                    
                                }
                            }
                        }, label: {
                            HStack{
                                Image("whatsapp_icon")
                                Text("Talk with us")
                                    .foregroundStyle(.black)
                                    .bold()
                                Spacer()
                            }
                            .padding(.horizontal)
                        })
                        .frame(width: UIScreen.main.bounds.width - 40, height: 55)
                        .background(Color(red: 74/255, green: 209/255, blue: 95/255).opacity(0.2))
                        .cornerRadius(10)
                        .overlay{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 74/255, green: 209/255, blue: 95/255))
                        }
                        .padding(.top)
                        Button(action: {}, label: {
                            HStack{
                                Image("question_icon")
                                Text("Frequently Asked Questions")
                                    .foregroundStyle(.black)
                                    .bold()
                                Spacer()
                            }
                            .padding(.horizontal)
                        })
                        .frame(width: UIScreen.main.bounds.width - 40, height: 55)
                        .background(.blue.opacity(0.1))
                        .cornerRadius(10)
                        .overlay{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.blue.opacity(0.5))
                        }
                        .padding(.vertical)
                        
                        .padding(.bottom, 120)
                        
                        
                        
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .background(Color(red: 245 / 255, green: 245 / 255, blue: 245 / 255))
                    .clipShape(
                        .rect(
                            topLeadingRadius: 20,
                            bottomLeadingRadius: 0,
                            bottomTrailingRadius: 0,
                            topTrailingRadius: 20
                        )
                    )
                    
                    
                    
                }
            }
            .onAppear{
                ViewModel.shared.getApi(complition: {response in
                    self.data = response
                    self.recentDataList = response.data?.recentLinks ?? []
                    self.topLinksList = response.data?.topLinks ?? []
                    
                })
            }
            
      }
    }
}


struct LocationGridView: View {
    var data: GridModel
    var value: String
    var body: some View {
        VStack(alignment: .leading){
            Spacer()
            Button(action: {}, label: {
                Image(data.image)
                    
            })
            .frame(width: 40, height: 40)
            .background(data.color.opacity(0.2))
            .clipShape(Circle())
            .padding(.top, 10)
            Spacer()

            Text(value)
                .font(.system(size: 18))
                .padding(.top, 4)
                .bold()

            Text(data.title)
                .font(.system(size: 14))
                .foregroundStyle(.gray)
                .padding(.vertical,2)
            Spacer()

        }
        .frame(width: 120, height: 100, alignment: .leading)
        .padding()
        .background(.white)
        .cornerRadius(10)
    }
}

struct ListHeaderButtons:View {
    @Binding var btnIndex:Int
    let offWhiteColor = Color(red: 250 / 255, green: 249 / 255, blue: 246 / 255)
    var body: some View {
        HStack{
            Button(action: {
                btnIndex = 0
            }, label: {
                Text("Top Links")
                    .font(.system(size: 16))
                    .foregroundStyle(btnIndex == 0 ?  Color.white : Color.gray)
                    .padding(.horizontal)
                
            })
            .frame(width: 120, height: 40)
            .background(btnIndex == 0 ? Color.blue : offWhiteColor)
            .cornerRadius(20)
            Button(action: {
                btnIndex = 1
            }, label: {
                Text("Recent Links")
                    .font(.system(size: 16))
                
                    .foregroundStyle(btnIndex == 1 ?  Color.white : Color.gray)
                    .padding(.horizontal)
            })
            .frame(width: 140, height: 40)
            .background(btnIndex == 1 ? Color.blue : offWhiteColor)
            .cornerRadius(20)
            
            Spacer()
            Button(action: {}, label: {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
            })
            .frame(width: 40, height: 40)
            .overlay{
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.gray, lineWidth: 1)
            }
            
        }
        .padding(.horizontal)

    }
}


struct LinksList: View {
    

    var linkData : LinksData
    @State var showToast = false
    var body: some View {
        VStack{
            
            HStack{
                AsyncImage(url: URL(string: linkData.originalImage ?? "")){ phase in
                    switch phase {
                    case .failure:
                        Image(systemName: "photo")
                            .font(.largeTitle)
                    case .success(let image):
                        image
                            .resizable()
                            .frame(width: 50, height: 50)
                            //.frame(width: 50,height: 50)
                            .overlay{
                                RoundedRectangle(cornerRadius: 10).stroke(.gray.opacity(0.2))
                            }
                    default:ProgressView();
                    }
//                        .frame(width: 50, height: 50)
//                        .overlay{
//                            RoundedRectangle(cornerRadius: 10)
//                                .stroke(.gray.opacity(0.2), lineWidth: 2)
//                        }
                }
                
                VStack(alignment: .leading){
                    Text(linkData.title ?? "")
                        .lineLimit(1)
                    Text("22 Aug 2022")
                        .foregroundStyle(.gray)
                }
                .padding(10)
                Spacer()
                VStack(){
                    Text("\(linkData.totalClicks ?? 0)")
                    Text("Clicks")
                        .foregroundStyle(.gray)
                }
            }
            .padding(.horizontal)
            HStack{
                Text(linkData.webLink ?? "")
                    .font(.system(size: 14))
                Spacer()
                Button(action: {
                    let pasteboard = UIPasteboard.general
                    pasteboard.string = linkData.webLink
                    showToast = true
                                   DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                       showToast = false
                                   }
                }, label: {
                    Image("copy_icon")
                })
             
                
                   
            }
            .padding(10)
                .background(.blue.opacity(0.2))
                .overlay{
                    Rectangle()
                        .strokeBorder(.blue ,style: StrokeStyle(lineWidth: 1, dash: [5]))
                    
                }
            if showToast {
                           ToastView(message: "Copied to Clipboard")
                               .animation(.easeInOut)
                              
                             
                       }
           
            
        }

    }
}

//MARK: copied toast view
struct ToastView: View {
    let message: String
    
    var body: some View {
        Text(message)
            .frame(width: UIScreen.main.bounds.width - 50)
            .foregroundColor(.white)
            .padding()
            .background(Color.black)
            .cornerRadius(10)
            .transition(.move(edge: .bottom))
    }
}
#Preview {
    LinksTabView()
}
