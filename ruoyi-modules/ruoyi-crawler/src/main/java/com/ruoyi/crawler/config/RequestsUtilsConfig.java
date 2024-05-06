package com.ruoyi.crawler.config;

import com.ruoyi.common.core.utils.RequestsUtils;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.ClientHttpRequestFactory;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.web.client.RestTemplate;

import java.nio.charset.StandardCharsets;
import java.util.List;

@Configuration
public class RequestsUtilsConfig {
    @Bean
    public RequestsUtils getRequestsUtils() {
        return new RequestsUtils();
    }

    @Bean
    public RestTemplate restTemplate(ClientHttpRequestFactory factory) {
        RestTemplate restTemplate = new RestTemplate(factory);
        List<HttpMessageConverter<?>> converterList = restTemplate.getMessageConverters();
        int converterIndex = -1;
        for (int i = 0; i < converterList.size(); i++) {
            if (converterList.get(i) instanceof StringHttpMessageConverter) {
                StringHttpMessageConverter stringHttpMessageConverter = (StringHttpMessageConverter) converterList.get(i);
                stringHttpMessageConverter.setDefaultCharset(StandardCharsets.UTF_8);
            }
            if (converterList.get(i).getClass() == StringHttpMessageConverter.class) {
                converterIndex = i;
                break;
            }
        }
        if (converterIndex != -1) {
            restTemplate.getMessageConverters().set(converterIndex, new StringHttpMessageConverter(StandardCharsets.UTF_8));
        }
        return restTemplate;
    }

    @Bean
    public ClientHttpRequestFactory simpleClientHttpRequestFactory() {
        SimpleClientHttpRequestFactory factory = new SimpleClientHttpRequestFactory();
        int timeoutms = 5 * 60 * 1000;
        factory.setReadTimeout(timeoutms);//ms
        factory.setConnectTimeout(timeoutms);//ms
        return factory;
    }
}
