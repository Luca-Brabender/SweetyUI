//
//  SimpleLoginButtonView.swift
//  SweetyUI
//
//  Created by Luca Brabender on 27.02.24.
//

import SwiftUI

struct SimpleLoginButtonView: View {
    @State var showSheet: Bool
    var body: some View {
        Button(action: {
            showSheet.toggle()
        }){
            VStack{
                HStack{
                    
                    Text("Log-in")
                    
                }
            }
        }.font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 100, height: 50)
            .background(Color.mint)
            .cornerRadius(10.0)
    }
}

struct SimpleLoginButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleLoginButtonView(showSheet: false)
    }
}
