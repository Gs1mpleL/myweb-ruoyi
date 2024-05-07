package com.ruoyi.common.core.utils;

import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.conn.ssl.NoopHostnameVerifier;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.ssl.SSLContextBuilder;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.*;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import javax.annotation.Resource;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLContext;
import java.net.URI;
import java.security.KeyManagementException;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

@Component
@Slf4j
public class RequestsUtils {
    @Resource
    private RestTemplate restTemplate;

    public JSONObject get(String url, Map<String, String> map, Map<String, String> headers) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Content-Type", "application/json;charset=UTF-8");
        if (headers != null) {
            headers.forEach(httpHeaders::add);
        }
        HttpEntity<String> requestEntity = new HttpEntity<>(null, httpHeaders);
        url = addParamToUrl(url, map);
        log.warn("发送请求->[{}],参数->[{}],Header->[{}]", url, map, httpHeaders);
        ResponseEntity<JSONObject> response = restTemplate.exchange(url, HttpMethod.GET, requestEntity, JSONObject.class);
        log.warn("结果->[{}]", response.getBody());
        return response.getBody();
    }
    public JSONObject getAndGetHeader(String url, Map<String, String> map, Map<String, String> headers) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Content-Type", "application/json;charset=UTF-8");
        if (headers != null) {
            headers.forEach(httpHeaders::add);
        }
        HttpEntity<String> requestEntity = new HttpEntity<>(null, httpHeaders);
        url = addParamToUrl(url, map);
        log.warn("发送请求->[{}],参数->[{}],Header->[{}]", url, map, httpHeaders);
        ResponseEntity<JSONObject> response = restTemplate.exchange(url, HttpMethod.GET, requestEntity, JSONObject.class);
        log.warn("结果->[{}]", response.getBody());
        JSONObject bodyWithHeader = response.getBody();
        if (bodyWithHeader != null) {
            bodyWithHeader.putAll(response.getHeaders());
        }
        return bodyWithHeader;
    }

    public JSONObject post(String url, Map<String, String> map, Map<String, String> headers) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Content-Type", "application/json;charset=UTF-8");
        if (headers != null) {
            headers.forEach(httpHeaders::add);
        }
        HttpEntity<String> requestEntity = new HttpEntity<>(JSONObject.toJSONString(map), httpHeaders);
        log.warn("发送请求->[{}],参数->[{}],Header->[{}]", url, map, httpHeaders);
        ResponseEntity<JSONObject> response = restTemplate.postForEntity(url, requestEntity, JSONObject.class);
        log.warn("结果->[{}]", response.getBody());
        return response.getBody();
    }
    public JSONObject postWithHeader(String url, Map<String, String> map, Map<String, String> headers) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Content-Type", "application/json;charset=UTF-8");
        if (headers != null) {
            headers.forEach(httpHeaders::add);
        }
        HttpEntity<String> requestEntity = new HttpEntity<>(JSONObject.toJSONString(map), httpHeaders);
        log.warn("发送请求->[{}],参数->[{}],Header->[{}]", url, map, httpHeaders);
        ResponseEntity<JSONObject> response = restTemplate.postForEntity(url, requestEntity, JSONObject.class);
        JSONObject bodyWithHeader = response.getBody();
        if (bodyWithHeader != null) {
            bodyWithHeader.putAll(response.getHeaders());
        }
        return bodyWithHeader;
    }
    public static CloseableHttpClient createSSLClientDefault() {
        try {
            // 信任所有
            SSLContext sslContext = new SSLContextBuilder().loadTrustMaterial(null, (chain, authType) -> true).build();
            HostnameVerifier hostnameVerifier = NoopHostnameVerifier.INSTANCE;
            SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(sslContext, hostnameVerifier);
            return HttpClients.custom().setSSLSocketFactory(sslsf).build();
        } catch (KeyManagementException | NoSuchAlgorithmException | KeyStoreException e) {
            log.error(e.getMessage());
        }
        return HttpClients.createDefault();

    }
    public String getForHtml(String url, Map<String, String> queryParams, Map<String, String> headers) {
        HttpClient client = createSSLClientDefault();
        HttpGet httpGet = new HttpGet(url);
        httpGet.addHeader("Cookie", headers.get("Cookie")); // 不知道缺哪个字段，索性全部使用
        HttpResponse resp;
        String respContent = null;
        try {
            resp = client.execute(httpGet);
            org.apache.http.HttpEntity entity = resp.getEntity();
            respContent = EntityUtils.toString(entity, "UTF-8");
            return respContent;
        } catch (Exception e) {
            log.error(e.getMessage());
            log.info("Bili Get请求错误 -- " + e);
            return respContent;
        }
    }

    /****************************************实现结束***************************************************************/

    public String addParamToUrl(String url, Map<String, String> params) {
        // 合并params到url上，如果存在的话
        if (params != null && !params.isEmpty()) {
            url += "?";
            StringBuilder urlBuilder = new StringBuilder(url);
            for (Map.Entry<String, String> entry : params.entrySet()) {
                urlBuilder.append(entry.getKey()).append("=").append(entry.getValue()).append("&");
            }
            url = urlBuilder.toString();
            url = url.substring(0, url.length() - 1); // 去掉最后的"&"
        }
        return url;
    }
}
