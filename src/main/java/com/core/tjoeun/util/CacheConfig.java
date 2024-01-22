package com.core.tjoeun.util;

import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.concurrent.ConcurrentMapCacheManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@EnableCaching
public class CacheConfig {
	
	@Bean
	public CacheManager cacheManager() {
		
		return new ConcurrentMapCacheManager(
											"bgmList"
											,"profile"
											,"userInfo"
											,"homeTitle"
											,"minimi"
											,"background"
											,"skin"
											,"menu"
											,"userName"
											,"currentContent");
		
	}
	
}
