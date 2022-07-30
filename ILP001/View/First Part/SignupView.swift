//
//  CadastroView.swift
//  ILP001
//
//  Created by Matheus Cavalcanti de Arruda on 27/07/22.
//

import SwiftUI

struct SignupView: View {
    
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var confPassword: String = ""
    
    @State private var wrongPassword = false
    
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6).ignoresSafeArea()
            VStack {
                Form {
                    Section {
                        TextField("Nome completo", text: $name)
                    }
                    
                    Section {
                        TextField("E-mail", text: $email)
                            .keyboardType(.emailAddress)
                        SecureField("Senha", text: $password)
                        SecureField("Confirmar senha", text: $confPassword)
                    }
                }
                
                Button {
                    
                    if password != confPassword {
                        wrongPassword.toggle()
                    }
                    
                } label: {
                    Text("Criar cadastro")
                        .font(.system(size: 14, weight: .black, design: .rounded))
                        .frame(width: 300, height: 45, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color(uiColor: .init(named: "appOrange") ?? .clear))
                        .cornerRadius(20)
                        .padding(.bottom, 10)
                }
                .alert("Senhas não coincidem", isPresented: $wrongPassword) {
                    Button("OK", role: .cancel) {}
                }
            }
        }
        .navigationTitle("Cadastro")
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SignupView()
        }
    }
}
