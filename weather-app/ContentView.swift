//
//  ContentView.swift
//  weather-app
//
//  Created by Andrews Mensah on 08/07/2022.
//

import SwiftUI



struct ContentView: View {
    
    //by default it is day
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: $isNight)
            
            VStack{
                
                CityNameView(cityName: "Sekondi-Takoradi")
                
                VStack (spacing:10){
                    Image(systemName: isNight ? "moon.stars.fill" : "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                        .padding()
                    
                    Text("30°")
                        .font(.system(size: 70, weight: .medium, design: .default))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 60)
                
                HStack(spacing: 40){
            
                    WeatherDaysView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 32)
                    
                    WeatherDaysView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 35)
                    
                    WeatherDaysView(dayOfWeek: "THU", imageName: "cloud.sleet.fill", temperature: 31)
                    
                    WeatherDaysView(dayOfWeek: "FRI", imageName: "cloud.sun.rain.fill", temperature: 32)
                    
                    WeatherDaysView(dayOfWeek: "SAT", imageName: "wind", temperature: 23)
                    
//                    VStack(spacing:8) {
//                        Text("Wed")
//                            .padding(.top)
//                            .font(.system(size: 20, weight: .medium, design: .default))
//                            .foregroundColor(.white)
//                        Image(systemName: "cloud.sun.fill")
//                            .renderingMode(.original)
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 40, height: 40)
//                        Text("32°")
//                            .font(.system(size: 28, weight: .medium, design: .default))
//                            .foregroundColor(.white)
//                    }
//
//                    VStack(spacing:8) {
//                        Text("Thurs")
//                            .padding(.top)
//                            .font(.system(size: 20, weight: .medium, design: .default))
//                            .foregroundColor(.white)
//                        Image(systemName: "cloud.sun.fill")
//                            .renderingMode(.original)
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 40, height: 40)
//                        Text("32°")
//                            .font(.system(size: 28, weight: .medium, design: .default))
//                            .foregroundColor(.white)
//                    }
//                    VStack(spacing:8) {
//                        Text("Wed")
//                            .padding(.top)
//                            .font(.system(size: 20, weight: .medium, design: .default))
//                            .foregroundColor(.white)
//                        Image(systemName: "cloud.sun.fill")
//                            .renderingMode(.original)
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 40, height: 40)
//                        Text("32°")
//                            .font(.system(size: 28, weight: .medium, design: .default))
//                            .foregroundColor(.white)
//                    }
//                    VStack(spacing:8) {
//                        Text("Fri")
//                            .padding(.top)
//                            .font(.system(size: 20, weight: .medium, design: .default))
//                            .foregroundColor(.white)
//                        Image(systemName: "cloud.sun.fill")
//                            .renderingMode(.original)
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 40, height: 40)
//                        Text("32°")
//                            .font(.system(size: 28, weight: .medium, design: .default))
//                            .foregroundColor(.white)
//                    }
                    
                    
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                    
                } label: {
                    Text("Change Day Time")
                        .font(.system(size: 20, weight: .medium, design: .default))
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .cornerRadius(10.0)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDaysView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing:8) {
            Text(dayOfWeek)
                .padding(.top)
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    
    @Binding var isNight: Bool
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors:[isNight ? .black : .blue, isNight ? .gray : Color("lightcolour")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityNameView: View{
    
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}
