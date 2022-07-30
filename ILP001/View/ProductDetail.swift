//
//  ProductDetail.swift
//  ILP001
//
//  Created by Matheus Cavalcanti de Arruda on 28/07/22.
//

import SwiftUI

struct ProductDetail: View {
    
    var product: Product?
    var completion: ((Product) -> Void)
    
    @State var name: String
    @State var amount: String
    @State var price: String
    
    init (product: Product? = nil, completion: @escaping ((Product) -> Void)) {
        self.product = product
        
        self.name = product?.name ?? ""
        self.amount = "\(product?.amount ?? 0)"
        self.price = "\(product?.price ?? 0)"
        self.completion = completion
    }
    
    var body: some View {
        VStack {
            Text(product == nil ? "Novo Produto" : "Editar Produto")
                .font(.system(size: 18, weight: .bold, design: .rounded))
            
            CustomTextField(placeholder: "Nome", textFieldType: .regular, input: $name)
            CustomTextField(placeholder: "Preço", textFieldType: .regular, input: $price)
                .keyboardType(.numberPad)
            CustomTextField(placeholder: "Quantidade", textFieldType: .regular, input: $amount)
                .keyboardType(.numberPad)
            
            Button {
                self.completion(Product(name: self.name, amount: Int(self.amount)!, price: Double(self.price)!))
            } label: {
                Text("Salvar")
            }
        }
    }
}

struct ProductDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProductDetail{ _ in}
        }
    }
}
