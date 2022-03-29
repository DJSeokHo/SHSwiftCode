//
//  WebViewViewController.swift
//  SHSwiftCode
//
//  Created by 浩 SHI on 2022/03/29.
//

import UIKit
import WebKit

/*
 MARK: 主意事项
 
 注意从iOS9开始,凡是涉及到网络操作的,都要在Info.plist中加入:
 先添加一个项 App Transport Security Settings
 测试时, 在其内部添加 Allow Arbitrary Loads YES, 发布时记得改成 NO
 Allow Arbitrary Loads in Web Content YES
 
 前端交互: window.webkit.messageHandlers.addressInterface.postMessage(result);
 */
class WebViewViewController: UIViewController, WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler {
    
    static let ADDRESS_JS = "addressInterface"
    static let CERT_JS = "certInterface"
    static let PAYMENT_JS = "paymentInterface"
    
    
    var urlString: String?
    var header: String?
    
    var webView: WKWebView!
    
    var jsInterface: String?
    
    var target = ""
    
    public static func start(
        from parentViewController: UIViewController,
        urlString: String,
        header: String,
        jsInterface: String? = nil,
        target: String = ""
    ) {
        let viewController = StoryboardUtility.findViewControllerFromStoryboard(storyboardName: "WebView", withClassName: "WebViewViewController") as! WebViewViewController
        
        viewController.urlString = urlString
        viewController.header = header
        viewController.jsInterface = jsInterface
        viewController.target = target
        
        parentViewController.presentUIViewController(target: viewController, withNavigation: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initNavigationBar()
        
        initWebView()
    }
    
    private func initNavigationBar() {
        
        setStatusBarTheme(isDark: false)
        setNavigationBarCenterView(title: header ?? "")

        setNavigationBarTintColor(color: .white)
        setNavigationBarTrailingView(image: UIImage(named: "close_black")!, size: CGSize(width: 30, height: 30), action: #selector(onNavigationBarEndClick))
        
    }
    @objc func onNavigationBarEndClick() {
        finish()
    }
    
    private func initWebView() {
      
        let configuration = createConfiguration()
        
        addJSListener(configuration: configuration)
        
        webView = createWebView(configuration: configuration)
        
        view.addSubview(webView)
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: getNavigationBarAndStatusBarHeight()).isActive = true
        webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        view.layoutIfNeeded()
        
//        webView.widthAnchor.constraint(equalToConstant: DisplayUtility.getFullScreen().width).isActive = true
//        webView.heightAnchor.constraint(equalToConstant: DisplayUtility.getFullScreen().height - getNavigationBarAndStatusBarHeight()).isActive = true
        
        ILog.debug(tag: #file, content: urlString!)
        let url = URL(string: urlString!)
        let request = URLRequest(url: url!)
        webView.load(request)
    }
    
    private func createConfiguration() -> WKWebViewConfiguration {
        let preferences = WKPreferences()
        preferences.javaScriptCanOpenWindowsAutomatically = true
        
        let webpagePreferences = WKWebpagePreferences()
        webpagePreferences.allowsContentJavaScript = true
      
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        configuration.defaultWebpagePreferences = webpagePreferences
        
        // 메모리에서 랜더링 후 보여줌 Defalt = false
        // true 일경우 랜더링 시간동안 Black 스크린이 나옴
        configuration.suppressesIncrementalRendering = false
        
        // 기본값 false : HTML5 Video 형태로 플레이
        // true  : native full-screen play
        configuration.allowsInlineMediaPlayback = false
        
        // whether AirPlay is allowed.
        configuration.allowsAirPlayForMediaPlayback = false
        
        // 기본값 : true
        // whether HTML5 videos can play picture-in-picture.
        configuration.allowsPictureInPictureMediaPlayback = true
        
        // LocalStorage 사용하도록 설정
        configuration.websiteDataStore = WKWebsiteDataStore.default()

        // 기본값 : true
        // true : 사용자가 시작 , false : 자동시작
        configuration.mediaTypesRequiringUserActionForPlayback = WKAudiovisualMediaTypes.all
        
        return configuration
    }
    
    private func createWebView(configuration: WKWebViewConfiguration) -> WKWebView {
        
        let webView = WKWebView(frame: CGRect(x: 0, y: getNavigationBarAndStatusBarHeight(), width: DisplayUtility.getFullScreenSize().width, height: DisplayUtility.getFullScreenSize().height - getNavigationBarAndStatusBarHeight()), configuration: configuration)
        
        webView.navigationDelegate = self
        webView.uiDelegate = self
        
        webView.scrollView.scrollsToTop = true
        webView.scrollView.bounces = true
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.scrollView.showsHorizontalScrollIndicator = false
        webView.backgroundColor = UIColor.white
        
        return webView
    }
    
    private func addJSListener(configuration: WKWebViewConfiguration) {
        
        guard jsInterface != nil else {
            return
        }
        
        ILog.debug(tag: #file, content: "addJSListener \(jsInterface ?? "")")
        
        let userContentController = WKUserContentController.init()
        userContentController.add(self, name: jsInterface ?? "")
        
        configuration.userContentController = userContentController
    }
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
        ILog.debug(tag: #file, content: "\(message.body) \(message.name) \(message.frameInfo.request)")
        
        var dict: Dictionary<String, Any> = parsingJSInterfaceMessage(message: message)
        dict["target"] = target
        ILog.debug(tag: #file, content: dict)
        
        if jsInterface == WebViewViewController.ADDRESS_JS {
            ILog.debug(tag: #file, content: "send address result")
            NotificationUtility.post(name: NotificationConstants.SEARCH_ADDRESS_FINISHED, userInfo: dict)
            
            finish()
        }
        
        if jsInterface == WebViewViewController.CERT_JS {
            ILog.debug(tag: #file, content: "send cert result")
            NotificationUtility.post(name: NotificationConstants.CERT_PHONE_FINISHED, userInfo: dict)
          
            finish()
        }
        
        if jsInterface == WebViewViewController.PAYMENT_JS {
            /*
             window.webkit.messageHandlers.paymentInterface.postMessage("호출됩니다")
             window.webkit.messageHandlers.paymentInterface.postMessage("Y")
             window.webkit.messageHandlers.paymentInterface.postMessage("N")
             */
            if dict["result"] as? String == "Y" {
             
                ILog.debug(tag: #file, content: "send payment result")
                
                Toast.instance.showShortTimeToast(content: getRString(recourceName: "PAYMENT_SUCCESS"))
                
                NotificationUtility.post(name: NotificationConstants.PAYMENT_FINISHED, userInfo: dict)
                
                finish()
            }
        }
        
    }
    
    private func parsingJSInterfaceMessage(message: WKScriptMessage) -> Dictionary<String, Any> {
        
        ILog.debug(tag: #file, content: "parsingJSInterfaceMessage \(message)")
        
        guard message.body as! String != "" else {
            return Dictionary<String, Any>()
        }
        
        let infoArray = (message.body as! String).split(separator: ",")
        
        var dict: Dictionary<String, Any> = Dictionary<String, Any>()
        
        for info in infoArray {
            
            let infoKV = info.replacingOccurrences(of: " ", with: "").split(separator: ":")
            
            let key = infoKV[0]
            var value: String
            if infoKV.count > 1 {
                value = String(infoKV[1])
            }
            else {
                value = ""
            }
           
            dict[String(key)] = value
            
        }
        
        return dict
    }
    
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        
        ILog.debug(tag: #file, content: "check create \(navigationAction.targetFrame == nil) \(!(navigationAction.targetFrame?.isMainFrame ?? false))")
        ILog.debug(tag: #file, content: navigationAction.request.url?.absoluteString ?? "empty url")
        
        self.webView = createWebView(configuration: configuration)
        
        self.view.addSubview(self.webView!)
        return self.webView
        
    }
    
    // can jump or not
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
    
        let scheme = navigationAction.request.url?.scheme ?? ""
        let navigationUrlString = navigationAction.request.url?.absoluteString ?? ""
        
        ILog.debug(tag: #file, content: "can jump or not \(navigationUrlString)")
        
        if navigationUrlString == "" {
            decisionHandler(.allow)
            return
        }
        
        if navigationUrlString.hasPrefix("https://itunes.apple.com") {
            
            //스토어 연결(OS에서 처리)
            UIApplication.shared.open(URL(string: navigationUrlString)!)
            
            //웹뷰 내 페이지 이동 안하도록 설정(PolicyCancel)
            decisionHandler(.cancel)
            return
        }
        else if navigationUrlString.hasPrefix("tauthlink") ||
                    navigationUrlString.hasPrefix("ktauthexternalcall") ||
                    navigationUrlString.hasPrefix("upluscorporation") ||
                    navigationUrlString.hasPrefix("niceipin2") {
            //외부 앱 Scheme로 URL이 시작되는 경우
            //tauthLink(SKT PASS 인증앱)
            //ktauthexternalcall(KT PASS 인증앱)
            //upluscorporation(LGU+ PASS 인증앱)
            //회원사에서 추가로 연동하고 싶은 앱스키마가 있다면 or 조건에 추가 해주세요. (예시 : niceipin2 )
            
            //앱 실행
            UIApplication.shared.open(URL(string: navigationUrlString)!)
            
            //웹뷰 내 페이지 이동 안하도록 설정(PolicyCancel)
            decisionHandler(.cancel)
            return
        }
        
        if jsInterface == WebViewViewController.PAYMENT_JS {
            
            if !scheme.contains("http") && !scheme.contains("https") {
                
                if UIApplication.shared.canOpenURL(URL(string: navigationUrlString)!) {
                    
                    UIApplication.shared.open(URL(string: navigationUrlString)!)
                }
                else {
                    if navigationUrlString.contains("about:blank") == true {
                        ILog.debug(tag: #file, content: "Browser can't be opened, about:blank")
                    }
                    else{
                        ILog.debug(tag: #file, content: "Browser can't be opened, but Scheme try to call")
                        UIApplication.shared.open(URL(string: navigationUrlString)!)
                    }
                }
            }
            
            decisionHandler(.allow)
            return
        }
        
        decisionHandler(.allow)
        return
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        decisionHandler(.allow)
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        ILog.debug(tag: #file, content: "start \(webView.url?.absoluteString ?? "empty url")")
    }

    private func webView(webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: NSError) {
        ILog.debug(tag: #file, content: "fail \(webView.url?.absoluteString ?? "empty url")")
    }

    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        ILog.debug(tag: #file, content: "commit \(webView.url?.absoluteString ?? "empty url")")
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        ILog.debug(tag: #file, content: "finish \(webView.url?.absoluteString ?? "empty url")")
    }

    deinit {
        ILog.debug(tag: #file, content: "deinit")
        
        if webView != nil {
            
            if jsInterface != nil {
                webView!.configuration.userContentController.removeScriptMessageHandler(forName: jsInterface!)
            }
           
            webView!.removeFromSuperview()
            webView = nil
        }
    }
   
//    private func webView(webView: WKWebView, didFailNavigation navigation: WKNavigation!, withError error: NSError) {
//    }

//    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
//    }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
