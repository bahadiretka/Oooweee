//
//  LocationScrollView.swift
//  Oooweee
//
//  Created by Bahadır Etka Kılınç on 9.04.2023.
//
import SwiftUI
import SSSwiftUIGIFView
struct LocationScrollView: View {
    @EnvironmentObject var apiManager: ApiManager
    @State private var scrollWidth: CGFloat = .zero
    @State private var offset: CGFloat = .zero
    var body: some View {
        switch apiManager.locationFetchState{
        case .loading:
            SwiftUIGIFPlayerView(gifName: "morty-loading")
        case .success:
            if let location = apiManager.currentLocation{
                ScrollViewReader{ scrollView in
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack{
                            if location.info.prev != nil{
                                Image("scroll-left")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .padding()
                            }
                            ForEach(location.results.indices, id: \.self){ index in
                                HStack{
                                    Text(location.results[index].name)
                                        .font(.custom(Avenir.bold, fixedSize: 22))
                                        .foregroundColor(.black)
                                        .padding(.vertical,10)
                                        .padding(.horizontal,35)
                                        .background{
                                            if index == apiManager.selectedLocation{
                                                Color.genderless
                                            }else{
                                                Color.unknown
                                            }
                                        }
                                        .cornerRadius(.infinity)
                                        .overlay(RoundedRectangle(cornerRadius: .infinity).stroke(Color.black, lineWidth: 2))
                                        .onTapGesture {
                                            withAnimation {
                                                apiManager.selectedLocation = index
                                            }
                                        }
                                }
                                .padding()
                            }
                            if location.info.next != nil{
                                Image("scroll-right")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .padding()
                            }
                        }
                        .background(GeometryReader { proxy -> Color in
                            DispatchQueue.main.async {
                                self.scrollWidth = proxy.size.width - UIScreen.screenWidth
                                offset = -proxy.frame(in: .named("scroll")).origin.x
                                print(offset)
                            }
                            return Color.clear
                        })
                    }
                    .onChange(of: offset, perform: { newOffset in
                        if newOffset < -50{
                            if let prev = location.info.prev{
                                apiManager.fetchBaseLocation(url: prev)
                                apiManager.fetchCurrentLocationCharacters()
                            }
                        }
                        if newOffset > scrollWidth + 50{
                            if let next = location.info.next{
                                apiManager.fetchBaseLocation(url: next)
                                apiManager.fetchCurrentLocationCharacters()
                            }
                        }
                    })
                    .overlay{
                        if offset < -30 && location.info.prev != nil{
                            Gifs.loadingGifs.randomElement()!
                                .frame(width: 50)
                        }
                        if offset > scrollWidth + 30 && location.info.next != nil{
                            Gifs.loadingGifs.randomElement()!
                                .frame(width: 50)
                        }
                    }
                    .coordinateSpace(name: "scroll")
                    .onFirstAppear{
                        apiManager.selectedLocation = 0
                    }
                    .onChange(of: apiManager.selectedLocation) { newValue in
                        withAnimation {
                            scrollView.scrollTo(newValue, anchor: .center)
                        }
                        apiManager.fetchCurrentLocationCharacters()
                    }
                    .frame(height: 50)
                }
            }
        case .failure:
            SwiftUIGIFPlayerView(gifName: "rick-dance-3")
                .frame(width: 50,height: 50)
            Text("API BOMBED")
                .font(.custom(Avenir.bold, size: 22))
            Button {
                apiManager.fetchBaseLocation()
            } label: {
                Text("Try Again?")
                    .font(.custom(Avenir.regular, fixedSize: 22))
                    .padding(.vertical,10)
                    .padding(.horizontal,35)
                    .background(Color.unknown)
                    .cornerRadius(.infinity)
                    .overlay(RoundedRectangle(cornerRadius: .infinity).stroke(Color.white, lineWidth: 2))
            }
        case .empty:
            Text("There Is No Location")
                .font(.custom(Avenir.regular, size: 22))
        }
        

    }
}

struct LocationScrollView_Previews: PreviewProvider {
    static var previews: some View {
        LocationScrollView()
    }
}
