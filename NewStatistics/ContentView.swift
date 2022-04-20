//
//  ContentView.swift
//  NewStatistics
//
//  Created by Sophie Strausberg on 4/18/22.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack {
                    VStack(alignment: .leading) {
                        //MAKE DYNAMIC
                        Text("Saturday, January 15").foregroundColor(.gray).bold().font(Font.footnote)
                        Text("Performance").bold().font(Font.largeTitle)
                    }
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.blue.opacity(0.5))
//                            .shadow(radius: 15)
     
                            .frame(width: 100, height: 50)
                            .foregroundColor(Color.blue.opacity(0.5))
                            .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.blue, lineWidth: 5)
                                    )
                           
                            
                        Text("4 day 🔥")
                    }
                }
                .padding(20)
                .padding(.bottom, 30)
                
                Text("Days you've practiced this week")
                HStack {
                    DayView(practiced: true, day: "M")
                    DayView(practiced: false, day: "T")
                    DayView(practiced: true, day: "W")
                    DayView(practiced: true, day: "Th")
                    DayView(practiced: false, day: "F")
                    DayView(practiced: true, day: "Sat")
                    DayView(practiced: true, day: "Sun")
                }
               
                
                HStack {
                    HalvedCircularBar(progress: 0.4)
                    Spacer()
                    
                    VStack {
                        HStack {
                            Text("4").bold()
                            Text("of")
                            Text("5").bold()
                        }
                        Text("days practiced this week")
                        Text("change your day goal")
                            .font(Font.footnote)
                            .foregroundColor(.blue)
                    }
                }
                .padding(.horizontal, 30)
                
//            Text("What you've explored")
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                        .shadow(radius: 5)
                    VStack(alignment: .center, spacing: 20) {
                        Text("Activities performed")
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Text("Phrase Completion")
                                Spacer()
                                Text("0").bold()
                            }
                            HStack {
                                Text("Scenario")
                                Spacer()
                                Text("0").bold()
                            }
                            HStack {
                                Text("Coming Soon")
                                Spacer()
                                Text("0").bold()
                            }
                        }
                        .padding()
                        .padding(.horizontal, 10)
                    }
                    .padding(.vertical, 30)
                    
                }
                .frame(width: 300)
                
               
//                .overlay(
//                    RoundedRectangle(cornerRadius: 20)
//                        .stroke(Color.blue, lineWidth: 4)
//                    )
                
//                Text("What you've explored")
//                RadarChart(data: [0.8, 0.4, 0.6], gridColor: .blue, dataColor: .orange)
//                    .frame(height: 200)
            }
            

            
        }
        
    }
}

struct DayView: View {
    var practiced: Bool
    var day: String
    
    init(practiced: Bool, day: String) {
        self.practiced = practiced
        self.day = day
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(practiced ? Color.orange : Color.gray)
                            .frame(width: 45, height: 45)
            Text(day).bold()
        }
    }
}

struct HalvedCircularBar: View {
    
    @State var progress: CGFloat = 0.0
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .trim(from: 0.0, to: 0.5)
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 12.0, dash: [8]))
                    .frame(width: 100, height: 100)
                    .rotationEffect(Angle(degrees: -180))
                Circle()
                    .trim(from: 0.0, to: progress/2)
                    .stroke(Color.blue, lineWidth: 12.0)
                    .frame(width: 100, height: 100)
                    .rotationEffect(Angle(degrees: -180))
                Text("\(Int(self.progress*100))%")
                    
            }
            .padding(.top, 50)
           
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
