//
//  LoginView.swift
//  ILP001
//
//  Created by Matheus Cavalcanti de Arruda on 27/07/22.
//

import SwiftUI

struct ImageLogo: View {
    var body: some View {
        Image("logo")
            .resizable()
            .scaledToFit()
            .padding(.init(top: 0, leading: 40, bottom: 0, trailing: 40))
    }
}

struct CustomTextField: View {
    
    enum TextFieldType {
        case regular
        case safe
    }
    
    let placeholder: String
    let textFieldType: TextFieldType
    
    @Binding var input: String
    
    var body: some View {
        
        switch textFieldType {
        case .regular:
            TextField(placeholder, text: $input)
                .padding(10)
                .background(Color(uiColor: .systemGray6))
                .cornerRadius(10)
                .padding(.init(top: 0, leading: 20, bottom: 2, trailing: 20))
        case .safe:
            SecureField(placeholder, text: $input)
                .padding(10)
                .background(Color(uiColor: .systemGray6))
                .cornerRadius(10)
                .padding(.init(top: 2, leading: 20, bottom: 2, trailing: 20))
        }
    }
}

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    @State var openUserArea = false
    
    var body: some View {
        NavigationView {
            VStack {
                ImageLogo()
                
                Spacer()
                
                CustomTextField(placeholder: "E-mail", textFieldType: .regular, input: $email)
                    .keyboardType(.emailAddress)
                    .submitLabel(.done)
                
                CustomTextField(placeholder: "Senha", textFieldType: .safe, input: $password)
                    .submitLabel(.done)
                
                Spacer()
                
                Button {
                    openUserArea.toggle()
                } label: {
                    Text("ENTRAR")
                        .font(.system(size: 14, weight: .black, design: .rounded))
                        .frame(width: 250, height: 45, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color(uiColor: .init(named: "appOrange") ?? .clear))
                        .cornerRadius(20)
                }.fullScreenCover(isPresented: $openUserArea, content: {MainTabView()})
                
                
                Spacer()
                
                NavigationLink {
                    SignupView()
                } label: {
                    Text("CADASTRE-SE")
                        .font(.system(size: 14, weight: .bold, design: .rounded))
                        .frame(width: 250, height: 45, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color(uiColor: .init(named: "appBlue") ?? .clear))
                        .cornerRadius(20)
                }
                
                NavigationLink {
                    ForgotPassView()
                } label: {
                    Text("ESQUECEU A SENHA")
                        .font(.system(size: 14, weight: .bold, design: .rounded))
                        .frame(width: 250, height: 45, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color(uiColor: .init(named: "appBlue") ?? .clear))
                        .cornerRadius(20)
                        .padding(.bottom, 25)
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
