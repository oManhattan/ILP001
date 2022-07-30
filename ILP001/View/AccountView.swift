//
//  AccountView.swift
//  ILP001
//
//  Created by Matheus Cavalcanti de Arruda on 27/07/22.
//

import SwiftUI

struct AccountView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Account View")
            Button {
                dismiss()
            } label: {
                Text("LOGOUT")
                    .font(.system(size: 13, weight: .black, design: .rounded))
                    .frame(width: 200, height: 40, alignment: .center)
                    .foregroundColor(.white)
                    .background(Color(uiColor: .systemOrange))
                    .cornerRadius(20)
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
