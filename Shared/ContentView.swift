//
//  ContentView.swift
//  Shared
//
//  Created by Kirill Borichevskiy on 9.03.22.
//
//

import SwiftUI

struct ContentView: View {

    @State private var isNight = false

    var body: some View {
        ZStack {
            BackgroundView(topColor: !isNight ? .blue : .black, bottomColor: !isNight ?
                    Color("lightCyan") : .gray)
            VStack {
                CityTextView(cityName: "Minsk, Belarus")
                MainWeatherStatusView(imageName: "cloud.sun.fill", temperature: 76)
                        .padding(20)

                HStack(spacing: 20) {

                    WeatherDayView(dayOfWeek: "TUE",
                            imageName: "cloud.sun.fill",
                            temperature: 76)

                    WeatherDayView(dayOfWeek: "WED",
                            imageName: "sun.max.fill",
                            temperature: 88)

                    WeatherDayView(dayOfWeek: "THU",
                            imageName: "wind.snow",
                            temperature: 55)

                    WeatherDayView(dayOfWeek: "FRI",
                            imageName: "sunset.fill",
                            temperature: 60)

                    WeatherDayView(dayOfWeek: "SAT",
                            imageName: "snow",
                            temperature: 25)

                }
                        .padding(.bottom, 70)

                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {

    var dayOfWeek: String
    var imageName: String
    var temperature: Int

    var body: some View {
        VStack {
            Text(dayOfWeek)
                    .font(.system(
                            size: 16,
                            weight: .medium,
                            design: .default))
                    .foregroundColor(.white)
            Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
            Text("\(temperature)°")
                    .font(.system(size: 32, weight: .medium))
                    .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {

    var topColor: Color
    var bottomColor: Color

    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {

    var cityName: String

    var body: some View {
        Text(cityName)
                .font(.system(
                        size: 32,
                        weight: .medium,
                        design: .default))
                .foregroundColor(.white)
                .padding()
    }
}

struct MainWeatherStatusView: View {

    var imageName: String
    var temperature: Int

    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)

            Text("\(temperature)°")
                    .font(.system(size: 70, weight: .medium))
                    .foregroundColor(.white)
        }
                .padding(.bottom, 40)
    }
}
