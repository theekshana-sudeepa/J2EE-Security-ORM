package com.thikka.service;

import com.thikka.entity.User;
import jakarta.enterprise.context.RequestScoped;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

import java.util.Set;

/**
 * SignupService - Handles new user registration.
 *
 * Persists a new User entity to the DB.
 * The password passed in here must ALREADY be hashed (done by the Signup servlet).
 */
@RequestScoped
public class SignupService {

    // Inject the EntityManager from the same persistence unit used by LoginService
    @PersistenceContext(unitName = "JIAT-Security")
    private EntityManager em;

    /**
     * Registers a new user in the database.
     *
     * @param email          the user's email (used as username for login)
     * @param name           the user's display name
     * @param hashedPassword the SHA-256 hash of the user's password
     */
    @Transactional
    public void register(String email, String name, String hashedPassword) {
        // Create a new User entity
        User user = new User();
        user.setEmail(email);
        user.setName(name);
        user.setPassword(hashedPassword); // Store the hash, never the plain password

        // Assign the default role "USER" to every new signup
        user.setRoles(Set.of("USER"));

        // Persist the user to the database via JPA/Hibernate
        em.persist(user);

        System.out.println("SignupService: New user registered → " + email);
    }

    /**
     * Check if an email already exists in the DB (prevents duplicate accounts).
     *
     * @param email the email to check
     * @return true if email already exists
     */
    public boolean emailExists(String email) {
        Long count = em.createQuery(
                "SELECT COUNT(u) FROM User u WHERE u.email = :email", Long.class)
                .setParameter("email", email)
                .getSingleResult();
        return count > 0;
    }
}
