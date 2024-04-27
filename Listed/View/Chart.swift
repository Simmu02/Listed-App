import SwiftUI
import Charts

struct Model{
    var x:Int;
    var y:Double;
}

struct AreaChart:View{
    var data:[Model] = [
        Model(x: 2000, y: 6.8),
        Model(x: 2010, y: 8.2),
        Model(x: 2015, y: 12.9),
        Model(x: 2022, y: 15.2)
    ]
    var body: some View{
        ZStack{
            Chart{
                
                ForEach(data.indices,id: \.self){i in
                    AreaMark(x: .value("X", data[i].x), y: .value("Y", data[i].y))
                }
                    
                

            }        .chartXScale(domain: 1998...2024)
                .padding(.vertical,28)
                .padding(.horizontal,18)
                .frame(height:250)
        }
        .background(Color.white)
        .cornerRadius(20)
        .padding(.horizontal,16)
        .padding(.vertical,20)
       
    }
}
