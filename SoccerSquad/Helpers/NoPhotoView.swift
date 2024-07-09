//
//  NoPhotoView.swift
//  Movieplanner
//
//  Created by Роман on 18.06.2024.
//

import SwiftUI

struct NoPhotoView: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 155)
                .foregroundStyle(.grayApp)
            Image(.noFoto)
                .resizable()
                .frame(width: 32, height:32)
            
        }
    }
}

#Preview {
    NoPhotoView()
}
