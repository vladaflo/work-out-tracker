//
//  TasksCellView.swift
//  WorkOutTracker
//
//  Created by Vlada Filipova on 16/01/2025.
//

import UIKit

final class TasksCellView: UICollectionViewCell {
    static let id = "TasksCellView"
    
    private let checkmarkView = UIImageView(image: Resources.Images.Overview.checkmarkNotDone)
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 3
        return view
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: 17)
        label.textColor = Resources.Colors.titleGray
        return label
    }()
    
    private let subtitle: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: 13)
        label.textColor = Resources.Colors.inactive
        return label
    }()
    
    private let rightArrowView = UIImageView(image: Resources.Images.Overview.rightArrow)
    
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
    
    func configure(with title: String, subtitle: String, isDone: Bool) {
        self.title.text = title
        self.subtitle.text = subtitle
        
        checkmarkView.image = isDone ? Resources.Images.Overview.checkmarkDone : Resources.Images.Overview.checkmarkNotDone
    }
}
    
private extension TasksCellView {
    func setupViews() {
        setupView(checkmarkView)
        setupView(stackView)
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(subtitle)
        setupView(rightArrowView)
    }
    
    func constaintViews() {
        NSLayoutConstraint.activate([
            checkmarkView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            checkmarkView.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkmarkView.heightAnchor.constraint(equalToConstant: 28),
            checkmarkView.widthAnchor.constraint(equalTo: checkmarkView.heightAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: checkmarkView.trailingAnchor, constant: 15),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.trailingAnchor.constraint(equalTo: rightArrowView.leadingAnchor, constant: -15),
            
            rightArrowView.centerYAnchor.constraint(equalTo: centerYAnchor),
            rightArrowView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            rightArrowView.heightAnchor.constraint(equalToConstant: 12),
            rightArrowView.widthAnchor.constraint(equalToConstant: 7)
        ])
    }
    
    func configureAppearance() {
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = Resources.Colors.separator.cgColor
    }
}
