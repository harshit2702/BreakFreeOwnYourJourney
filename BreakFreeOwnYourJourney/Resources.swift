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
struct ResourcesRow: View {
    let imageLink: String
    let title: String
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: imageLink)) { image in
                            image
                                .resizable()
                                .frame(width: 50, height: 50)
                        } placeholder: {
                            ProgressView()
                                .frame(width: 50, height: 50)
                        }
            Text(title)
        }
        .frame(height: 50)
    }
}
struct Resources: View {
    @AppStorage("background") var backgroundImage = "bg3"
    var body: some View {
        NavigationView {
            ZStack{
                Image(backgroundImage)
                    .resizable()
                    .opacity(0.7)
                    .ignoresSafeArea()
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.black)
                    .opacity(0.2)
                    .ignoresSafeArea()
                List {
                    Section("E-Cigaretes"){
                        NavigationLink(destination: WebView(url: URL(string: "https://www.cdc.gov/tobacco/basic_information/e-cigarettes/index.html")!)) {
                            ResourcesRow(imageLink: "https://www.drought.gov/sites/default/files/hero/partners/CDC_logo.png", title: "Electronic Cigarettes")
                        }
                        NavigationLink(destination: WebView(url: URL(string: "https://www.cdc.gov/tobacco/basic_information/e-cigarettes/about-e-cigarettes.html")!)) {
                            ResourcesRow(imageLink: "https://www.drought.gov/sites/default/files/hero/partners/CDC_logo.png", title: "About Electronic Cigarettes (E-Cigarettes)")
                        }
                        NavigationLink(destination: WebView(url: URL(string: "https://www.fda.gov/tobacco-products/products-ingredients-components/e-cigarettes-vapes-and-other-electronic-nicotine-delivery-systems-ends")!)) {
                            ResourcesRow(imageLink: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.Gs6KZqd9_jTsc9U8WkKe3QHaDd%26pid%3DApi&f=1&ipt=47540056d230d6018d9c7e94b6b24a858df213389efc9366eeb661a1c9f374e7&ipo=images", title: "E-Cigarettes, Vapes, and other Electronic Nicotine Delivery Systems (ENDS)")
                        }
                        NavigationLink(destination: WebView(url: URL(string: "https://nida.nih.gov/publications/drugfacts/vaping-devices-electronic-cigarettes")!)) {
                            ResourcesRow(imageLink: "https://www.nih.gov/sites/default/files/styles/floated_media_breakpoint-medium/public/generic/thumbnail-generic.png?itok=JgZUnlUe&timestamp=1430320516", title: "Vaping Devices (Electronic Cigarettes) DrugFacts")
                        }
                        NavigationLink(destination: WebView(url: URL(string: "https://e-cigarettes.surgeongeneral.gov/")!)) {
                            ResourcesRow(imageLink: "", title: "Know the risks: E-cigarettes and Young People")
                        }
                        NavigationLink(destination: WebView(url: URL(string: "https://www.cancer.gov/publications/dictionaries/cancer-terms/def/electronic-cigarette")!)) {
                            ResourcesRow(imageLink: "", title: "electronic cigarette")
                        }
                        NavigationLink(destination: WebView(url: URL(string: "https://nida.nih.gov/publications/research-reports/tobacco-nicotine-e-cigarettes/introduction")!)) {
                            ResourcesRow(imageLink: "", title: "Tobacco, Nicotine, and E-Cigarettes Research Report")
                        }
                        NavigationLink(destination: WebView(url: URL(string: "https://medlineplus.gov/ecigarettes.html")!)) {
                            ResourcesRow(imageLink: "", title: "E-Cigarettes Also called: E-Cigs, Electronic Cigarettes, Personal Vaporizer")
                        }
                        NavigationLink(destination: WebView(url: URL(string: "https://smokefree.gov/quit-smoking/ecigs-menthol-dip/ecigs")!)) {
                            ResourcesRow(imageLink: "", title: "What We Know About Electronic Cigarettes")
                        }
                        NavigationLink(destination: WebView(url: URL(string: "https://dph.illinois.gov/topics-services/prevention-wellness/oral-health/fast-facts-oral-health/e-cigarettes-and-vaping.html")!)) {
                            ResourcesRow(imageLink: "", title: "E-Cigarettes and Vaping")
                        }
                    }
                    Section("Acute Lung Injury"){
                        NavigationLink(destination: WebView(url: URL(string: "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6188356/")!)) {
                            ResourcesRow(imageLink: "", title: "Acute Lung Injury and the Acute Respiratory Distress Syndrome: Pathophysiology and Treatment")
                        }
                        NavigationLink(destination: WebView(url: URL(string: "https://www.sciencedirect.com/topics/medicine-and-dentistry/acute-lung-injury")!)) {
                            ResourcesRow(imageLink: "", title: "Acute Lung Injury")
                        }
                        NavigationLink(destination: WebView(url: URL(string: "https://www.mayoclinic.org/diseases-conditions/ards/symptoms-causes/syc-20355576")!)) {
                            ResourcesRow(imageLink: "", title: "Acute respiratory distress syndrome (ARDS)")
                        }
                        NavigationLink(destination: WebView(url: URL(string: "https://academic.oup.com/pmj/article/87/1031/612/7031988")!)) {
                            ResourcesRow(imageLink: "", title: "Acute respiratory distress syndrome and acute lung injury ")
                        }
                        NavigationLink(destination: WebView(url: URL(string: "https://www.nejm.org/doi/full/10.1056/NEJMoa050333")!)) {
                            ResourcesRow(imageLink: "", title: "Incidence and Outcomes of Acute Lung Injury")
                        }
                        NavigationLink(destination: WebView(url: URL(string: "https://med.emory.edu/departments/medicine/divisions/pulmonary/research/acute-lung-injury.html")!)) {
                            ResourcesRow(imageLink: "", title: "Acute Lung Injury and Sepsis")
                        }
                        NavigationLink(destination: WebView(url: URL(string: "https://academic.oup.com/pmj/article/87/1031/612/7031988")!)) {
                            ResourcesRow(imageLink: "", title: "Acute respiratory distress syndrome and acute lung injury ")
                        }
                    }
                    Section("Lung Cancer"){
                        NavigationLink(destination: WebView(url: URL(string: "https://www.cdc.gov/cancer/lung/basic_info/what-is-lung-cancer.htm")!)) {
                            ResourcesRow(imageLink: "https://www.cdc.gov/tobacco/basic_information/e-cigarettes/about-e-cigarettes.html", title: "What Is Lung Cancer?")
                        }
                        NavigationLink(destination: WebView(url: URL(string: "https://www.ncbi.nlm.nih.gov/books/NBK482357/")!)) {
                            ResourcesRow(imageLink: "", title: "Lung Cancer")
                        }
                        NavigationLink(destination: WebView(url: URL(string: "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3864624/")!)) {
                            ResourcesRow(imageLink: "", title: "Lung Cancer: Epidemiology, Etiology, and Prevention")
                        }
                        NavigationLink(destination: WebView(url: URL(string: "https://www.nyc.gov/site/doh/health/health-topics/lung-cancer.page")!)) {
                            ResourcesRow(imageLink: "", title: "Lung Cancer")
                        }
                        NavigationLink(destination: WebView(url: URL(string: "https://www.epa.gov/radon/health-risk-radon")!)) {
                            ResourcesRow(imageLink: "", title: "Health Risk of Radon")
                        }
                        NavigationLink(destination: WebView(url: URL(string: "https://scdhec.gov/health/diseases-conditions/cancer/lung-cancer/lung-cancer-symptoms")!)) {
                            ResourcesRow(imageLink: "", title: "Lung Cancer Symptoms")
                        }
                    }
                    Section("Nicotine Risks"){
                        NavigationLink(destination: WebView(url: URL(string: "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4363846/")!)) {
                            ResourcesRow(imageLink: "", title: "Harmful effects of nicotine")
                        }
                        NavigationLink(destination: WebView(url: URL(string: "https://www.hopkinsmedicine.org/health/wellness-and-prevention/5-truths-you-need-to-know-about-vaping")!)) {
                            ResourcesRow(imageLink: "", title: "5 Vaping Facts You Need to Know")
                        }
                        NavigationLink(destination: WebView(url: URL(string: "https://www.cdc.gov/tobacco/basic_information/e-cigarettes/Quick-Facts-on-the-Risks-of-E-cigarettes-for-Kids-Teens-and-Young-Adults.html")!)) {
                            ResourcesRow(imageLink: "https://www.cdc.gov/tobacco/basic_information/e-cigarettes/about-e-cigarettes.html", title: "Quick Facts on the Risks of E-cigarettes for Kids, Teens, and Young Adults")
                        }
                        NavigationLink(destination: WebView(url: URL(string: "https://my.clevelandclinic.org/health/articles/17488-smoking")!)) {
                            ResourcesRow(imageLink: "", title: "Smoking")
                        }
                        NavigationLink(destination: WebView(url: URL(string: "https://www.ncbi.nlm.nih.gov/books/NBK294308/")!)) {
                            ResourcesRow(imageLink: "", title: "The Health Consequences of Smoking—50 Years of Progress: A Report of the Surgeon General.")
                        }
                        NavigationLink(destination: WebView(url: URL(string: "https://www.verywellhealth.com/what-is-nicotine-5075412")!)) {
                            ResourcesRow(imageLink: "", title: "What Is Nicotine?")
                        }
                        NavigationLink(destination: WebView(url: URL(string: "https://www.mayoclinic.org/diseases-conditions/nicotine-dependence/symptoms-causes/syc-20351584")!)) {
                            ResourcesRow(imageLink: "", title: "Nicotine dependence")
                        }
                    }
                }
                .scrollContentBackground(.hidden)
            }
        }
    }
}

#Preview {
    Resources()
}
