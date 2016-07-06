package com.hzy.sportsman.controller;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

public class DefaultWebApplicationInitializer implements WebApplicationInitializer {
	static {
		System.out.println("---");
	}
	{
		System.out.println("----");
	}
	public void onStartup(ServletContext appContext) throws ServletException {
		System.out.println("======");
		AnnotationConfigWebApplicationContext webCxt = new AnnotationConfigWebApplicationContext();
		webCxt.register(DefaultAppConfig.class);
		appContext.addListener(new ContextLoaderListener(webCxt));
		ServletRegistration.Dynamic dispatcher = appContext.addServlet("dispatcher", new DispatcherServlet(webCxt));
		dispatcher.setLoadOnStartup(1);
		dispatcher.addMapping("/");
	}

}
