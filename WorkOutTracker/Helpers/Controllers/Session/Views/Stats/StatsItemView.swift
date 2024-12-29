//
//  StatsItemView.swift
//  WorkOutTracker
//
//  Created by Vlada Filipova on 28/12/2024.
//

import UIKit

enum StatsItem {
    case heartRate(value: String)
    case avarageRate(value: String)
    case totalDistances(value: String)
    case totalSteps(value: String)
    
    var data: StatsItemView.ItemData  {
        switch self {
        case .avarageRate(let value):
            return .init(image: Resources.Images.Session.Stats.averagePace, value: value + " / km", title: Resources.Strings.Session.avarageRate)
            
        case .heartRate(let value):
            return .init(image: Resources.Images.Session.Stats.heartRate, value: value + " bpm", title: Resources.Strings.Session.heartRate)
            
        case .totalSteps(let value):
            return .init(image: Resources.Images.Session.Stats.totalSteps, value: value + " / km", title: Resources.Strings.Session.totalSteps)
            
        case .totalDistances(let value):
            return .init(image: Resources.Images.Session.Stats.totalDistance, value: value, title: Resources.Strings.Session.totalDistance)
        }
    }
}
    
    final class StatsItemView: BaseView {
        
        struct ItemData {
            let image: UIImage?
            let value: String
            let title: String
        }
        
        private let imageView = UIImageView()
        
        private let valueLable: UILabel = {
            let label = UILabel()
            label.font = Resources.Fonts.helveticaRegular(with: 17)
            label.textColor = Resources.Colors.titleGray
            return label
        }()
        
        private let titleLable: UILabel = {
            let label = UILabel()
            label.font = Resources.Fonts.helveticaRegular(with: 10)
            label.textColor = Resources.Colors.inactive
            return label
        }()
        
        private let stackView: UIStackView = {
            let view = UIStackView()
            view.axis = .vertical
            return view
        }()
        
        func configure(with item: StatsItem) {
            imageView.image = item.data.image
            valueLable.text = item.data.value
            titleLable.text = item.data.title.uppercased()
        }
    }
    
    extension StatsItemView {
        override func setupViews() {
            super.setupViews()
            
            setupView(imageView)
            setupView(stackView)
            stackView.addArrangedSubview(valueLable)
            stackView.addArrangedSubview(titleLable)
        }
        override func constraintViews() {
            super.constraintViews()
            
            NSLayoutConstraint.activate([
                imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
                imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                imageView.widthAnchor.constraint(equalToConstant: 23),
                
                stackView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 15),
                stackView.topAnchor.constraint(equalTo: topAnchor),
                stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
                
            ])
        }
        override func configureAppearance() {
            super.configureAppearance()
        }
    }
