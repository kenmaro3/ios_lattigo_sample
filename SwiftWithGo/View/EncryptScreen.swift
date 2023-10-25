//
//  EncryptScreen.swift
//  SwiftWithGo
//
//  Created by Kentaro Mihara on 2023/10/24.
//

import SwiftUI
import Simple

struct EncryptScreen: View {
    @Binding var pk_ser: String
    @Binding var ctxt_ser: String
    @Binding var type: String
    
    @State var isLoading: Bool = false
    
    var body: some View {
        if isLoading {
            ProgressView("Processing...")
        }else{
            
            VStack{
                VStack{
                    Text("Ciphertext")
                        .padding(10)
                    Text(ctxt_ser)
                        .padding(10)
                }
                
                
                Button(action: {
                    // Action to perform when the button is tapped
                    do{
                        var res = Simple.SimpleEncryptEncode(pk_ser)
                        ctxt_ser = res
                    }catch{
                        
                    }
                }){
                    Text("Encrypt [1,2,3]")
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
                    type = "decryption"
                }){
                    Text("Go to Decryption")
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
}

//#Preview {
//    Home()
//}
