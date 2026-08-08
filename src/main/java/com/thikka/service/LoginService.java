package com.thikka.service;

import com.thikka.entity.User;
import com.thikka.util.PasswordUtil;
import jakarta.enterprise.context.RequestScoped;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.PersistenceContext;

import java.util.Collections;
import java.util.Optional;
import java.util.Set;


@RequestScoped
public class LoginService {

    @PersistenceContext(unitName = "JIAT-Security")
    private EntityManager em;

    public Optional<User> findByEmail(String email) {
        try {
            return Optional.of(em.createNamedQuery("User.findByEmail", User.class)
                    .setParameter("email", email)
                    .getSingleResult());

        } catch (NoResultException e) {
            return Optional.empty();
        }
    }

    /**
     * Validates login credentials.
     *
     * The password entered by the user is hashed using SHA-256
     * and then compared against the hashed password stored in the DB.
     *
     * Flow:
     *   User types "12345"
     *   → PasswordUtil.hash("12345") → "5994471a..."
     *   → Compare with stored hash in DB → MATCH ✓
     */
    public boolean validate(String email, String password) {
        // Hash the entered password before comparing with the stored hash
        String hashedPassword = PasswordUtil.hash(password);

        return findByEmail(email)
                .map(user -> user.getPassword().equals(hashedPassword))
                .orElse(false);
    }

    public Set<String> getRoles(String email) {
        return findByEmail(email)
                .map(User::getRoles)
                .orElse(Collections.emptySet());
    }
}
