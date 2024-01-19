package com.example.demo.repository;

import com.example.demo.model.entity.Like;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface LikeRepository extends CrudRepository<Like,Integer> {
    @Query("select l from Like  l where l.type_id=:post_id and l.user.id =:user_id and l.type='post'")
    Like isLikePost(@Param("post_id") int post_id,@Param("user_id") int user_id);

    @Query("select l from Like  l where l.type_id=:comment_id and l.user.id =:user_id and l.type='comment'")
    Like isLikeComment(@Param("comment_id") int comment_id,@Param("user_id") int user_id);
}
