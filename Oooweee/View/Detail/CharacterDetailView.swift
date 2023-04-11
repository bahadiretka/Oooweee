//
//  CharacterDetailView.swift
//  Oooweee
//
//  Created by Bahadır Etka Kılınç on 8.04.2023.
//
import SwiftUI
struct CharacterDetailView: View {

    var character: OwCharacter
    @State private var isExpanded: Bool = false
    var body: some View {
        ScrollView(showsIndicators: false){
            AsyncImage(url: URL(string: character.image)){ image in
                image
                    .resizable()
                    .frame(width: 275, height: 275)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.white, lineWidth: 2))
                    .shadow(radius: 10)
                    .padding(.horizontal, 50)
                    .padding(.vertical, 20)
            }placeholder: {
                Gifs.loadingGifs.randomElement()
                    .frame(width: 275, height: 275)
            }
            VStack(alignment: .center){
                infoView(info: "Status", content: character.status)
                infoView(info: "Specy", content: character.species)
                infoView(info: "Gender", content: character.gender)
                infoView(info: "Origin", content: character.origin.name)
                infoView(info: "Location", content: character.location.name)
                episodeView()
                infoView(info: "Created at(in API)", content: Date.parseDate(character.created))
            }
        }
        .coordinateSpace(name: "scroll")
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text(character.name)
                    .font(.custom(Avenir.bold, size: 22))
            }
        })
    }
    @ViewBuilder
    private func episodeView() -> some View{
        CustomDisclosureGroup(animation: .easeIn, isExpanded: $isExpanded, actionOnClick: {isExpanded.toggle()}) {
            HStack{
                Text("\("Episodes")")
                    .font(.custom(Avenir.bold, fixedSize: 22))
                Spacer()
                Image(systemName: !isExpanded ? "chevron.down.circle.fill" : "chevron.up.circle.fill")
                    .font(.system(size: 22))
            }
            .padding(10)
            .background(Color(Constants.colorBase + character.gender))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 2))
            .cornerRadius(10)
            .padding(.horizontal, 20)
        } expandedView: {
            HStack{
                Text(parseEpisode(in:character.episode))
                    .font(.custom(Avenir.regular, fixedSize: 22))
            }
            .padding(10)
            .background(Color(Constants.colorBase + character.gender))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 2))
            .cornerRadius(10)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
        }
    }
    @ViewBuilder
    private func infoView(info: String, content: String) -> some View{
        HStack{
            Text("\(info)")
                .font(.custom(Avenir.bold, fixedSize: 22))
            Spacer()
            Text(content)
                .font(.custom(Avenir.regular, fixedSize: 22))
        }
        .padding(10)
        .background(Color(Constants.colorBase + character.gender))
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 2))
        .cornerRadius(10)
        .padding(.horizontal, 20)
    }
}
struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(character: OwCharacter())
    }
}
