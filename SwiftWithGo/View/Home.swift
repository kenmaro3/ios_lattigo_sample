//
//  KeyGen.swift
//  SwiftWithGo
//
//  Created by Kentaro Mihara on 2023/10/24.
//

import SwiftUI
import Simple

struct Home: View {
    @State var pk_ser: String = ""
    @State var sk_ser: String = ""
    
    @State var type: String = "keygen"
    
    // Cannot store keys in appstorage since they are too big...
//    @AppStorage("pk_ser") var pk_ser_storage = ""
//    @AppStorage("sk_ser") var sk_ser_storage = ""
    
    @State var ctxt_ser: String = ""
    @State var dec_str: String = ""

    
    
    @State var isLoading = false
    
    var body: some View {
        if(type == "keygen"){
            KeyGenScreen(pk_ser: $pk_ser, sk_ser: $sk_ser, type: $type)
        }else if(type == "encryption"){
            EncryptScreen(pk_ser: $pk_ser, ctxt_ser: $ctxt_ser, type: $type)
        }else if(type == "decryption"){
            DecryptScreen(sk_ser: $sk_ser, ctxt_ser: $ctxt_ser, type: $type, dec_str: $dec_str)
        }else{
            Text("No Screen")
        }
    }
}

//#Preview {
//    Home()
//}
