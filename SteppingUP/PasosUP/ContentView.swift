import SwiftUI
import CoreLocation
import CoreMotion

struct ContentView: View {
    @State private var startLocation: CLLocation?
    @State private var endLocation: CLLocation?
    @State private var steps = 120
    let pedometer = CMPedometer()
    
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
                .opacity(0.9)
            VStack {
                Text("\(steps)")
                    .font(.system(size: 200))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Text("Pasos")
                    .foregroundColor(.white)
                    .padding(.bottom,30)
                
                HStack{
                    Button(action: { // boton para iniciar el recorrido
                        self.startTracking() //llama a la funcion para empezar el recorrido
                    }) {
                        Text("Iniciar")
                    }.frame(width: 110, height: 50)
                        .foregroundColor(.white)
                        .background(Color.cyan)
                        .clipShape(Capsule())

                    Button(action: {
                        self.stopTracking() // llama a la funcion para detener el recorrido
                    }) {
                        Text("Detener")
                    }
                    .frame(width: 110, height: 50)
                        .foregroundColor(.white)
                        .background(Color.red)
                        .clipShape(Capsule())
                }
                
            }
        }
    }
    
    func startTracking() {
        self.pedometer.startUpdates(from: Date()) { pedometerData, error in
            guard let data = pedometerData, error == nil else { // guard corrobora que los datos sean validos
                return
            }
            
            DispatchQueue.main.async {
                self.steps = data.numberOfSteps.intValue // guarda los pasos en la variable
            }
        }
        
        let locationManager = CLLocationManager() // variable para acceder a la ubicación del usuario
        locationManager.requestWhenInUseAuthorization() //pide autorizacion para utilizar la ubicacion al usuario
        locationManager.startUpdatingLocation()//inicia el seguimiento de la ubicacion
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { // 5 seg después comienza a guardar la ubicacion
            if let location = locationManager.location {//en la variable location se guarda la ubicacion
                self.startLocation = location //se van guardando las ubicaciones en la variable
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { // despues de 15seg se almacena la ubicacion en endLocation
            if let location = locationManager.location {
                self.endLocation = location
                
                let distance = self.endLocation?.distance(from: self.startLocation ?? CLLocation(latitude: 0, longitude: 0)) // se calcula la distanca entre las 2 ubicaciones y lo ocnvierte en pasos
                self.steps = Int(distance ?? 0)
            }
        }
    }
    
    func stopTracking() { // detiene todo
        self.pedometer.stopUpdates()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
