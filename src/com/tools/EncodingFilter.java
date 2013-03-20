package com.tools;

import java.io.*;
import javax.servlet.*;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.util.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Timer;
public class EncodingFilter implements Filter {
	
	private SimpleDateFormat fmt=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	public static Timer timer = null; 
	private String charset=null;
	
	public void destroy() {
		
		
	}
	
	public void doFilter(ServletRequest request, 
	ServletResponse response,FilterChain chain) 
	throws IOException, ServletException {
		request.setCharacterEncoding(charset);
		chain.doFilter(request,response);
	}
	
	public void init(FilterConfig config) throws ServletException {
		this.charset=config.getInitParameter("charset");
		
		//timer = new java.util.Timer(true); 
		//↓↓10秒后执行，以后每小时执行一次(2011-01-18)
		//timer.schedule(new MyTask(), 1*10*1000, 60*60*1000);
		//pln("现在时间【"+fmt.format(new Date())+"】定时器【"+timer+"】已启动，10秒后执行，以后每小时执行一次");
		//↑↑10秒后执行，以后每小时执行一次(2011-01-18)

		
	}
	
	public String getCharset() {
		return charset;
	}
	public void setCharset(String charset) {
		this.charset = charset;
	}
	

	public void pln(Object obj){
		System.out.println(obj);
	}

}

