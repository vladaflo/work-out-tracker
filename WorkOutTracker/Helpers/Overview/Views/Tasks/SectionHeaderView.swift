//
//  SectionHeaderView.swift
//  WorkOutTracker
//
//  Created by Vlada Filipova on 16/01/2025.
//

import UIKit

final class SectionHeaderView: UICollectionReusableView {
    static let id = "SectionHeaderView"
    
    private let title: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: 13)
        label.textColor = Resources.Colors.inactive
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
    super.init(frame: frame)
    
        setupViews()
        constaintViews()
        configureAppearance()
}
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        
        setupViews()
        constaintViews()
        configureAppearance()
}
    
    func configure(with title: String) {
        self.title.text = title.uppercased()
    }
}

private extension SectionHeaderView {
    func setupViews() {
        setupView(title)
    }
    func constaintViews() {
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    func configureAppearance() {
    }
}
