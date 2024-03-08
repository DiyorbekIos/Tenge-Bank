//
//  NumberPad.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 05/03/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var status = false
    
    var body: some View {
        NavigationView{
            VStack{
                
                    Verification()
                
            }.onAppear {
                NotificationCenter.default.addObserver(forName:NSNotification.Name("Success"), object:nil, queue: .main) { (_) in
                    self.status = true
                }
                
            }
        }.preferredColorScheme(self.status ? .light:.dark)
            .animation(.spring())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct Verification:View {
    
    @State var code:[String] = []
    
    var body: some View {
        
        VStack{
            Spacer()
            Text("Hozirgi PIN-kodni kiriting")
                .font(.title)
                .foregroundColor(.black)
            
            HStack(spacing:20){
                ForEach(code,id:\.self){i in
                    Text(i)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                }
            } .padding(.vertical)
            Spacer()
            NumberPad(codes: $code)
        }
    }
}


struct NumberPad:View {
    
    @Binding var codes:[String]
    
    var body: some View {
        VStack(alignment:.leading,spacing:20){
            ForEach(datas) {i in
                HStack(spacing:self.getSpacing()){
                    ForEach(i.row){j in
                        Button(action: {
                            if j.value == "delete.left.fill"{
                                self.codes.removeLast()
                            } else {
                                self.codes.append(j.value)
                                
                                if self.codes.count == 5 {
                                    print(self.getCode())
                                    NotificationCenter.default.post(name:NSNotification.Name("Succes"),object:nil)
                                    
                                    self.codes.removeAll()
                                }
                            }
                        }) {
                            if j.value == "delete.left.fill" {
                                Image(systemName: j.value)
                                    .font(.body)
                                    .padding(.vertical)
                            } else {
                                Text(j.value)
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .padding(.vertical)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
            }
        } .foregroundColor(.white)
    }
    
    func getSpacing()->CGFloat {
        return UIScreen.main.bounds.width / 3
    }
    
    func getCode() -> String {
        var code = ""
        
        for i in self.codes {
            code += i
        }
        return code
    }
}

//datas

struct type:Identifiable{
    var id: Int
    var row:[row]
}

struct row: Identifiable{
    var id: Int
    var value:String
}

var datas = [
    type(id: 0, row: [row(id: 0, value: "1"),row(id: 1, value: "2"),row(id: 2, value: "3")]),
    type(id: 1, row: [row(id: 3, value: "4"),row(id: 4, value: "5"),row(id: 5, value: "6")]),
    type(id: 2, row: [row(id: 6, value: "7"),row(id: 7, value: "8"),row(id: 8, value: "9")]),
    type(id: 3, row: [row(id: 0, value: "delete.left.fill"),row(id: 1, value: "0")])
]


