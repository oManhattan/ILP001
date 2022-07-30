//
//  ProductsView.swift
//  ILP001
//
//  Created by Matheus Cavalcanti de Arruda on 28/07/22.
//

import SwiftUI

struct Product: Hashable {
    var name: String
    var amount: Int
    var price: Double
}

struct CustomText1: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
    }
}

struct ProductsView: View {
    
    @State var products: [Product] = [.init(name: "Banana", amount: 100, price: 200), .init(name: "Maçã", amount: 0, price: 4.50)]
    
    @State var showProductDetail = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(products, id: \.self) { product in
                        NavigationLink {
                            ProductDetail(product: product, completion: { p in
                                if let idx = self.products.firstIndex(of: product) {
                                    self.products[idx] = Product(name: p.name, amount: p.amount, price: p.price)
                                }
                            })
                        } label: {
                            ProductCell(product: product)
                        }
                    }
                    .onDelete(perform: deleteProduct)
                }.listStyle(.plain)
                
                NavigationLink {
                    ProductDetail { product in
                        self.products.append(product)
                    }
                } label: {
                    Text("Adicionar Produto")
                        .font(.system(size: 14, weight: .black, design: .rounded))
                        .frame(width: 250, height: 45, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color(uiColor: .init(named: "appOrange") ?? .clear))
                        .cornerRadius(20)
                        .padding(.init(top: 2, leading: 0, bottom: 2, trailing: 0))
                }
            }
            .navigationTitle("Produtos")
        }
    }
    
    func deleteProduct(indexSet: IndexSet) {
        self.products.remove(atOffsets: indexSet)
    }
}

struct ProductCell: View {
    
    var product: Product
    
    var body: some View {
        VStack {
            CustomText1(text: "\(product.name)")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(.black)
            CustomText1(text: "\(String(format: "R$ %.2f", product.price))".replacingOccurrences(of: ".", with: ","))
                .font(.system(size: 18))
                .foregroundColor(.black)
            HStack {
                Text("Quantidade")
                    .font(.system(size: 18))
                    .foregroundColor(.black)
                Text("\(product.amount)")
                    .font(.system(size: 18))
                    .foregroundColor(product.amount == 0 ? .red : .black)
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
            .padding(5)
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}
