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
        label.textColor = UIColor.black
        return label
    }()
    
    lazy var overviewLabel: UILabel = {
        let label = TextLabel.createLabel(text: "")
        label.font = .systemFont(ofSize: LayoutConstants.labelMinusSize)
        label.textColor = UIColor.black
        label.numberOfLines = LayoutConstants.zero
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = ColorConstants.backColor
        addSubview(titleLabel)
        addSubview(overviewLabel)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            overviewLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            overviewLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            overviewLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            overviewLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        ])
    }
    
    func configure(with movie: Movie) {
        titleLabel.text = movie.title
        overviewLabel.text = movie.overview
    }
}
