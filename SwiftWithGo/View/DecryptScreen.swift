//
//  DecryptScreen.swift
//  SwiftWithGo
//
//  Created by Kentaro Mihara on 2023/10/24.
//

import SwiftUI
import Simple

struct DecryptScreen: View {
    @Binding var sk_ser: String
    @Binding var ctxt_ser: String
    @Binding var type: String
    @Binding var dec_str: String
    
    @State var isLoading: Bool = false
    
    var body: some View {
        if isLoading {
            ProgressView("Processing...")
        }else{
            VStack{
                Text("Decrypted string")
                    .padding(10)
                Text(dec_str)
                    .padding(10)
            }
            
            Button(action: {
                // Action to perform when the button is tapped
                do{
                    var tmp = Simple.SimpleDecodeDecrypt(ctxt_ser, sk_ser)
                    dec_str = tmp
                }catch{
                    
                }
            }){
                Text("Decrypt")
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
                type = "keygen"
            }){
                Text("Go back")
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
//    Home()
//}
