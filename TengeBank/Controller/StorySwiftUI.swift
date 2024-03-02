//
//  StorySwiftUI.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 01/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct Home: View {
    var body: some View {
        TabView {
            ForEach(data) { story in
                GeometryReader { g in
                    ZStack {
                        LinearGradient(gradient: .init(colors: [Color("top"), story.color]), startPoint: .top, endPoint: .bottomTrailing)
                            .cornerRadius(10)
                        
                        Image(story.story)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding(.horizontal)
                            .rotation3DEffect(.degrees(getAngle(xOffset: g.frame(in: .global).minX)), axis: (x: 0, y: 1, z: 0))
                        
                        VStack(alignment: .leading, spacing: 12) {
                            // Other content
                        }
                        .padding(.all)
                    }
                    .frame(width: g.frame(in: .global).width, height: g.frame(in: .global).height)
                }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

func getAngle(xOffset: CGFloat) -> Double {
    let tempAngle = xOffset / (UIScreen.main.bounds.width / 2)
    let rotationDegree = 10
    let degrees = tempAngle * CGFloat(rotationDegree)
    return Double(degrees)
}



struct Story: Identifiable {
    var id = UUID().uuidString
    var story: String
    var color: Color
}

var data = [
    Story(story: "story1",  color: .red),
    Story(story: "story2",  color: .red),
    Story(story: "story3",  color: .red),
    Story(story: "story4",  color: .red),
    Story(story: "story5",  color: .red),
    Story(story: "story6",  color: .red),
    Story(story: "story7",  color: .red),
    Story(story: "story8",  color: .red)
]



//struct StoryBundle:Identifiable,Hashable {
//    var id = UUID().uuidString
//    var profileName:String
//    var profilImage:String
//    var isSeen:Bool = false
//    var stories:[Story]
//}
//
//struct Story:Identifiable ,Hashable{
//    var id = UUID().uuidString
//    var imageURL:String
//}
//class StoryViewModel:ObservableObject {
//    
//    //list of Stories
//    
//    @Published var stories:[StoryBundle]  = [
//        
//        StoryBundle(profileName: "Diyorbek", profilImage: "Diyorbek", stories: [
//            Story(imageURL: "story1"),
//            Story(imageURL: "story2"),
//            Story(imageURL: "story3")
//        ]),
//        
//        StoryBundle(profileName: "Azizxon", profilImage: "Azizxon", stories: [
//            Story(imageURL: "story4"),
//            Story(imageURL: "story5")
//        ])
//    ]
//    //Properties
//    @Published var showStory:Bool = false
//    //Will be unique Story bundle id...
//    @Published var currentStory:String = ""
//}
//
//
//struct StoryView: View {
//    
//    @EnvironmentObject var storyData:StoryViewModel
//    
//    var body: some View {
//        if storyData.showStory {
//            TabView(selection:$storyData.currentStory) {
//                //stories..
//                ForEach($storyData.stories){$bundle in
//                    StoryCardView(bundle: $bundle)
//                }
//            }
//            .tabViewStyle(.page(indexDisplayMode: .never))
//            .frame(maxWidth: .infinity,maxHeight: .infinity)
//            .background(.black)
//            
//            
//            //Transition from bottom ...
//            .transition(.move(edge: .bottom))
//        }
//    }
//}
//
//struct StoryCardView:View {
//    
//    @Binding var bundle:StoryBundle
//    
//    @EnvironmentObject var storyData:StoryViewModel
//    
//    //Time and changing stories based on timer..
//    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
//    
//    //progress
//    @State var timerProgress:CGFloat = 0
//    
//    var body: some View {
//        // For 3D rotation..
//        
//        GeometryReader{proxy in
//            
//            ZStack {
//                // getting current index..
//                
//                //and updating data..
//                let index = max(Int(timerProgress),bundle.stories.count - 1)
//                
//                
//                    Image(bundle.stories[index].imageURL)
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//            }
//            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .center)
//            .overlay(
//                HStack {
//                    Rectangle()
//                        .fill(.black.opacity(0.01))
//                        .onTapGesture {
//                            if (timerProgress - 1) < 0 {
//                                updateStory(forward: false)
//                            } else {
//                                timerProgress = CGFloat(Int(timerProgress - 1))
//                            }
//                        }
//                    
//                    
//                    Rectangle()
//                        .fill(.black.opacity(0.01))
//                        .onTapGesture {
//                            // checking and  updating to next ..
//                            if (timerProgress + 1) > CGFloat(bundle.stories.count){
//                                //uptadate to next bundle...
//                                updateStory()
//                            } else {
//                                //update to next story
//                                timerProgress = CGFloat(Int(timerProgress + 1))
//                            }
//                        }
//                }
//            )
//            //close button
//            .overlay(
//                
//                // top profile
//                
//                HStack(spacing:13){
//                    
//                    Image(bundle.profilImage)
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 50,height: 50)
//                        .clipShape(Circle())
//                    
//                    Text(bundle.profileName)
//                        .fontWeight(.bold)
//                        .foregroundColor(.white)
//                    
//                    
//                    Spacer()
//                    
//                    Button(action: {
//                        withAnimation {
//                            storyData.showStory = false
//                        }
//                    }, label: {
//                       Image(systemName: "xmark")
//                            .font(.title2)
//                            .foregroundColor(.white)
//                    })
//                }
//                .padding()
//                ,alignment: .topTrailing
//            )
//            
//            // top timer capsule ...
//            .overlay(
//                HStack(spacing:5){
//                    ForEach(bundle.stories.indices){index  in
//                        GeometryReader{ story in
//                            
//                            let width = proxy.size.width
//                            
//                            // getting progress  by eliminating current index with progress..
//                            // so that remaining all will be at 0 when previous is loading..
//                            
//                            //setting max to 1..
//                            // min to 0..
//                            // For perfec timer..
//                            let progress = timerProgress - CGFloat(index)
//                            let perfectProgress = min(max(progress,0), 1)
//                            
//                            Capsule()
//                                .fill(.gray.opacity(0.5))
//                                .overlay(
//                                    Capsule()
//                                        .fill(.white)
//                                        .frame(width: width * perfectProgress)
//                                    ,alignment: .leading
//                                )
//                        }
//                    }
//                }
//                    .frame(height: 1.4)
//                    .padding(.horizontal)
//                    ,alignment: .top
//            )
//            
//            //rotation
//            .rotation3DEffect(
//                getAngle(proxy: proxy),
//                axis: (x: 0, y: 1, z: 0),
//                anchor: proxy.frame(in: .global).minX  > 0 ? .leading : .trailing,
//                perspective: 2.5
//            )
//        }
//        
//        .onAppear(perform: {
//            timerProgress = 0
//        })
//        .onReceive(timer, perform: { _ in
//            // updating seen status on realtime...
//            if storyData.currentStory == bundle.id{
//                if !bundle.isSeen{
//                    bundle.isSeen = true
//                }
//                
//                // updating timer...
//                if timerProgress < CGFloat(bundle.stories.count) {
//                    timerProgress += 0.03
//                } else {
//                    updateStory()
//                }
//            }
//        })
//    }
//    // updating on end
//    func updateStory(forward:Bool = true) {
//        let index = min(Int(timerProgress),bundle.stories.count - 1)
//        
//        let story = bundle.stories[index]
//        
//        if !forward {
//            
//            // if its not first then moving backward..
//            // else set timer to 0..
//            if let first = storyData.stories.first,first.id != bundle.id {
//                //getting index ...
//                let bundleIndex = storyData.stories.firstIndex { currentBundle in
//                    return bundle.id == currentBundle.id
//                } ?? 0
//                
//                withAnimation {
//                    storyData.currentStory = storyData.stories[bundleIndex - 1].id
//                }
//            } else {
//                timerProgress = 0
//            }
//            return
//        }
//        
//        // checking it its last..
//        if let last = bundle.stories.last,last.id  ==  story.id {
//            // if there is another story then moving to that ..
//            // else closing view
//            if  let lastBundle  = storyData.stories.last,lastBundle.id == bundle.id {
//                // closing
//                withAnimation{
//                    storyData.showStory = false
//                }
//                
//            }
//            else  {
//                //updating to next one..
//                let bundleIndex = storyData.stories.firstIndex {currentBundle in
//                    return bundle.id == currentBundle.id
//                } ?? 0
//                
//                withAnimation{
//                    storyData.currentStory == storyData.stories[bundleIndex + 1].id
//                }
//            }
//        }
//    }
//    
//    func getAngle(proxy:GeometryProxy)-> Angle {
//        let progres = proxy.frame(in: .global).minX / proxy.size.width
//        
//        let rotationAngle:CGFloat = 45
//        
//        let degress = rotationAngle * progres
//        
//        return Angle(degrees: Double(degress))
//    }
//}
//struct Home: View {
//    
//    @StateObject var storyData = StoryViewModel()
//    
//    var body: some View {
//        NavigationView{
//            
//            ScrollView(.vertical,showsIndicators:false) {
//                
//                ScrollView(.horizontal,showsIndicators:false) {
//                    
//                    //showing user sotories
//                    
//                    HStack(spacing:12) {
//                        Button {
//                            
//                        } label: {
//                            Image("logo")
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .frame(width: 50,height: 50)
//                                .clipShape(Circle())
//                                .overlay(
//                                    Image(systemName: "plus")
//                                        .padding(7)
//                                        .background(.blue,in: Circle())
//                                        .foregroundColor(.white)
//                                        .padding(2)
//                                        .background(.black,in:Circle())
//                                        .offset(x:10,y:10)
//                                    
//                                    ,alignment: .bottomTrailing
//                                )
//                            
//                            
//                        }
//                        .padding(.trailing,10)
//                        // stories ...
//                        
//                        ForEach($storyData.stories) {$bundle in
//                            //profileView
//                            /// in iOS 15 we can directly pass Bindings from forEach...
//                          ProfileView(bundle: $bundle)
//                                .environmentObject(storyData)
//                        }
//                    }
//                    .padding()
//                    .padding(.top,10)
//                }
//            }
//            .navigationTitle("Instagram")
//        }
//        .overlay(
//            
//            StoryView()
//                .environmentObject(storyData)
//        )
//    }
//}
//
//struct Home_Previews:PreviewProvider {
//    static var previews: some View{
//        Home()
//    }
//}
//
//
//struct ProfileView:View {
//    
//    @Binding var bundle:StoryBundle
//    
//    @Environment(\.colorScheme) var scheme
//    
//    @EnvironmentObject var storyData:StoryViewModel
//    
//    var body: some View {
//        Image(bundle.profilImage)
//            .resizable()
//            .aspectRatio(contentMode: .fill)
//            .frame(width: 50,height: 50)
//            .clipShape(Circle())
//        
//        // progress ring showing only is not seem..
//            .padding(2)
//            .background(scheme == .dark ? .black:.white, in:Circle())
//            .padding(2)
//            .background(
//                
//                LinearGradient(colors: [
//                    .red,
//                    .orange,
//                    .red,
//                    .orange
//                ],
//                startPoint: .top,
//                endPoint: .bottom)
//                .clipShape(Circle())
//                .opacity(bundle.isSeen ? 0 : 1)
//            )
//            .onTapGesture {
//                bundle.isSeen = true
//                
//                
//                // saving  current bundle and toggling story...
//                storyData.currentStory = bundle.id
//                storyData.showStory = true
//            }
//    }
//}
