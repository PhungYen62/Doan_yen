package com.example.DoAn.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.DoAn.domain.Contact;

@Repository
public interface ContactRepository extends JpaRepository<Contact, Long> {
    // Custom query methods can be defined here if needed
    Page<Contact> findAll(Pageable pageable);

    Contact findById(long id);
}
