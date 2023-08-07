package com.example.demo.oauth2;

import org.springframework.boot.autoconfigure.security.oauth2.client.OAuth2ClientProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClientManager;
import org.springframework.security.oauth2.client.registration.ClientRegistration;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.security.oauth2.client.registration.InMemoryClientRegistrationRepository;
import org.springframework.security.oauth2.client.registration.ClientRegistration.Builder;
import org.springframework.security.oauth2.client.web.DefaultOAuth2AuthorizedClientManager;
import org.springframework.security.oauth2.client.web.OAuth2AuthorizedClientRepository;
import org.springframework.security.oauth2.client.web.HttpSessionOAuth2AuthorizedClientRepository;
import org.springframework.security.oauth2.core.AuthorizationGrantType;

import java.util.ArrayList;
import java.util.List;

@Configuration
@EnableWebSecurity
@EnableConfigurationProperties(OAuth2ClientProperties.class)
public class OAuth2Configuration {
    private final OAuth2ClientProperties oAuth2ClientProperties;

    public OAuth2Configuration(OAuth2ClientProperties oAuth2ClientProperties) {
        this.oAuth2ClientProperties = oAuth2ClientProperties;
    }

    @Bean
    public ClientRegistrationRepository clientRegistrationRepository() {
        return new InMemoryClientRegistrationRepository(getClientRegistrations());
    }

    private List<ClientRegistration> getClientRegistrations() {
        List<ClientRegistration> clientRegistrations = new ArrayList<>();
        oAuth2ClientProperties.getRegistration().forEach((key, registrationProps) -> {
            ClientRegistration registration = ClientRegistration
                    .withRegistrationId(key)
                    .clientId(registrationProps.getClientId())
                    .clientSecret(registrationProps.getClientSecret())
                    .authorizationGrantType(AuthorizationGrantType.AUTHORIZATION_CODE)
                    .redirectUri(registrationProps.getRedirectUri())
                    .authorizationUri("https://accounts.google.com/o/oauth2/v2/auth") // Access the authorization-uri property directly
                    .tokenUri("https://www.googleapis.com/oauth2/v3/token") // Add the tokenUri property
                    // Add other properties as needed based on your configuration
                    .build();
            clientRegistrations.add(registration);
        });
        return clientRegistrations;
    }

    @Bean
    public OAuth2AuthorizedClientRepository authorizedClientRepository() {
        return new HttpSessionOAuth2AuthorizedClientRepository();
    }

    @Bean
    public OAuth2AuthorizedClientManager authorizedClientManager(ClientRegistrationRepository clientRegistrationRepository, OAuth2AuthorizedClientRepository authorizedClientRepository) {
        OAuth2AuthorizedClientManager authorizedClientManager = new DefaultOAuth2AuthorizedClientManager(clientRegistrationRepository, authorizedClientRepository);
        return authorizedClientManager;
    }
}
