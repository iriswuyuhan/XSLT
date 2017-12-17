import java.io.FileNotFoundException;
import java.io.FileOutputStream;

import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

public class XSLTTransform {

    /**
     * XML工具类
     * @author  huey2672
     * @version 1.0
     * @created 2014-8-22
     */
    public static class XmlUtil {

        /**
         * 使用XSLT转换XML文件
         * @param srcXml    源XML文件路径
         * @param dstXml    目标XML文件路径
         * @param xslt      XSLT文件路径
         */
        public static void transformXmlByXslt(String srcXml, String dstXml, String xslt) {

            // 获取转换器工厂
            TransformerFactory tf = TransformerFactory.newInstance();

            try {
                // 获取转换器对象实例
                Transformer transformer = tf.newTransformer(new StreamSource(xslt));
                // 进行转换
                transformer.transform(new StreamSource(srcXml),
                        new StreamResult(new FileOutputStream(dstXml)));
            } catch (TransformerConfigurationException e) {
                e.printStackTrace();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (TransformerException e) {
                e.printStackTrace();
            }
        }


        public static void main(String[] args) {
            String srcXml = "./input/studentListTest.xml";
            String dstXml = "./output/scorelist.xml";
            String xslt = "./xslt/stuToScoNew.xsl";

            transformXmlByXslt(srcXml, dstXml, xslt);
        }
    }
}
