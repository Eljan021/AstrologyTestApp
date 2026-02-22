//
//  PrivacyView.swift
//  AstrologyTestApp
//
//  Created by Eljan on 27.01.26.
//

import SwiftUI

struct PrivacyView: View {
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("🔒 MƏXFİLİK SİYASƏTİ (Privacy Policy)")
                Text("Son yenilənmə tarixi: 25.02.2026")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                Text("[Tətbiqin adı] istifadəçilərin şəxsi məlumatlarının qorunmasına xüsusi önəm verir.")
                
                Group {
                    Text("1. Toplanan Məlumatlar")
                        .font(.headline)
                    
                    Text("""
Biz aşağıdakı məlumatları toplaya bilərik:
• Ad və soyad
• Doğum tarixi
• Doğum saatı
• Doğum yeri
• Email ünvanı
• Ödəniş məlumatları (ödəniş provayderi vasitəsilə)
• Texniki məlumatlar (IP ünvanı, cihaz tipi, əməliyyat sistemi və s.)
""")
                }
                
                Group {
                    Text("2. Məlumatların İstifadə Məqsədi")
                        .font(.headline)
                    
                    Text("""
Toplanan məlumatlar:
• Fərdi astrologiya analizinin hazırlanması
• Hesabın idarə olunması
• Ödənişlərin emalı
• Texniki problemlərin həlli
• Marketinq bildirişləri (istifadəçinin razılığı ilə)
""")
                }
                
                Group {
                    Text("3. Məlumatların Saxlanılması və Qorunması")
                        .font(.headline)
                    
                    Text("Şəxsi məlumatlar təhlükəsiz serverlərdə saxlanılır və üçüncü şəxslərə satılmır. Qanunvericiliyin tələb etdiyi hallar istisna olmaqla məlumatlar paylaşılmır.")
                }
                
                Group {
                    Text("4. Üçüncü Tərəflər")
                        .font(.headline)
                    
                    Text("Ödəniş və analitika xidmətləri üçün üçüncü tərəf provayderlərdən istifadə oluna bilər. Bu tərəflər yalnız zəruri məlumatlara çıxış əldə edir.")
                }
                
                Group {
                    Text("5. İstifadəçi Hüquqları")
                        .font(.headline)
                    
                    Text("""
İstifadəçi:
• Öz məlumatlarına çıxış tələb edə bilər
• Məlumatların düzəldilməsini istəyə bilər
• Hesabının və məlumatlarının silinməsini tələb edə bilər
""")
                    
                    Text("Sorğular üçün: auraly@gmail.com")
                        .foregroundColor(.blue)
                }
                
                Group {
                    Text("6. Kukilər və Analitika")
                        .font(.headline)
                    
                    Text("Tətbiq istifadə təcrübəsini yaxşılaşdırmaq üçün kukilər və analitik alətlərdən istifadə edə bilər.")
                }
                
                Group {
                    Text("7. Dəyişikliklər")
                        .font(.headline)
                    
                    Text("Məxfilik Siyasəti zaman-zaman yenilənə bilər. Yenilənmiş versiya tətbiqdə yerləşdirildiyi andan qüvvəyə minir.")
                }
            }
            .padding()
        }
        .navigationTitle("Məxfilik Siyasəti")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PrivacyView()
}
