//
//  ContentView.swift
//  SwiftUIBeta4
//
//  Created by Jennifer Diaz on 26-08-23.
//

import SwiftUI

struct Device{
    let title: String
    let imageName: String
}
let house = [
    Device(title: "Laptop", imageName: "laptopcomputer"),
    Device(title: "Mac mini", imageName: "macmini"),
    Device(title: "Mac Pro", imageName: "macpro.gen3"),
    Device(title: "Displays", imageName: "display.2"),
    Device(title: "Apple TV", imageName: "appletv"),
]
let work = [
    Device(title: "iPhone", imageName: "iphone"),
    Device(title: "iPad", imageName: "ipad"),
    Device(title: "Airpods", imageName: "airpods"),
    Device(title: "Apple Watch", imageName: "applewatch"),
]

struct ContentView: View {
    @State var deviceName: String = "Iphone 12"
    @State var isNetwokOn: Bool = true
    @State var date: Date = Date()
    @State var color: Color = .pink
    
    var body: some View {
        NavigationView{
            List{
                NavigationLink("navigationLink", destination: Text("Some informaticion"))
                NavigationLink("NavigationLikn2", destination: Button("Tapme!", action: {
                    print("Hello navitgationLink Button")
                }))
                Text("Option Menu 1")
                Text("Option Menu 2")
                Text("Option Menu 3")
                Text("Option Menu 4")
            }
            .navigationBarItems(trailing: Button("Done", action: {
                print("NavigationView Button")
            }))
            .navigationTitle("Menu")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarHidden(false)
        }
        List{
            Section(header:Text("home")){
                ForEach(house, id: \.title){
                    device in Label( device.title, systemImage: device.imageName)
                }}
            Section(header:Text("work")){
                ForEach(work, id: \.title){
                    device in Label( device.title, systemImage: device.imageName)
                }}
            
        }.listStyle(SidebarListStyle())
        
        Form {
            Section(header: Text("Settings")){
                TextField("Device Name", text: $deviceName)
                Toggle("Wi-fi", isOn: $isNetwokOn)
            }
            Section(header: Text("Account"),
                    footer:
                HStack{
                    Spacer()
                    Label("version 1.0", systemImage: "iphone")
                    Spacer()
                }
                
            ) {
                DatePicker("Date", selection: $date)
                ColorPicker("Color", selection: $color)
            }
        }
                    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
