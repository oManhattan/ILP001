//
//  TabView.swift
//  ILP001
//
//  Created by Matheus Cavalcanti de Arruda on 27/07/22.
//

import SwiftUI



struct MainTabView: View {
    @State private var selectedTab = 2
    
    var body: some View {
        TabView(selection: $selectedTab) {
            AccountView()
                .tabItem { Label { Text("Perfil") } icon: { Image(systemName: "person.fill") }}
                .tag(1)
            
            SellView()
                .tabItem { Label { Text("Vender") } icon: { Image(systemName: "dollarsign.circle.fill") }}
                .tag(2)
            
            CustomersView()
                .tabItem { Label { Text("Clientes") } icon: { Image(systemName: "person.3.sequence.fill") }}
                .tag(3)
            
            ProductsView()
                .tabItem { Label { Text("Produtos") } icon: { Image(systemName: "shippingbox.fill") }}
                .tag(4)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
