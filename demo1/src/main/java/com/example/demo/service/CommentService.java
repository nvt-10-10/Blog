package com.example.demo.service;

import com.example.demo.model.entity.Comment;
import com.example.demo.model.entity.Like;
import com.example.demo.repository.CommentRepository;
import com.example.demo.repository.LikeRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
@RequiredArgsConstructor
@Transactional
public class CommentService implements GenericInterface<Comment> {

    private final CommentRepository repo;
    private final LikeRepository likeRepository;

    @Override
    public List<Comment> findAll() {
        return (List<Comment>) repo.findAll();
    }

    @Override
    public Optional<Comment> findById(int id) {
        return repo.findById(id);
    }
    @Override
    public Comment save(Comment comment) {
        if ( comment.getPath()!=null && comment.getPath().length()>0){
            String[] pathSegments = comment.getPath().split("_");
            System.out.println(pathSegments.toString());
            for (int i = 0; i < pathSegments.length; i++) {
                int commentId = Integer.parseInt(pathSegments[i]);
                System.out.println(commentId);
                repo.incrementCommentCount(commentId);
            }
        }
        return repo.save(comment);
    }

    public Comment update(Comment comment){
        return repo.save(comment);
    }
    @Override
    public void saveAll(List<Comment> comments) {
        repo.saveAll(comments);
    }

    @Override
    public void deleteById(int id) {
        repo.deleteById(id);
    }


    public List<Comment> findAllCommentByPostID(int post_id,Pageable pageable){
        return  repo.findAllRootComments(post_id,pageable);
    }

    public List<Map<String,Object>> findAllCommentByPostIDAndUser(int post_id,int user_id,Pageable pageable){
        List<Map<String,Object>> results = new ArrayList<>();
        List<Comment> comments = repo.findAllRootComments(post_id,pageable);
        for (Comment comment: comments
        ) {
            Like like =likeRepository.isLikeComment(comment.getId(),user_id);
            System.out.println("comment id"+comment.getId()+"\t user"+user_id);
            Map<String,Object> map = new HashMap<>();
            if (like!=null  ){
                map.put("isLike",true);
                map.put("like_id",like.getId());
            } else {
                map.put("isLike",false);
                map.put("like_id",-1);
            }
            map.put("comment",comment);

            results.add(map);
        }
        return  results;
    }

    public List<Map<String,Object>> findAllCommentByCommentPath(int post_id,String path,int user_id,Pageable pageable){
        List<Map<String,Object>> results = new ArrayList<>();
        List<Comment> comments =repo.findAllCommentPath(post_id,path,pageable);
        for (Comment comment: comments
        ) {
            Like like =likeRepository.isLikeComment(comment.getId(),user_id);
            System.out.println("comment id"+comment.getId()+"\t user"+user_id);
            Map<String,Object> map = new HashMap<>();
            if (like!=null  ){
                map.put("isLike",true);
                map.put("like_id",like.getId());
            } else {
                map.put("isLike",false);
                map.put("like_id",-1);
            }
            map.put("comment",comment);

            results.add(map);
        }
        return  results;
    }


    public int  deleteByPath(String path){
        return repo.deleteByPath(path);
    }
}
