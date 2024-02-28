//
//  ContentView.swift
//  WhoopsUITest
//
//  Created by Agustin Russo on 27/02/2024.
//

import SwiftUI

let studies = [
    Study(name: "Study 1", description: "Study about X topic", image: "image1", logo: "figure.outdoor.cycle", type: .recommended),
    Study(name: "Study 2", description: "Study about Y topic", image: "image2", logo: "person.fill", type: .open),
  // ...
]

let description = "WHOOP Labs runs groundbreaking research studies to shape the future of WHOOP. You can now get involved right from your phone!"


struct ContentView: View {
    @State private var selectedStudy: Study?
    
    var body: some View {
      NavigationView {
          ScrollView {
              VStack(alignment: .leading, spacing: 10){
                  Text ("Research Studies")
                      .font(.title2)
                      .frame(alignment: .leading)
                      .bold()
                      .foregroundColor(.white)
                  Spacer()
                  Text (description)
                      .font(.body)
                      .frame(alignment: .leading)
                      .bold()
                      .foregroundColor(.white)
                  Spacer(minLength: 20)
                  Text("Recommended studies ------")
                      .font(.body)
                      .frame(alignment: .leading)
                      .bold()
                      .foregroundColor(.gray)
                  Text ("Because you...")
                      .font(.subheadline)
                      .frame(alignment: .leading)
                      .foregroundColor(.gray)
                  ForEach(studies.filter { $0.type == .recommended }) { study in
                      StudyRow(study: study)
                          .onTapGesture {
                              self.selectedStudy = study
                          }
                  }
                  Text("Open studies -------")
                      .font(.subheadline)
                      .frame(alignment: .leading)
                      .bold()
                      .foregroundColor(.gray)
                  ForEach(studies.filter { $0.type == .open }) { study in
                      StudyRow(study: study)
                          .onTapGesture {
                              self.selectedStudy = study
                          }
                  }
              }
          }
          .navigationBarTitleDisplayMode(.inline)
          .toolbar {
                      ToolbarItem(placement: .principal) {
                          HStack {
                              Spacer()
                              Text("DIGITAL WHOOP LABS")
                                  .font(.headline)
                                  .foregroundColor(.white)
                                  .bold()
                              Spacer()
                              Button(action: {
                                  // Settings
                              }) {
                                  Image(systemName: "gear")
                                      .foregroundColor(.white)
                              }
                          }
                      }
                  }
        .background (Color(.black))
      }
      .sheet(item: $selectedStudy) { study in
        StudyDetailView(study: study)
      }
    }
}

struct StudyRow: View {
    var study: Study
    
    var body: some View {
        ZStack (alignment: .leading){
            Image(study.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
            HStack (alignment: .center, spacing: 20){
                Image(systemName: study.logo)
                    .foregroundColor(.gray)
                VStack(alignment: .leading) {
                    Text(study.name)
                        .font(.headline)
                        .foregroundColor(.white)
                    Text(study.description)
                        .font(.caption)
                        .foregroundColor(.gray)
                    //Spacer()
                    Button(action: {
                        // Enroll in the study
                    }) {
                        HStack {
                            Text("Enroll")
                                .foregroundColor(.blue)
                            Image(systemName: "arrowshape.right.fill")
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
        }
    }
  }

struct Study: Identifiable {
    let id = UUID()
    var name: String
    var description: String
    var image: String
    var logo: String
    var type: StudyType
}

enum StudyType {
    case recommended
    case open
}

struct StudyDetailView: View {
  var study: Study
  
  var body: some View {
    VStack {
      Text(study.name)
        .font(.largeTitle)
      Text(study.description)
        .font(.body)
      // Mostrar información adicional sobre el estudio, como los requisitos de participación, la duración del estudio, etc.
      Button(action: {
        // Unirse al estudio
      }) {
        Text("Join study")
      }
    }
  }
}

/*
#Preview {
    ContentView()
}
*/
