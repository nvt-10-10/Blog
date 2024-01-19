package com.example.demo.controller;

import com.example.demo.model.entity.User;
import com.example.demo.service.UserService;
import com.fasterxml.jackson.annotation.JsonView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/api/users")
@CrossOrigin(origins = "http://localhost:8080")
public class UserController {
    private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping
    public ResponseEntity<List<User>> getAllUsers() {
        List<User> users = userService.findAll();
        return new ResponseEntity<>(users, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    @JsonView(User.fulldata.class)
    public ResponseEntity<User> getUserById(@PathVariable int id) {
        Optional<User> user = userService.findById(id);
        return user.map(value -> new ResponseEntity<>(value, HttpStatus.OK))
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }
    @PostMapping("/create")
    @JsonView(User.fulldata.class)
    public ResponseEntity<String> createUser(@RequestBody User user) {
        try {
            userService.save(user);
            return ResponseEntity.ok("User created successfully");
        } catch (DataIntegrityViolationException e) {
            // Handle unique constraint violation
            return ResponseEntity.status(HttpStatus.CONFLICT).body("Email address already exists");
        } catch (Exception e) {
            // Handle other exceptions
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error creating user");
        }
    }

    @PostMapping("/batch")
    @JsonView(User.fulldata.class)
    public ResponseEntity<List<User>> createUsers(@RequestBody List<User> users) {
        userService.saveAll(users);
        return new ResponseEntity<>(users, HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    @JsonView(User.fulldata.class)
    public ResponseEntity<User> updateUser(@PathVariable int id, @RequestBody User updatedUser) {
        Optional<User> existingUser = userService.findById(id);

        if (existingUser.isPresent()) {
            updatedUser.setId(existingUser.get().getId());
           userService.save(updatedUser);

            return new ResponseEntity<>(updatedUser, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);

        }
    }

    @DeleteMapping("/{id}")
    @JsonView(User.fulldata.class)
    public ResponseEntity<Void> deleteUser(@PathVariable int id) {
        Optional<User> user = userService.findById(id);
        if (user.isPresent()) {
            userService.deleteById(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
    @PostMapping("/login")
    @JsonView(User.baseJson.class)
    public ResponseEntity<User> submitForm(
            @RequestBody  Map<String, String> params) {
        String email = params.get("email");
        String password = params.get("password");
        System.out.println("size"+ params.size());
        System.out.println(email+"\t"+password);
        User user = userService.login(email, password);
        if (user!=null) {
            return new ResponseEntity<>(user, HttpStatus.OK);
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
        }
    }
}
