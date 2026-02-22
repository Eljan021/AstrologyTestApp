//
//  TermsView.swift
//  AstrologyTestApp
//
//  Created by Eljan on 28.01.26.
//

import SwiftUI

struct TermsView: View {
  
    var body: some View {
   
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                Text("📜 İSTİFADƏ ŞƏRTLƏRİ (Terms & Conditions)")
                
                Text("Son yenilənmə tarixi: 25.02.2026")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                Text("""
Bu İstifadə Şərtləri (“Şərtlər”) Auraly mobil tətbiqindən (“Auraly”) istifadə qaydalarını müəyyən edir. Tətbiqdən istifadə etməklə siz bu Şərtlərlə razılaşmış hesab edilirsiniz.
""")
                
                Group {
                    Text("1. Xidmətin Təsviri")
                        .font(.headline)
                    
                    Text("""
Auraly istifadəçilərə astrologiya əsaslı fərdi analizlər, ulduz xəritəsi (doğum xəritəsi), solyar analizi, tranzit şərhləri və digər ezoterik məzmun təqdim edir. Təqdim olunan məlumatlar əyləncə və özünüinkişaf məqsədi daşıyır.
""")
                }
                
                Group {
                    Text("2. Yaş Məhdudiyyəti")
                        .font(.headline)
                    
                    Text("""
Tətbiqdən istifadə üçün minimum yaş həddi 18-dir. 18 yaşdan kiçik şəxslər valideyn və ya qanuni nümayəndənin icazəsi ilə istifadə edə bilər.
""")
                }
                
                Group {
                    Text("3. Qeydiyyat və Məlumatların Düzgünlüyü")
                        .font(.headline)
                    
                    Text("""
İstifadəçi qeydiyyat zamanı təqdim etdiyi məlumatların (ad, doğum tarixi, doğum saatı, doğum yeri və s.) düzgün və aktual olmasına görə məsuliyyət daşıyır.
""")
                }
                
                Group {
                    Text("4. Ödənişlər və Abunəlik")
                        .font(.headline)
                    
                    Text("""
Bəzi xidmətlər ödənişli ola bilər. Abunəlik avtomatik yenilənə bilər (əgər ləğv edilməzsə). Ödənişlər tətbiq mağazasının (App Store / Google Play) qaydalarına uyğun həyata keçirilir.
""")
                }
                
                Group {
                    Text("5. Məsuliyyətin Məhdudlaşdırılması")
                        .font(.headline)
                    
                    Text("""
Tətbiqdə təqdim olunan astrologiya analizləri elmi, tibbi, hüquqi və ya maliyyə məsləhəti hesab edilmir. İstifadəçi qərarlarına görə özü məsuliyyət daşıyır.
""")
                }
                
                Group {
                    Text("6. İntellektual Mülkiyyət")
                        .font(.headline)
                    
                    Text("""
Tətbiqdəki bütün məzmun (mətnlər, dizayn, loqo, analiz sistemləri və s.) Auraly-a məxsusdur və icazəsiz istifadə oluna bilməz.
""")
                }
                
                Group {
                    Text("7. Hesabın Dayandırılması")
                        .font(.headline)
                    
                    Text("""
İstifadəçi Şərtləri pozduğu halda hesab müvəqqəti və ya daimi olaraq bloklana bilər.
""")
                }
                
                Group {
                    Text("8. Dəyişikliklər")
                        .font(.headline)
                    
                    Text("""
Şərtlər zaman-zaman yenilənə bilər. Yenilənmiş versiya tətbiqdə dərc olunduğu andan qüvvəyə minir.
""")
                }
                
                Group {
                    Text("9. Əlaqə")
                        .font(.headline)
                    
                    Text("Suallar üçün:")
                    
                    Text("Email: auraly@gmail.com")
                        .foregroundColor(.blue)
                }
            }
            .padding()
        }
        .navigationTitle("İstifadə Şərtləri")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    TermsView()
}
