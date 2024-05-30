package DOANTT.configurer;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;



@Configuration
public class McvConfigurer implements WebMvcConfigurer {
	private static final String FOLDER_UPLOAD = null;
	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		bean.setViewClass(JstlView.class);
		bean.setPrefix("/WEB-INF/views/");
		bean.setSuffix(".jsp");
		return bean;
	}
	//Dang ky thu muc chua resource file
	@Override
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {
		// TODO Auto-generated method stub
		registry.addResourceHandler("/user/**").addResourceLocations("classpath:/user/");
		registry.addResourceHandler("/admin/**").addResourceLocations("classpath:/admin/");
		registry.addResourceHandler("/formdemo/**").addResourceLocations("classpath:/formdemo/");
		//WebMvcConfigurer.super.addResourceHandlers(registry);
		registry.addResourceHandler("/FileUpload/**").addResourceLocations("classpath:/FileUpload/");
	}

}
