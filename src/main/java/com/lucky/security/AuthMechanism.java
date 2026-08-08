package com.thikka.security;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.security.enterprise.AuthenticationException;
import jakarta.security.enterprise.AuthenticationStatus;
import jakarta.security.enterprise.authentication.mechanism.http.AuthenticationParameters;
import jakarta.security.enterprise.authentication.mechanism.http.AutoApplySession;
import jakarta.security.enterprise.authentication.mechanism.http.HttpAuthenticationMechanism;
import jakarta.security.enterprise.authentication.mechanism.http.HttpMessageContext;
import jakarta.security.enterprise.credential.UsernamePasswordCredential;
import jakarta.security.enterprise.identitystore.CredentialValidationResult;
import jakarta.security.enterprise.identitystore.IdentityStore;
import jakarta.security.enterprise.identitystore.IdentityStoreHandler;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/// Ensures only one instance of this authentication mechanism is created for the entire application, saving memory and resources.
@ApplicationScoped

///Automatically ties the user's authentication state to their HTTP session. Without this, the user would forget their login status on every new request.
@AutoApplySession
public class AuthMechanism implements HttpAuthenticationMechanism {


     /// Injects the handler that communicates with your IdentityStore (which typically connects to your database). This abstracts away the direct database querying.
    @Inject
    private IdentityStoreHandler identityStoreHandler;


     /// This method runs on every HTTP request to determine if the user is allowed to proceed.
    @Override
    public AuthenticationStatus validateRequest(HttpServletRequest request,
                                                HttpServletResponse response,
                                                HttpMessageContext context) throws AuthenticationException {

        System.out.println("AuthMechanism: validateRequest");

        // 1. LOGIN ATTEMPT CHECK: Grab any authentication parameters passed in the request.
        AuthenticationParameters authParameters = context.getAuthParameters();

        // If a credential exists, the user is actively trying to log in right now.
        if (authParameters.getCredential() != null) {
            System.out.println("If executed with credentials");
            // Validate the provided credentials against your IdentityStore.
            CredentialValidationResult result = identityStoreHandler.validate(authParameters.getCredential());

            if (result.getStatus() == CredentialValidationResult.Status.VALID) {
                // The credentials match! Tell the server to log the user in and assign their roles.
                return context.notifyContainerAboutLogin(result);

            } else {
                // The credentials failed. SEND_FAILURE tells the server to halt the request.
                return AuthenticationStatus.SEND_FAILURE;
            }


        }


        // 2. PROTECTED RESOURCE CHECK: If the user is NOT logging in right now,
        // check if the page they are trying to access requires authentication.

        if (context.isProtected()) {
            // The page is protected. Redirect them to the login page.
            context.redirect(request.getContextPath() + "/login.jsp");

            // SEND_CONTINUE tells the container to pause the current request,
            // wait for the user to authenticate via the redirect, and then resume.
            return AuthenticationStatus.SEND_CONTINUE;
        }

        // 3. PUBLIC RESOURCE: If the page is not protected (e.g., a public home page),
        // do nothing and let the request go through normally.
        return context.doNothing();

    }
}