package com.spring.utils;

import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/**
 * 天气预报开发工具类
 * @author spring
 * @version 1.0.0
 */
public class WeatherUtil {
	/**
	 * 获取最近五天的天气预报
	 * @author spring
	 * @param cityCode 城市编号
	 * @return List<String> 天气集合
	 * @throws IOException 
	 * @throws SAXException 
	 */
	public static List<String> getWeather(int cityCode) throws IOException, SAXException{
		//天气预报服务器主机
		final String SERVICES_HOST = "webservice.webxml.com.cn";
		//webservice接口地址
		final String WEATHEAR_SERVICES_URL = "http://webservice.webxml.com.cn/Webservices/WeatherWS.asmx/";
		//获取天气的参与接口
		final String WEATHER_QUERY_URL = WEATHEAR_SERVICES_URL + "getWeather?theUserID=&theCityCode=";
		
		
		
		
		//定义一个集合，装载添加天气预报数据
		List<String> weatherList = new ArrayList<String>();
		
		//获取XML文档对象
		Document document;
		//获取XML解析工厂
		DocumentBuilderFactory documentBF = DocumentBuilderFactory.newInstance();
		//设定命名空间
		documentBF.setNamespaceAware(true);
		
		InputStream inputStream = new InputStream() {
			
			@Override
			public int read() throws IOException {
				// TODO Auto-generated method stub
				return 0;
			}
		};
		try {
			//初始化XML工厂
			DocumentBuilder db = documentBF.newDocumentBuilder();
			//获取天气接口返回数据，建立网络连接
			URL urlObj = new URL(WEATHER_QUERY_URL + cityCode);
			//打开网络连接
			URLConnection urlCon = urlObj.openConnection();
			//通过地址访问天气主机
			urlCon.setRequestProperty("Host", SERVICES_HOST);
			//开始连接
			urlCon.connect();
			inputStream = urlCon.getInputStream();
			//开始解析
			document = db.parse(inputStream);
			//解析String节点
			NodeList nl = document.getElementsByTagName("string");
			
			for(int i=0;i<nl.getLength();i++){
				//获取第一个String节点
				Node node = nl.item(i);
				//获取文本节点
				String weather = node.getFirstChild().getNodeValue();
				weatherList.add(weather);
			}
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		} finally{
			inputStream.close();
		}
		return weatherList ;
	}
		
	public static void main(String[] args) throws IOException, SAXException {
		System.out.println("nihao");
		WeatherUtil util = new WeatherUtil();
		List<String> strings = util.getWeather(495);
		System.out.println(strings);
	}

}
