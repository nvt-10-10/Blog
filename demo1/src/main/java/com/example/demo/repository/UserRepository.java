package com.example.demo.repository;
import com.example.demo.model.entity.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface UserRepository extends CrudRepository<User,Integer> {

    @Query("select u from User u where u.email = :email")
    User getUserByEmail(@Param("email") String email);


}
