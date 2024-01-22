package com.example.demo.repository;

import com.example.demo.model.entity.Comment;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CommentRepository extends CrudRepository<Comment,Integer> {

    @Query("SELECT c " +
            "FROM Comment c WHERE c.post.id = :post_id AND c.path = CAST(c.id AS STRING) order by  c.date desc")
    List<Comment> findAllRootComments(@Param("post_id") int post_id, Pageable pageable);

    @Query("SELECT c as comment, " +
            "CASE WHEN EXISTS (SELECT 1 FROM Like l WHERE l.type_id = c.id AND l.user.id = :user_id) " +
            "THEN (SELECT l.id FROM Like l WHERE l.type_id = c.id AND l.user.id = :user_id) " +
            "ELSE -1 END AS likeId " +
            "FROM Comment c WHERE c.post.id = :post_id AND c.path = CAST(c.id AS STRING) order by  c.date desc")
    List<Object[]> findAllRootComments(@Param("post_id") int post_id,@Param("user_id") int user_id, Pageable pageable);




    @Query("SELECT c as comment, " +
            "CASE WHEN EXISTS (SELECT 1 FROM Like l WHERE l.type_id = c.id AND l.user.id = :user_id) " +
            "THEN (SELECT l.id FROM Like l WHERE l.type_id = c.id AND l.user.id = :user_id) " +
            "ELSE -1 END AS likeId " +
            "FROM Comment c " +
            "WHERE c.post.id = :post_id AND c.path = concat(:path,'_',c.id) order by  c.date desc ")
    List<Object[]> findAllCommentPath(@Param("post_id") int post_id,@Param("path") String path,@Param("user_id") int user_id, Pageable pageable);
    @Modifying
    @Query("update  Comment  c set c.count_comment = c.count_comment+1 where  c.id=:comment_id")
    void incrementCommentCount(@Param("comment_id") int id);
    @Modifying
    @Query("DELETE FROM Comment c WHERE c.path LIKE :path%")
    int  deleteByPath(@Param("path") String path);


    @Query("SELECT c as comment, " +
            "CASE WHEN EXISTS (SELECT 1 FROM Like l WHERE l.type_id = c.id AND l.user.id = :user_id) " +
            "THEN (SELECT l.id FROM Like l WHERE l.type_id = c.id AND l.user.id = :user_id) " +
            "ELSE -1 END AS likeId " +
            "FROM Comment c " +
            "WHERE c.post.id = :post_id")
    List<Object[]> findByCommentByPostAndUser(@Param("post_id") int post_id,@Param("user_id") int user_id,Pageable pageable);

}
