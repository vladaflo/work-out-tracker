//
//  TimerView.swift
//  WorkOutTracker
//
//  Created by Vlada Filipova on 08/12/2024.
//

import UIKit

enum TimerState {
    case isRuning
    case isPaused
    case isStopped
}

final class TimerView: BaseInfoViews {

    private let elapsedTimeLable: UILabel = {
        let lable = UILabel()
        lable.text = Resources.Strings.Session.elapsedTime
        lable.font = Resources.Fonts.helveticaRegular(with: 14)
        lable.textColor = Resources.Colors.inactive
        lable.textAlignment = .center
        return lable
    }()

    private let elapsedTimeValueLable: UILabel = {
        let lable = UILabel()
        lable.font = Resources.Fonts.helveticaRegular(with: 46)
        lable.textColor = Resources.Colors.titleGray
        lable.textAlignment = .center
        return lable
    }()

    private let remainingTimeLable: UILabel = {
        let lable = UILabel()
        lable.text = Resources.Strings.Session.remainingTime
        lable.font = Resources.Fonts.helveticaRegular(with: 13)
        lable.textColor = Resources.Colors.inactive
        lable.textAlignment = .center
        return lable
    }()

    private let remainingTimeValueLable: UILabel = {
        let lable = UILabel()
        lable.font = Resources.Fonts.helveticaRegular(with: 13)
        lable.textColor = Resources.Colors.titleGray
        lable.textAlignment = .center
        return lable
    }()

    private let timeStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.spacing = 10
        return view
    }()

    private let bottomStackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillProportionally
        view.spacing = 25
        return view
    }()

    private let completedPercentView = PercentView()
    private let remainigPercetnView = PercentView()

    private let bottomSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Resources.Colors.separator
        return view
    }()

    private let progressView = ProgressView()

    private var timer = Timer()
    private var timerProgress: CGFloat = 0
    private var timerDuration = 0.0

    var state: TimerState = .isStopped
    var callBack: (() -> Void)?

    func configure(with duration: Double, progress: Double) {
        timerDuration = duration

        let tempCurrentValue = progress > duration ? duration : progress
        let goalValueDevider = duration == 0 ? 1 : duration
        let percent = tempCurrentValue / goalValueDevider
        let roundedPercent = Int(round(percent * 100))

        elapsedTimeValueLable.text = getDisplayedString(from: Int(tempCurrentValue))
        remainingTimeValueLable.text = getDisplayedString(from: Int(duration) - Int(tempCurrentValue))
        completedPercentView.configure(with: Resources.Strings.Session.completed.uppercased(),
                                       andValue: roundedPercent)
        remainigPercetnView.configure(with: Resources.Strings.Session.remaining.uppercased(),
                                      andValue: 100 - roundedPercent)
        progressView.drawProgress(with: CGFloat(percent))
    }

    func startTimer() {
           timer.invalidate()

           timer = Timer.scheduledTimer(withTimeInterval: 0.01,
                                        repeats: true,
                                        block: { [weak self] timer in
               guard let self = self else { return }
               self.timerProgress += 0.01

               if self.timerProgress > self.timerDuration {
                   self.timerProgress = self.timerDuration
                   timer.invalidate()
               }

               self.configure(with: self.timerDuration, progress: self.timerProgress)
           })
       }

    func pauseTimer() {
        timer.invalidate()
    }

    func stopTimer() {
        guard self.timerProgress > 0 else { return }
        timer.invalidate()

        timer = Timer.scheduledTimer(withTimeInterval: 0.01,
                                     repeats: true,
                                     block: { [weak self] timer in
            guard let self = self else { return }
            self.timerProgress -= self.timerDuration * 0.02

            if self.timerProgress <= 0 {
                self.timerProgress = 0
                timer.invalidate()
            }

            self.configure(with: self.timerDuration, progress: self.timerProgress)
        })
    }
}

extension TimerView {
    override func setupViews() {
        super.setupViews()

        setupView(progressView)
        setupView(timeStackView)
        setupView(bottomStackView)

        [
            elapsedTimeLable,
            elapsedTimeValueLable,
            remainingTimeLable,
            remainingTimeValueLable
        ].forEach(timeStackView.addArrangedSubview)

        [
            completedPercentView,
            bottomSeparatorView,
            remainigPercetnView
        ].forEach(bottomStackView.addArrangedSubview)
    }

    override func constraintViews() {
        super.constraintViews()

        NSLayoutConstraint.activate([
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor),
            progressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),

            timeStackView.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            timeStackView.centerXAnchor.constraint(equalTo: progressView.centerXAnchor),

            bottomStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -28),
            bottomStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bottomStackView.heightAnchor.constraint(equalToConstant: 35),
            bottomStackView.widthAnchor.constraint(equalToConstant: 175),

            bottomSeparatorView.widthAnchor.constraint(equalToConstant: 1)
        ])
    }

    override func configureAppearance() {
        super.configureAppearance()
    }
}

private extension TimerView {
    func getDisplayedString(from value: Int) -> String {
        let seconds = value % 60
        let minutes = (value / 60) % 60
        let hours = value / 3600

        let secondsStr = seconds < 10 ? "0\(seconds)" : "\(seconds)"
        let minutesStr = minutes < 10 ? "0\(minutes)" : "\(minutes)"
        let hoursStr = hours < 10 ? "0\(hours)" : "\(hours)"

        return hours == 0
            ? [minutesStr, secondsStr].joined(separator: ":")
            : [hoursStr, minutesStr, secondsStr].joined(separator: ":")
    }
}
