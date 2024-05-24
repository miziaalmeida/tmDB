//
//  MovieDetailView.swift
//  TheMovie
//
//  Created by Jeiel Lima on 24/05/24.
//

import UIKit

class MovieDetailView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = TextLabel.createLabel(text: "")
        label.font = .systemFont(ofSize: LayoutConstants.labelSize)
        return label
    }()
    
    lazy var overviewLabel: UILabel = {
        let label = TextLabel.createLabel(text: "")
        label.font = .systemFont(ofSize: LayoutConstants.labelMinusSize)
        label.numberOfLines = LayoutConstants.zero
        return label
    }()
    
    private func setupView() {
        backgroundColor = ColorConstants.backColor
        addSubview(titleLabel)
        addSubview(overviewLabel)
    }
    
    func configure(with movie: Movie) {
        titleLabel.text = movie.title
        overviewLabel.text = movie.overview
    }
}
