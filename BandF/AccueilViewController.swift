import UIKit
import WebKit

class AccueilViewController: UIViewController {

    @IBOutlet weak var Video_pres: UIView! // Vue contenant la vidéo
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Création de la WebView
        webView = WKWebView(frame: .zero)
        webView.translatesAutoresizingMaskIntoConstraints = false
        Video_pres.addSubview(webView)

        // Ajout de contraintes pour que la WebView remplisse Video_pres
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: Video_pres.topAnchor),
            webView.bottomAnchor.constraint(equalTo: Video_pres.bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: Video_pres.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: Video_pres.trailingAnchor)
        ])

        // Charger la vidéo avec HTML pour qu'elle s'affiche correctement
        let videoID = "KLImqL0kZeU" // Remplace par l’ID de ta vidéo YouTube
        let html = """
        <!DOCTYPE html>
        <html>
        <body style="margin:0;padding:0;overflow:hidden;">
            <iframe width="100%" height="100%" src="https://www.youtube.com/embed/\(videoID)?playsinline=1" frameborder="0" allowfullscreen></iframe>
        </body>
        </html>
        """
        webView.loadHTMLString(html, baseURL: nil)
    }
}
