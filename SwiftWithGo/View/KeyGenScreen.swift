//
//  KeyGenScreen.swift
//  SwiftWithGo
//
//  Created by Kentaro Mihara on 2023/10/24.
//

import SwiftUI
import Simple

struct KeyGenScreen: View {
    @Binding var pk_ser: String
    @Binding var sk_ser: String
    @Binding var type: String
    
    @State var isLoading: Bool = false
    
    var body: some View {
        if isLoading {
            ProgressView("Processing...")
        }else{
            VStack{
                Text("Public Key")
                    .padding(10)
                Text(pk_ser)
                    .padding(10)
            }
            VStack{
                Text("Secret Key")
                    .padding(10)
                Text(sk_ser)
                    .padding(10)
            }
            
            Button(action: {
                // Action to perform when the button is tapped
                isLoading = true
                do{
                    var res = Simple.SimpleKeyGen()
                    var res_public = Simple.SimpleKeyPairs_to_public_encode(res)
                    var res_secret = Simple.SimpleKeyPairs_to_secret_encode(res)
                    pk_ser = res_public
                    sk_ser = res_secret
                    isLoading = false
                }catch{
                    
                }
            }){
                Text("Keygen")
                    .fontWeight(.semibold)
                    .contentTransition(.identity)
                    .foregroundColor(.white)
                    .padding(.vertical, 15)
                    .padding(.horizontal, 40)
                    .background{
                        Capsule()
                            .fill(.black)
                    }
            }
            .frame(maxWidth: .infinity)
            .padding(.bottom, 10)
            .padding(.top, 25)
            
            
            Button(action: {
                // Action to perform when the button is tapped
                type = "encryption"
            }){
                Text("Go to Encryption")
                    .fontWeight(.semibold)
                    .contentTransition(.identity)
                    .foregroundColor(.white)
                    .padding(.vertical, 15)
                    .padding(.horizontal, 40)
                    .background{
                        Capsule()
                            .fill(.black)
                    }
            }
            .frame(maxWidth: .infinity)
            .padding(.bottom, 10)
            .padding(.top, 25)
            
        }
    }
}

//#Preview {
//    KeyGenScreen()
//}
