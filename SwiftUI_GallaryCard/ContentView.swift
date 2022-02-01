//
//  ContentView.swift
//  SwiftUI_GallaryCard
//
//  Created by Chuljin Hwang on 2022/02/01.
//

import SwiftUI

struct GalleryItem: Hashable {

    var color: Color
    var title : String
}

struct ContentView: View {
    var item = [
        GalleryItem(color: .red, title: "title1"),
        GalleryItem(color: .blue, title: "title2"),
        GalleryItem(color: .gray, title: "title3"),
        GalleryItem(color: .green, title: "title4"),
        GalleryItem(color: .pink, title: "title5"),
        GalleryItem(color: .red, title: "title6"),
        GalleryItem(color: .gray, title: "title7")
        
    ]
    var itemsize = CGSize(width:100, height: 100)
    var scrollviewsize = CGSize(width: 414, height: 300)
    var leadingPadding: CGFloat{
        return scrollviewsize.width / 2 - itemsize.width / 2
    }
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing:50){
                ForEach(item, id:\.self){ i in
                    GeometryReader { geometry in
                        ZStack {
                            Rectangle()
                                .frame(width: itemsize.width, height: itemsize.height)
                                 .foregroundColor(i.color)
                            //3d 이펙트를 주기 위해 설정
                            Text(i.title)
                        } .rotation3DEffect(.degrees(Double(geometry.frame(in: .global).minX - leadingPadding) / 2), axis: (x:0, y:-1, z:0))
//                             .rotation3DEffect(.degrees(30), axis: (x:0, y:1, z:0))
                        self.testfunc(geometry: geometry)

                    }.frame(width: itemsize.width, height: itemsize.height) //지오 밖에서 다시 잡아주면
                    //해당 오브젝트에 대한 크기 잡을 수 있어
                    //지오를 잡기 전에는 잘 잡히지만 지오 기준으로 잡히니까
                    //지오 밖에서 다시 크기를 잡아죠
                    
                }
            }.padding(.vertical, 50) //짤림 방지
                .padding(.leading, leadingPadding)
                .padding(.trailing, leadingPadding)
            
        }
        .frame(width: scrollviewsize.width, height: scrollviewsize.height)
       
      
    }
    
    func testfunc(geometry: GeometryProxy) -> some View{
        print(geometry.frame(in: .global).minX)
        //스크롤을 할때 X축이 변화 될껀데
        return Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
