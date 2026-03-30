package com.example.DoAn.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.DoAn.domain.Contact;
import com.example.DoAn.domain.Order;
import com.example.DoAn.repository.ContactRepository;

@Service
public class ContactService {
    private final ContactRepository contactRepository;

    public ContactService(ContactRepository contactRepository) {
        this.contactRepository = contactRepository;
    }

    public void saveContact(Contact contact) {
        contactRepository.save(contact);
    }

    public Page<Contact> fetchAllOrders(Pageable page) {
        return this.contactRepository.findAll(page);
    }

    public Contact fetchContactById(long id) {
        return this.contactRepository.findById(id);
    }

    public void deleteContactById(long id) {
        this.contactRepository.deleteById(id);
    }
}
