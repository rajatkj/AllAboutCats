//
//  RatingView.swift
//  PhotosApp
//
//  Created by Rajat Jangra on 17/10/23.
//

import SwiftUI

struct RatingView: View {
    var title: String = "Label"
    var value: Int? = 3
    var total: Int = 5
    
    var body: some View {
        
        ProgressView(title, value: Double(value ?? 0), total: Double(total))
            .progressViewStyle(RoundedRectProgressViewStyle(activeColor: .cyan, passiveColor: .black.opacity(0.15)))
            .frame(height: 56)
            .padding(.horizontal)
            .padding(.vertical, 8.0)
        
    }
}

#Preview {
    RatingView()
}

struct RoundedRectProgressViewStyle: ProgressViewStyle {
    
    var activeColor: Color
    var passiveColor: Color
    
    init(activeColor: Color = .yellow, passiveColor: Color = .gray) {
        self.activeColor = activeColor
        self.passiveColor = passiveColor
    }
    
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            ZStack(alignment: .leading) {
                
                GeometryReader(content: { geometry in
                    RoundedRectangle(cornerRadius: geometry.size.height / 2)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .foregroundColor(passiveColor)
                    
                    RoundedRectangle(cornerRadius: geometry.size.height / 2)
                        .frame(width: CGFloat(configuration.fractionCompleted ?? 0) * geometry.size.width, height: geometry.size.height)
                        .foregroundColor(activeColor)
                    
                })
            }
        }
        
    }
}
