package com.example.demo.service;

import com.example.demo.model.entity.User;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.example.demo.repository.UserRepository;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Transactional
@Slf4j
public class UserService
        implements GenericInterface<User>
{
    private final UserRepository repo;
    private final PasswordEncoder passwordEncoder;

    @Override
    public List<User> findAll() {
        return (List<User>) repo.findAll();
    }
    @Override
    public Optional<User> findById(int id) {
        return  repo.findById(id);
    }
    @Transactional(rollbackOn = Exception.class)
    public User save(User user){
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        User u = null;
        try {
            u =repo.save(user);
        } catch (Exception e){
            System.out.println(e.getMessage());
        }
        return u;
    }

    public void saveAll(List<User> users){
        repo.saveAll(users);
    }
    @Override
    public void deleteById(int id) {
        repo.deleteById(id);
    }

    public User login(String email, String pass) {
        User user = repo.getUserByEmail(email).get();
        if (user != null && passwordEncoder.matches(pass, user.getPassword())) {
            return user;
        }
        return null;
    }
}
