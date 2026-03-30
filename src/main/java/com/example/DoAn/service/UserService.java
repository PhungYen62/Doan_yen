package com.example.DoAn.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.DoAn.domain.Role;
import com.example.DoAn.domain.User;
import com.example.DoAn.domain.dto.RegisterDTO;
import com.example.DoAn.repository.RoleRepository;
import com.example.DoAn.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public User handleSaveUser(User user) {
        // user.setIsDeleted(true);
        User manh = this.userRepository.save(user);
        return manh;
    }

    public User registerDTOtoUser(RegisterDTO registerDTO) {
        User user = new User();
        user.setFullName(registerDTO.getFirstName() + " " + registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());
        user.setPassword(registerDTO.getPassword());
        return user;
    }

    public Page<User> getAllUsers(Pageable page) {
        return this.userRepository.findByIsDeletedFalse(page);
    }

    public User getUserById(long id) {
        return this.userRepository.findByIdAndIsDeletedFalse(id);
    }

    public boolean checkEmailExist(String email) {
        return this.userRepository.existsByEmailAndIsDeletedFalse(email);
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    public User getUserByEmail(String email) {
        return this.userRepository.findByEmailAndIsDeletedFalse(email);
    }

    public void deleteUser(long id) {
        User user = userRepository.findByIdAndIsDeletedFalse(id);
        if (user == null) {
            throw new IllegalArgumentException("User not found with id: " + id);
        }

        user.setIsDeleted(true);
        userRepository.save(user);
    }

    // Tổng số khach hàng
    public long countCustomers() {
        return this.userRepository.countActiveCustomers();
    }
}
