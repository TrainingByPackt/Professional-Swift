//
//  DetailViewController.swift
//  TVShowsApp
//
//  Created by Kåre Morstøl on 31/10/2017.
//  Copyright © 2017 NotTooBad Software. All rights reserved.
//

import UIKit
import TVShows
import Alamofire

class DetailViewController: UIViewController {

	@IBOutlet weak var summaryLabel: UILabel!
	@IBOutlet weak var imageView: UIImageView!

	func configureView() {
		// Update the user interface for the detail item.
		guard let show = detailItem, let summaryLabel = summaryLabel else {
			self.navigationItem.title = ""
			return
		}
		self.navigationItem.title = show.name
		do {
			let summary = try NSMutableAttributedString(html: show.summary ?? " ")
			summary.addAttribute(.font, value: UIFont.preferredFont(forTextStyle: .body), range: NSRange(location: 0, length: summary.length))
			summaryLabel.attributedText = summary
		} catch {
			summaryLabel.text = error.localizedDescription
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		configureView()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	var imageAspectRatioConstraint: NSLayoutConstraint?

	var detailItem: Show? {
		didSet {
			// Update the view.
			configureView()

			if let imageurl = detailItem?.image,
				var imageurlcomponents = URLComponents(url: imageurl, resolvingAgainstBaseURL: true) {
				imageurlcomponents.scheme = "https"
				Alamofire.request(imageurlcomponents.url!).responseData { response in
					guard let data = response.result.value, let image = UIImage(data: data) else { return }
					self.imageView.image = image

					// Avoid large empty spaces above and below the image
					self.imageAspectRatioConstraint?.isActive = false
					self.imageAspectRatioConstraint = self.imageView.widthAnchor.constraint(
						equalTo: self.imageView.heightAnchor,
						multiplier: image.size.width / image.size.height)
					self.imageAspectRatioConstraint!.isActive = true
				}
			}
		}
	}
}

extension NSAttributedString {
	convenience init(html: String) throws {
		guard let data = html.data(using: .utf8) else { throw CocoaError.formatting.error("Could not encode HTML text with UTF-8.") }
		try self.init(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
	}
}

extension CocoaError.Code {
	func error(_ description: String) -> Error {
		return CocoaError.error(self, userInfo: [NSLocalizedDescriptionKey: description])
	}
}
