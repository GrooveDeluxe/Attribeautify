//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import UIKit
import Attribeautify

class AttributedStringsViewController: UIViewController {

    // UI components

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    // Data source

    private let string: String = "Optional string"
    private let attributedString: NSAttributedString = "Optional string".attributed
    private let mutableAttributedString: NSMutableAttributedString = "Optional string".mutableAttributed

    private lazy var testString1 = string + string
    private lazy var testString2 = string + attributedString
    private lazy var testString3 = attributedString + string
    private lazy var testString4 = attributedString + attributedString
    private lazy var testString5 = attributedString + string
    private lazy var testString6 = string + attributedString
    private lazy var testString7 = mutableAttributedString + mutableAttributedString
    private lazy var testString8 = mutableAttributedString + string
    private lazy var testString9 = string + mutableAttributedString
    private lazy var testString10 = attributedString + mutableAttributedString
    private lazy var testString11 = mutableAttributedString + attributedString

    private let optionalString1: String? = "Optional string"
    private let optionalString2: String? = nil
    private lazy var testOptionalString1 = optionalString1 + optionalString2
    private lazy var testOptionalString2 = optionalString2 + optionalString1
    private lazy var testOptionalString3 = optionalString1 + string
    private lazy var testOptionalString4 = string + optionalString1
    private lazy var testOptionalString5 = optionalString2 + attributedString
    private lazy var testOptionalString6 = attributedString + optionalString2
    private lazy var testOptionalString7 = optionalString2 + mutableAttributedString
    private lazy var testOptionalString8 = mutableAttributedString + optionalString2

    private let optionalAttributedString1: NSAttributedString? = "Optional attributed string".attributed
    private let optionalAttributedString2: NSAttributedString? = nil
    private lazy var testOptionalAttributedString1 = optionalAttributedString1 + optionalAttributedString2
    private lazy var testOptionalAttributedString2 = optionalAttributedString2 + optionalAttributedString1
    private lazy var testOptionalAttributedString3 = optionalAttributedString1 + optionalString2
    private lazy var testOptionalAttributedString4 = optionalAttributedString2 + optionalString1
    private lazy var testOptionalAttributedString5 = optionalAttributedString1 + string
    private lazy var testOptionalAttributedString6 = string + optionalAttributedString2
    private lazy var testOptionalAttributedString7 = optionalAttributedString1 + attributedString
    private lazy var testOptionalAttributedString8 = attributedString + optionalAttributedString2
    private lazy var testOptionalAttributedString9 = optionalAttributedString1 + mutableAttributedString
    private lazy var testOptionalAttributedString10 = mutableAttributedString + optionalAttributedString2

    private let optMutAttrString1: NSMutableAttributedString? = "Optional mutable attributed string".mutableAttributed
    private let optMutAttrString2: NSMutableAttributedString? = nil
    private lazy var testOptMutAttrString1 = optMutAttrString1 + optMutAttrString2
    private lazy var testOptMutAttrString2 = optMutAttrString2 + optMutAttrString1
    private lazy var testOptMutAttrString3 = optMutAttrString1 + optionalAttributedString1
    private lazy var testOptMutAttrString4 = optionalAttributedString1 + optMutAttrString2
    private lazy var testOptMutAttrString5 = optMutAttrString1 + string
    private lazy var testOptMutAttrString6 = string + optMutAttrString2
    private lazy var testOptMutAttrString7 = optMutAttrString1 + attributedString
    private lazy var testOptMutAttrString8 = attributedString + optMutAttrString2
    private lazy var testOptMutAttrString9 = optMutAttrString1 + mutableAttributedString
    private lazy var testOptMutAttrString10 = mutableAttributedString + optMutAttrString2

    private lazy var strings: [AttributedStringConvertible?] = [
        "Title".title,
        "Subtitle".subtitle,
        "Body".body,
        "Error".error,
        "\n",
        "Some customized title".title
            .kern(10)
            .mutateParagraphStyle(.lineHeight(40), .alignment(.center))
            .foregroundColor(.appRed, for: "title")
            .debug(),
        "\n",
        "Test strings".title,
        "\n",
        testString1,
        testString2,
        testString3,
        testString4,
        testString5,
        testString6,
        testString7,
        testString8,
        testString9,
        testString10,
        testString11,
        "\n",
        "Test optionals".title,
        "\n",
        optionalString1 + optionalString2,
        optionalString1.orEmpty + optionalString2,
        optionalString1 + optionalString2.orEmpty,
        optionalString1.orEmpty + optionalString2.orEmpty,
        optionalString1.orEmpty.title + optionalString2.orEmpty,
        optionalString1.orEmpty + optionalString2.orEmpty.title,
        optionalString1.orEmpty.title + optionalString2.orEmpty.title,
        testOptionalString1,
        testOptionalString2,
        testOptionalString3,
        testOptionalString4,
        testOptionalString5,
        testOptionalString6,
        testOptionalString7,
        testOptionalString8,
        testOptionalAttributedString1,
        testOptionalAttributedString2,
        testOptionalAttributedString3,
        testOptionalAttributedString4,
        testOptionalAttributedString5,
        testOptionalAttributedString6,
        testOptionalAttributedString7,
        testOptionalAttributedString8,
        testOptionalAttributedString9,
        testOptionalAttributedString10,
        testOptMutAttrString1,
        testOptMutAttrString2,
        testOptMutAttrString3,
        testOptMutAttrString4,
        testOptMutAttrString5,
        testOptMutAttrString6,
        testOptMutAttrString7,
        testOptMutAttrString8,
        testOptMutAttrString9,
        testOptMutAttrString10,
    ]

    // View controller

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .appBackground

        view.addSubview(scrollView)
        scrollView.addSubview(stackView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 16),
            stackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32)
        ])

        strings.forEach { string in
            guard let string = string else { return }
            stackView.addArrangedSubview(label(string.mutableAttributed))
        }
    }

    func label(_ attributedString: NSAttributedString) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = attributedString
        label.numberOfLines = 0
        return label
    }
}

