//
//  ForgotPassView.swift
//  ILP001
//
//  Created by Matheus Cavalcanti de Arruda on 27/07/22.
//

import SwiftUI

struct ForgotPassView: View {
    @State var email: String = ""
    
    @State var showAlert = false
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Informe o e-mail para que seja enviado um e-mail com o processo de redefinição")
                .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: false)
            
            CustomTextField(placeholder: "E-mail", textFieldType: .regular, input: $email)
                .keyboardType(.emailAddress)
                .padding(.bottom, 10)
            
            Button {
                showAlert.toggle()
            } label: {
                Text("Enviar")
                    .font(.system(size: 14, weight: .black, design: .rounded))
                    .frame(width: 250, height: 45, alignment: .center)
                    .foregroundColor(.white)
                    .background(Color(uiColor: .init(named: "appOrange") ?? .clear))
                    .cornerRadius(20)
            }.alert("E-mail enviado", isPresented: $showAlert) {
                Button("Ok", role: .cancel) {}
            } message: {
                Text("Caso seu e-mail esteja cadastrado você receberá uma mensagem com o passo a passo para redefinir a senha.")
            }

            
            Spacer()
        }.navigationTitle("Esqueceu a senha")
    }
}

struct ForgotPassView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ForgotPassView()
        }
    }
}
