//
//  CharacterRowView.swift
//  Oooweee
//
//  Created by Bahadır Etka Kılınç on 7.04.2023.
//
import SwiftUI
import SSSwiftUIGIFView
struct CharacterRowView: View {
    var character: OwCharacter
    var isOdd: Bool
    var body: some View {
        HStack{
            if isOdd{
                leftPart()
            }else{
                rightPart()
            }
            Spacer()
            if isOdd{
                rightPart()
            }else{
                leftPart()
            }
        }
        .padding(.all, 20)
        .frame(width: UIScreen.screenWidth - 40, height: 150)
        .background(Color(Constants.colorBase + character.gender))
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 2))
        .cornerRadius(10)
    }
    @ViewBuilder
    private func leftPart() -> some View{
        AsyncImage(url: URL(string: character.image)){ image in
            image
                .resizable()
                .frame(width: 100, height: 100)
                .aspectRatio(contentMode: .fill)
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.white, lineWidth: 2))
                .shadow(radius: 10)
        }placeholder: {
            Gifs.loadingGifs.randomElement()
                .frame(width: 100, height: 100)
        }
    }
    @ViewBuilder
    private func rightPart() -> some View{
        VStack(alignment: isOdd ? .trailing : .leading){
            Text(character.name)
                .font(.custom(Avenir.bold, size: 22))
                .foregroundColor(.black)
                .lineLimit(1)
            HStack{
                Text("Status: \(character.status)")
                    .font(.custom(Avenir.regular, size: 22))
                    .foregroundColor(.black)
                Image(Constants.statusImageBase + character.status)
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            
            Text("Birth: \(Date.dateForRow(input: character.created))")
                .font(.custom(Avenir.regular, size: 22))
                .foregroundColor(.black)
        }
        .overlay{
            Image(Constants.genderImageBase + character.gender)
                .resizable()
                .frame(width: 100, height: 100)
                .opacity(0.3)
        }
    }
}
struct CharacterRowView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterRowView(character: OwCharacter(), isOdd: true)
    }
}
