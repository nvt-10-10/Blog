package com.example.demo.controller;

import com.example.demo.model.entity.Comment;
import com.example.demo.model.entity.Like;
import com.example.demo.model.entity.Post;
import com.example.demo.model.entity.User;
import com.example.demo.service.CommentService;
import com.example.demo.service.LikeService;
import com.example.demo.service.PostService;
import com.example.demo.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/likes")
@RequiredArgsConstructor
@CrossOrigin(origins = "http://localhost:8080")
public class LikeController {
    private final LikeService likeService;
    private final PostService postService;
    private final UserService userService;
    private final CommentService commentService;

    @PostMapping("/addLikePost")
    public ResponseEntity<Like> createLikePost(@RequestBody Map<String,String> params){
        String user_id = params.get("user_id");
        String post_id = params.get("post_id");

        User user = userService.findById(Integer.parseInt(user_id)).get();

        Like like = new Like();
        like.setUser(user);
        like.setType_id(Integer.parseInt(post_id));
        like.setType("post");
        likeService.save(like);

        Post post = postService.findById(Integer.parseInt(post_id)).get();
        post.setCount_like(post.getCount_like()+1);
        postService.save(post);
        return new ResponseEntity<>(like, HttpStatus.CREATED);
    }

    @DeleteMapping("/deleteLikePost/{id}/post_id/{post_id}")
    public ResponseEntity<Void> delete(@PathVariable int id,@PathVariable int post_id) {
        Post post = postService.findById(post_id).get();
        post.setCount_like(post.getCount_like()-1);
        postService.save(post);
        likeService.deleteById(id);
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/addLikeComment")
    public ResponseEntity<Like> createLikeComment(@RequestBody Map<String,String> params){
        String user_id = params.get("user_id");
        String comment_id = params.get("comment_id");

        User user = userService.findById(Integer.parseInt(user_id)).get();

        Like like = new Like();
        like.setUser(user);
        like.setType_id(Integer.parseInt(comment_id));
        like.setType("comment");
        likeService.save(like);

        Comment comment =commentService.findById(Integer.parseInt(comment_id)).get();

        comment.setCount_like(comment.getCount_like()+1);
        commentService.update(comment);
        return new ResponseEntity<>(like, HttpStatus.CREATED);
    }

    @DeleteMapping("/deleteLikeComment/{like_id}/comment_id/{comment_id}")
    public ResponseEntity<Void> deleteLikeComment(@PathVariable int like_id,@PathVariable int comment_id) {
        Comment comment = commentService.findById(comment_id).get();
        comment.setCount_like(comment.getCount_like()-1);
        commentService.update(comment);
        System.out.println("Xoa");
        likeService.deleteById(like_id);

        System.out.println(like_id);
        System.out.println("Xoa");
        return ResponseEntity.noContent().build();
    }
}
