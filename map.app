// ContentView.swift

import SwiftUI

struct ContentView: View {
    
    @State var inputText: String = ""
    
    @State var dispSearchKey: String = ""
    
    var body: some View {
        VStack {
            TextField("キーワード", text: $inputText, prompt: Text("キーワードを入力してください。"))
                .onSubmit {
                    
                    dispSearchKey = inputText
                }
                .padding()
                
            MapView(searchKey: dispSearchKey)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//map.App.swift

import SwiftUI

@main
struct mapApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

//mapView.swift

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    let searchKey: String
    //初期状態のマップの表示一回のみ
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    //Viewが更新されるたびにこのメソッドが呼ばれる。
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        print(searchKey)
        
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(searchKey, completionHandler: {(placemarks , error) in
            
            if let unwrapPlacemarks = placemarks ,
               let firstPlacemark = unwrapPlacemarks.first ,
               let location = firstPlacemark.location {
                
                let targetCoordinate = location.coordinate
                
                print(targetCoordinate)
                
                let pin = MKPointAnnotation()
                
                pin.coordinate = targetCoordinate
                
                pin.title = searchKey
                
                uiView.addAnnotation(pin)
                
                uiView.region = MKCoordinateRegion (
                    center: targetCoordinate,
                    latitudinalMeters: 500.0,
                    longitudinalMeters: 500.0)
            }
        })
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(searchKey: "京都タワー")
    }
}

