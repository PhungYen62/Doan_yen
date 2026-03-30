package com.example.DoAn.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.DoAn.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User manh);

    boolean existsByEmailAndIsDeletedFalse(String email);

    User findByEmailAndIsDeletedFalse(String email);

    User findByIdAndIsDeletedFalse(long id);

    Page<User> findByIsDeletedFalse(Pageable page);

    // void deleteById(long id);

    @Query("SELECT COUNT(u) FROM User u WHERE u.role.id = 2 AND u.isDeleted = false")
    long countActiveCustomers();

}
