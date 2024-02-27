//
//  ContentView.swift
//  WhoopsUITest
//
//  Created by Agustin Russo on 27/02/2024.
//

import SwiftUI

let studies = [
  Study(name: "Estudio 1", description: "Este es un estudio sobre el tema X", image: "imagen1"),
  Study(name: "Estudio 2", description: "Este es un estudio sobre el tema Y", image: "imagen2"),
  // ...
]


struct ContentView: View {
    @State private var selectedStudy: Study?
    
    var body: some View {
      NavigationView {
        ScrollView {
          ForEach(studies) { study in
            StudyRow(study: study)
              .onTapGesture {
                self.selectedStudy = study
              }
          }
        }
        .navigationBarTitle("Investigation Studies")
      }
      .sheet(item: $selectedStudy) { study in
        StudyDetailView(study: study)
      }
    }
}

struct StudyRow: View {
    var study: Study
    
    var body: some View {
      HStack {
        Image(study.image)
        VStack(alignment: .leading) {
          Text(study.name)
            .font(.headline)
          Text(study.description)
            .font(.caption)
        }
        Spacer()
        Button(action: {
          // Enroll in the study
        }) {
          Text("Enroll")
        }
      }
    }
  }

struct Study: Identifiable {
  let id = UUID() // Use a unique identifier like a UUID
  var name: String
  var description: String
  var image: String
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
        Text("Unirse al estudio")
      }
    }
  }
}

#Preview {
    ContentView()
}
