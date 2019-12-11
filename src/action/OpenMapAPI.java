/*
package action;

import java.util.HashMap;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.NodeList;

import com.sun.corba.se.impl.orbutil.graph.Node;
import com.sun.java.util.jar.pack.Attribute.Layout.Element;
import com.sun.xml.internal.txw2.Document;

public class OpenMapAPI{

    // tag값의 정보를 가져오는 메소드
   private static String getTagValue(String tag, Element eElement) {
       NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
       Node nValue = (Node) nlList.item(0);
       if(nValue == null) 
           return null;
       return nValue.getNodeValue();
   }

   public HashMap<String, String> ApiMap() {
      int page = 1;   // 페이지 초기값 
      HashMap<String, String> data=new HashMap<String, String>();

      
      try{
         while(true){
            // parsing할 url 지정(API 키 포함해서)
            String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=Z5I4mRj4oIixSBoaZEWlnzxR%2FrZ3DbUKfea2IZlaRAAyqLyKbzAkOD6SkCwm%2Bg1yanm7%2BBpYWIC57mBmBTp4BQ%3D%3D&contentTypeId=&areaCode=39&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo="+page;
            
            DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
            Document doc = dBuilder.parse(url);
            
            // root tag 
            doc.getDocumentElement().normalize();
            System.out.println("Root element :" + doc.getDocumentElement().getNodeName());
            
            // 파싱할 tag
            NodeList nList = doc.getElementsByTagName("item");
            //System.out.println("파싱할 리스트 수 : "+ nList.getLength());
            
            for(int temp = 0; temp < nList.getLength(); temp++){
               Node nNode = nList.item(temp);
               if(nNode.getNodeType() == Node.ELEMENT_NODE){
                  
                  Element eElement = (Element) nNode;

                  String w1=getTagValue("mapx", eElement);
                  String w2=getTagValue("mapy", eElement);
                  String w3=getTagValue("title", eElement);   
                  System.out.println("위도"+w1);
                  System.out.println("경도"+w2);
                  System.out.println("타이틀: " + w3);
                  
                  
               }   // for end
            }   // if end
            
            page += 1;
            //System.out.println("page number : "+page);
            if(page > 86){   
               break;
            }
         }   // while end
         
      } catch (Exception e){   
         e.printStackTrace();
      }   // try~catch end
      return data;
   }   // main end
}   // class end

*/