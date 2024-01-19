package com.example.demo.repository;

import com.example.demo.model.entity.Post;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface PostRepository extends CrudRepository<Post,Integer> {

    @Query("SELECT p FROM Post p WHERE p.user.id = :user_id AND (:post_id = -1 OR p.id != :post_id)")
    List<Post> findAllByUserID(@Param("user_id") int user_id,@Param("post_id") int post_id);

    @Query("SELECT p FROM Post p order by  p.date desc")
    List<Post> findAllByPage(Pageable pageable);
}
