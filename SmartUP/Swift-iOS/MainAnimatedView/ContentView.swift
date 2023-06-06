
//  Created by iOS Lab on 22/03/23.
//

import SwiftUI

struct CustomColor {
    static let mainBlue = Color("mainBlue")
    static let grayLetter = Color("gray_letter")
    
}
struct TextInputField: View{
    var title: String
    @Binding var text: String
    
    init(_ title:String, text: Binding<String>){
        self.title = title
        self._text = text
    }
    var body: some View{
        ZStack(alignment: .leading){
            Text(title)
                .foregroundColor(CustomColor.grayLetter)
                .offset(y: text.isEmpty ? 0 : -25)
                .scaleEffect(text.isEmpty ? 1 : 0.8)
            VStack {
                TextField("", text: $text)
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(CustomColor.grayLetter)
            }
            
        }
        .animation(.easeInOut(duration: 0.1), value: text)
    }
    
}

struct confirmRuta: View{
    @State var show = false

    var origenC: String
    var destinoC: String

    var  body: some View{
        if show == false{
            VStack(alignment: .leading,spacing: 70){
                Button(action: {
                    withAnimation {
                        self.show.toggle()
                        
                    }
                }){
                    HStack{
                        Image("back_arrow")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 17)
                        Spacer()
                    }
                    
                }
                Spacer()
                Spacer()
                Text("ROUTE")
                    .foregroundColor(CustomColor.mainBlue)
                    .font(.custom("Poppins-ExtraBold", size: 32))
                
                
                Text("FROM: \(origenC)")
                    .font(.custom("Poppins-SemiBold", size: 15))
                Spacer()

                Text("TO: \(destinoC)")
                    .font(.custom("Poppins-SemiBold", size: 15))
                Spacer()
                
                Button("Confirm"){
                    
                }
                    .foregroundColor(.white)
                    .font(.custom("Poppins-Bold",size: 15))
                    .frame(width: 326, height: 50)
                    .background(CustomColor.mainBlue)
                    .cornerRadius(10)
                
                                


            }.padding([.leading,.trailing],30)
        }else{
            Ruta()
        }
    }
}


struct Ruta: View{
    @State var show = false
    @State var show2 = false
    @State var show3 = false
    @State var origen = ""
    @State var destino = ""

    var body: some View{
        if show2 == false && show3 == false{
            ZStack{
                Color.white
                
                Image("smartup_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 800)
                    .scaleEffect(show ? 0.3 : 1)
                    .offset(y: show ? -200 : 0)
                    .animation(Animation.easeInOut(duration: 1), value: show)
                
                VStack(alignment: .leading){
                    Button(action: {
                        withAnimation {
                            self.show3.toggle()
                            
                        }
                    }){
                        HStack{
                            Image("back_arrow")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 17)
                        }
                    }
                    Spacer()
                    TextField("¿Dónde estas?", text: $origen)
                        .font(.custom("Poppins-SemiBold", size: 15))
                        .frame(width: 311, height: 50)
                        .background(.ultraThickMaterial)
                        .cornerRadius(25)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    TextField("¿A dónde vas?", text: $destino)             .font(.custom("Poppins-SemiBold", size: 15))
                        .frame(width: 311, height: 50)
                        .background(.ultraThickMaterial)
                        .cornerRadius(25)
                        .multilineTextAlignment(.center)
                        .padding()

                    Spacer()
                    Button("Next"){
                        withAnimation {
                            self.show2.toggle()
                            
                        }
                    }
                        .foregroundColor(.white)
                        .font(.custom("Poppins-Bold",size: 15))
                        .frame(width: 326, height: 50)
                        .background(CustomColor.mainBlue)
                        .cornerRadius(10)
                }
            }
            .onAppear {
                self.show = true
            
            }
        }else if (show2 == true){
            confirmRuta(origenC: origen, destinoC: destino)
        }else if(show3 == true){
            GuestAccount()
        }
        
    }
}


struct GuestAccount: View{
    @State var name = ""
    @State var mail = ""
    @State var show2 = false
    @State var show3 = false
    var body: some View{
        if show2 == false && show3 == false{
            VStack(alignment: .leading, spacing: 15){
                Button(action: {
                    withAnimation {
                        self.show2.toggle()
                        
                    }
                }){
                    HStack{
                        Image("back_arrow")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 17)
                    }
                }
                
                Spacer()
                Spacer()
                
                Text("GUEST")
                    .font(.custom("Poppins-ExtraBold", size: 32))
                    .foregroundColor(CustomColor.mainBlue)
                    .offset(y:-60)
                Text("ACCOUNT")
                    .font(.custom("Poppins-Bold", size: 15))
                    .foregroundColor(.black)
                    .offset(x: 25,y:-85)
                TextInputField("NAME", text: $name)
                    .font(.custom("Poppins-SemiBold", size: 17))
                    
                TextInputField("MAIL", text: $mail)
                    .font(.custom("Poppins-SemiBold", size: 17))
                Spacer()
                Button("Enter"){
                    withAnimation {
                        self.show3.toggle()
                        
                    }
                }
                    .foregroundColor(.white)
                    .font(.custom("Poppins-Bold",size: 15))
                    .frame(width: 326, height: 50)
                    .background(CustomColor.mainBlue)
                    .cornerRadius(10)
                Spacer()
                
            }.padding([.leading, .trailing], 50)
        }
        else if (show2 == true){
            QuickLogIn()
        }
        else if (show3 == true){
            Ruta()
        }
    }
}

struct QuickLogIn:View{
    @State var guestShow = false
    @State var show2 = false
    
    var body: some View{
        if guestShow == false{
            VStack(alignment: .leading, spacing: 30){
                Text("QUICK")
                    .font(.custom("Poppins-ExtraBold", size: 32))
                    .foregroundColor(CustomColor.mainBlue)
                Text("LOGIN")
                    .font(.custom("Poppins-Bold", size: 15))
                    .foregroundColor(.black)
                    .offset(x: 25,y:-45)
                Button(action: {}){
                    HStack(spacing:20){
                        Image("google_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30)
                        
                        Text("CONTINUE WITH GOOGLE")
                            .padding(.trailing,10)
                        
                    }
                }.font(.custom("Poppins-Regular", size: 15))
                    .foregroundColor(.gray)
                    .frame(width: 311, height: 50)
                    .background(.white)
                    .clipShape(Capsule())
                
                Button("CONTINUE AS GUEST"){
                    withAnimation {
                        self.guestShow.toggle()
                    }
                }
                .font(.custom("Poppins-Regular", size: 15))
                .foregroundColor(.gray)
                .frame(width: 311, height: 50)
                .background(.white)
                .clipShape(Capsule())
            }
        }
        else {
            GuestAccount()
        }
        
    }
}

    
struct ContentView: View {
    @State var show = false

    var body: some View {
        
        ZStack {
                Image("smartup_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .scaleEffect(show ? 8.0 : 1.0)
                if show == false{
                    
                    VStack{
                        Button("     "){
                            withAnimation {
                                self.show.toggle()
                            }
                        }.font(.system(size: 100))
                        .frame(width: 100, height: 100)
                        
                        Text("Click para empezar")
                            .foregroundColor(.gray)
                            .animation(.easeOut)

                    }
                    
                }
                else{
                    QuickLogIn()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
