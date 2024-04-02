//
//  Resources.swift
//  BreakFreeOwnYourJourney
//
//  Created by Harshit Agarwal on 31/03/24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

struct Resources: View {
    var body: some View {
        NavigationView {
            List {
                Section("E-Cigaretes"){
                    NavigationLink(destination: WebView(url: URL(string: "https://www.cdc.gov/tobacco/basic_information/e-cigarettes/index.htm")!)) {
                        Text("https://www.cdc.gov/tobacco/basic_information/e-cigarettes/index.htm")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://www.cdc.gov/tobacco/basic_information/e-cigarettes/about-e-cigarettes.html")!)) {
                        Text("https://www.cdc.gov/tobacco/basic_information/e-cigarettes/about-e-cigarettes.html")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://www.fda.gov/tobacco-products/products-ingredients-components/e-cigarettes-vapes-and-other-electronic-nicotine-delivery-systems-ends")!)) {
                        Text("https://www.fda.gov/tobacco-products/products-ingredients-components/e-cigarettes-vapes-and-other-electronic-nicotine-delivery-systems-ends")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://nida.nih.gov/publications/drugfacts/vaping-devices-electronic-cigarettes")!)) {
                        Text("https://nida.nih.gov/publications/drugfacts/vaping-devices-electronic-cigarettes")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://e-cigarettes.surgeongeneral.gov/")!)) {
                        Text("https://e-cigarettes.surgeongeneral.gov/")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://www.cancer.gov/publications/dictionaries/cancer-terms/def/electronic-cigarette")!)) {
                        Text("https://www.cancer.gov/publications/dictionaries/cancer-terms/def/electronic-cigarette")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://e-cigarettes.surgeongeneral.gov/knowtherisks.html")!)) {
                        Text("https://e-cigarettes.surgeongeneral.gov/knowtherisks.html")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://nida.nih.gov/publications/research-reports/tobacco-nicotine-e-cigarettes/introduction")!)) {
                        Text("https://nida.nih.gov/publications/research-reports/tobacco-nicotine-e-cigarettes/introduction")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://medlineplus.gov/ecigarettes.html")!)) {
                        Text("https://medlineplus.gov/ecigarettes.html")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://smokefree.gov/quit-smoking/ecigs-menthol-dip/ecigs")!)) {
                        Text("https://smokefree.gov/quit-smoking/ecigs-menthol-dip/ecigs")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://dph.illinois.gov/topics-services/prevention-wellness/oral-health/fast-facts-oral-health/e-cigarettes-and-vaping.html")!)) {
                        Text("https://dph.illinois.gov/topics-services/prevention-wellness/oral-health/fast-facts-oral-health/e-cigarettes-and-vaping.html")
                    }
                }
                Section("Acute Lung Injury"){
                    NavigationLink(destination: WebView(url: URL(string: "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6188356/")!)) {
                        Text("https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6188356/")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://www.sciencedirect.com/topics/medicine-and-dentistry/acute-lung-injury")!)) {
                        Text("https://www.sciencedirect.com/topics/medicine-and-dentistry/acute-lung-injury")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://www.sciencedirect.com/topics/medicine-and-dentistry/acute-lung-injury")!)) {
                        Text("https://www.sciencedirect.com/topics/medicine-and-dentistry/acute-lung-injury")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://www.mayoclinic.org/diseases-conditions/ards/symptoms-causes/syc-20355576")!)) {
                        Text("https://www.mayoclinic.org/diseases-conditions/ards/symptoms-causes/syc-20355576")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://www.sciencedirect.com/topics/medicine-and-dentistry/acute-lung-injury")!)) {
                        Text("https://www.sciencedirect.com/topics/medicine-and-dentistry/acute-lung-injury")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://www.mayoclinic.org/diseases-conditions/ards/symptoms-causes/syc-20355576")!)) {
                        Text("https://www.mayoclinic.org/diseases-conditions/ards/symptoms-causes/syc-20355576")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://www.mayoclinic.org/diseases-conditions/ards/symptoms-causes/syc-20355576")!)) {
                        Text("https://www.mayoclinic.org/diseases-conditions/ards/symptoms-causes/syc-20355576")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://academic.oup.com/pmj/article/87/1031/612/7031988")!)) {
                        Text("https://academic.oup.com/pmj/article/87/1031/612/7031988")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://www.nejm.org/doi/full/10.1056/NEJMoa050333")!)) {
                        Text("https://www.nejm.org/doi/full/10.1056/NEJMoa050333")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://med.emory.edu/departments/medicine/divisions/pulmonary/research/acute-lung-injury.html")!)) {
                        Text("https://med.emory.edu/departments/medicine/divisions/pulmonary/research/acute-lung-injury.html")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://academic.oup.com/pmj/article/87/1031/612/7031988")!)) {
                        Text("https://academic.oup.com/pmj/article/87/1031/612/7031988")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://www.nejm.org/doi/full/10.1056/NEJMoa050333")!)) {
                        Text("https://www.nejm.org/doi/full/10.1056/NEJMoa050333")
                    }
                }
                Section("Lung Cancer"){
                    NavigationLink(destination: WebView(url: URL(string: "https://www.cdc.gov/cancer/lung/basic_info/what-is-lung-cancer.htm")!)) {
                        Text("https://www.cdc.gov/cancer/lung/basic_info/what-is-lung-cancer.htm")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://www.ncbi.nlm.nih.gov/books/NBK482357/")!)) {
                        Text("https://www.ncbi.nlm.nih.gov/books/NBK482357/")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3864624/")!)) {
                        Text("https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3864624/")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://www.nyc.gov/site/doh/health/health-topics/lung-cancer.page")!)) {
                        Text("https://www.nyc.gov/site/doh/health/health-topics/lung-cancer.page")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://www.epa.gov/radon/health-risk-radon")!)) {
                        Text("https://www.epa.gov/radon/health-risk-radon")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://scdhec.gov/health/diseases-conditions/cancer/lung-cancer/lung-cancer-symptoms")!)) {
                        Text("https://scdhec.gov/health/diseases-conditions/cancer/lung-cancer/lung-cancer-symptoms")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://www.fda.gov/news-events/press-announcements/fda-approves-first-targeted-therapy-lung-cancer-mutation-previously-considered-resistant-drug")!)) {
                        Text("https://www.fda.gov/news-events/press-announcements/fda-approves-first-targeted-therapy-lung-cancer-mutation-previously-considered-resistant-drug")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3864624/")!)) {
                        Text("https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3864624/")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://www.nyc.gov/site/doh/health/health-topics/lung-cancer.page")!)) {
                        Text("https://www.nyc.gov/site/doh/health/health-topics/lung-cancer.page")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://www.epa.gov/radon/health-risk-radon")!)) {
                        Text("https://www.epa.gov/radon/health-risk-radon")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://scdhec.gov/health/diseases-conditions/cancer/lung-cancer/lung-cancer-symptoms")!)) {
                        Text("https://scdhec.gov/health/diseases-conditions/cancer/lung-cancer/lung-cancer-symptoms")
                    }
                }
                Section("Nicotine Risks"){
                    NavigationLink(destination: WebView(url: URL(string: "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4363846/")!)) {
                        Text("https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4363846/")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://www.hopkinsmedicine.org/health/wellness-and-prevention/5-truths-you-need-to-know-about-vaping")!)) {
                        Text("https://www.hopkinsmedicine.org/health/wellness-and-prevention/5-truths-you-need-to-know-about-vaping")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://www.cdc.gov/tobacco/basic_information/e-cigarettes/Quick-Facts-on-the-Risks-of-E-cigarettes-for-Kids-Teens-and-Young-Adults.html")!)) {
                        Text("https://www.cdc.gov/tobacco/basic_information/e-cigarettes/Quick-Facts-on-the-Risks-of-E-cigarettes-for-Kids-Teens-and-Young-Adults.html")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://my.clevelandclinic.org/health/articles/17488-smoking")!)) {
                        Text("https://my.clevelandclinic.org/health/articles/17488-smoking")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://www.ncbi.nlm.nih.gov/books/NBK294308/")!)) {
                        Text("https://www.ncbi.nlm.nih.gov/books/NBK294308/")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://www.verywellhealth.com/what-is-nicotine-5075412")!)) {
                        Text("https://www.verywellhealth.com/what-is-nicotine-5075412")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://www.mayoclinic.org/diseases-conditions/nicotine-dependence/symptoms-causes/syc-20351584")!)) {
                        Text("https://www.mayoclinic.org/diseases-conditions/nicotine-dependence/symptoms-causes/syc-20351584")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://my.clevelandclinic.org/health/articles/17488-smoking")!)) {
                        Text("https://my.clevelandclinic.org/health/articles/17488-smoking")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://www.ncbi.nlm.nih.gov/books/NBK294308/")!)) {
                        Text("https://www.ncbi.nlm.nih.gov/books/NBK294308/")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://www.ncbi.nlm.nih.gov/books/NBK294308/")!)) {
                        Text("https://www.ncbi.nlm.nih.gov/books/NBK294308/")
                    }
                }
                Section("Others"){
                    NavigationLink(destination: WebView(url: URL(string: "https://www.ncbi.nlm.nih.gov/books/NBK560656/")!)) {
                        Text("https://www.ncbi.nlm.nih.gov/books/NBK560656/")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://www.sciencedirect.com/science/article/pii/S0163725821002084")!)) {
                        Text("https://www.sciencedirect.com/science/article/pii/S0163725821002084")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://www.atsjournals.org/doi/full/10.1164/rccm.202201-0034ED")!)) {
                        Text("https://www.atsjournals.org/doi/full/10.1164/rccm.202201-0034ED")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://www.atsjournals.org/doi/pdf/10.1164/rccm.202201-0034ED")!)) {
                        Text("https://www.atsjournals.org/doi/pdf/10.1164/rccm.202201-0034ED")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://www.lung.org/quit-smoking/e-cigarettes-vaping/impact-of-e-cigarettes-on-lung")!)) {
                        Text("https://www.lung.org/quit-smoking/e-cigarettes-vaping/impact-of-e-cigarettes-on-lung")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://www.nejm.org/doi/full/10.1056/NEJMe1912032")!)) {
                        Text("https://www.nejm.org/doi/full/10.1056/NEJMe1912032")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://www.sciencedirect.com/science/article/pii/S2468867321000729")!)) {
                        Text("https://www.sciencedirect.com/science/article/pii/S2468867321000729")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://jeccm.amegroups.org/article/view/3660/html")!)) {
                        Text("https://jeccm.amegroups.org/article/view/3660/html")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://jeccm.amegroups.org/article/view/3660/html")!)) {
                        Text("https://jeccm.amegroups.org/article/view/3660/html")
                    }
                    NavigationLink(destination: WebView(url: URL(string: "https://www.annualreviews.org/doi/abs/10.1146/annurev-physiol-061121-040014")!)) {
                        Text("https://www.annualreviews.org/doi/abs/10.1146/annurev-physiol-061121-040014")
                    }
                }
            }
        }
    }
}

#Preview {
    Resources()
}
