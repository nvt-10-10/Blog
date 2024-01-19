package com.example.demo.controller;

import com.example.demo.model.entity.Comment;
import com.example.demo.model.entity.Post;
import com.example.demo.model.entity.User;
import com.example.demo.service.CommentService;
import com.example.demo.service.PostService;
import com.example.demo.service.UserService;
import com.fasterxml.jackson.annotation.JsonView;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/comments")
@RequiredArgsConstructor
@CrossOrigin(origins = "http://localhost:8080")

public class CommentController {

    private final CommentService commentService;
    private final UserService userService;
    private final PostService postService;

    @GetMapping
    @JsonView(Comment.comment.class)
    public ResponseEntity<List<Comment>> getAllComments() {
        List<Comment> comments = commentService.findAll();
        return ResponseEntity.ok(comments);
    }

    @GetMapping("/{id}")
    @JsonView(Comment.comment.class)
    public ResponseEntity<List<Comment>> getCommentById(@PathVariable int id) {
        Comment comment = commentService.findById(id).get();
        Pageable pageable = PageRequest.of(0, 10);
        List<Comment > comments = commentService.findAllCommentByPostID(comment.getPost().getId(),pageable);
        if (!comments.isEmpty()) {
            return new ResponseEntity<>(comments, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(comments, HttpStatus.OK);
        }

    }

    @GetMapping("/comment-reply/{id}/user_id/{user_id}")
    @JsonView(Comment.comment.class)
    public ResponseEntity< List<Map<String,Object>>> getCommentReplyById(@PathVariable int id,@PathVariable int user_id) {
        Comment comment = commentService.findById(id).get();
        Pageable pageable = PageRequest.of(0, 10);
        List<Map<String,Object>>comments = commentService.findAllCommentByCommentPath(comment.getPost().getId(),comment.getPath(),user_id,pageable);
        if (!comments.isEmpty()) {
            return new ResponseEntity<>(comments, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(comments, HttpStatus.OK);
        }
    }

    @GetMapping("/post/{id}")
    @JsonView(Comment.comment.class)
    public ResponseEntity<List<Comment>> getCommentByPostID(@PathVariable int id) {
        Pageable pageable = PageRequest.of(0, 10);
        List<Comment> comments = commentService.findAllCommentByPostID(id,pageable);
        if (!comments.isEmpty()) {
            return new ResponseEntity<>(comments, HttpStatus.OK);

        } else {
            return new ResponseEntity<>(HttpStatus.OK);
        }
    }

    @GetMapping("/post/{id}/user_id/{user_id}")
    @JsonView(Comment.comment.class)
    public ResponseEntity<List<Map<String,Object>>> getCommentByPostID(@PathVariable int id,@PathVariable String user_id) {
        Pageable pageable = PageRequest.of(0, 10);
        int userID;
        if (user_id==null)
            userID = -1;
        else
            userID = Integer.parseInt(user_id);
        List<Map<String,Object>> comments = commentService.findAllCommentByPostIDAndUser(id,userID,pageable);
        if (!comments.isEmpty()) {
            return new ResponseEntity<>(comments, HttpStatus.OK);

        } else {
            return new ResponseEntity<>(HttpStatus.OK);
        }
    }


    @PostMapping("/create")
    @JsonView(Comment.comment.class)
    public ResponseEntity<Comment> createComment(@RequestBody Map<String, String> params) {
        String user_id = params.get("user_id");
        String post_id=params.get("post_id");
        String content = params.get("content");

        Post post = postService.findById(Integer.parseInt(post_id)).get();
        User user = userService.findById(Integer.parseInt(user_id)).get();

        Comment comment = new Comment();
        comment.setPost(post);
        comment.setUser(user);
        comment.setContent(content);
        comment=commentService.save(comment);
        comment.setPath(String.valueOf(comment.getId()));

        commentService.update(comment);
        post.setCount_comment((post.getCount_comment()+1));
        postService.save(post);
        return new ResponseEntity<>(comment, HttpStatus.CREATED);
    }

    @PostMapping("/create-reply")
    @JsonView(Comment.comment.class)
    public ResponseEntity<Comment> createCommentReply(@RequestBody Map<String, String> params) {
        String user_id = params.get("user_id");
        String comment_id = params.get("comment_id");
        String content = params.get("content");

        User user = userService.findById(Integer.parseInt(user_id)).get();
        Comment comment = commentService.findById(Integer.parseInt(comment_id)).get();
        Post post = comment.getPost();

        Comment commentReply = new Comment();
        commentReply.setPost(post);
        commentReply.setUser(user);
        commentReply.setContent(content);
        commentReply.setPath(comment.getPath());
        commentReply=commentService.save(commentReply);

        commentReply.setPath(comment.getPath()+"_"+commentReply.getId());
        commentService.update(commentReply);

        commentService.update(comment);

        post.setCount_comment((post.getCount_comment()+1));
        postService.save(post);
        return new ResponseEntity<>(comment, HttpStatus.CREATED);
    }

    @PostMapping("/batch")
    @JsonView(Comment.comment.class)
    public ResponseEntity<List<Comment>> createComments(@RequestBody List<Comment> comments) {
        commentService.saveAll(comments);
        return new ResponseEntity<>(comments, HttpStatus.CREATED);
    }

    @PatchMapping("/update")
    @JsonView(Comment.comment.class)
    public ResponseEntity<Comment> updateComment(@RequestBody Map<String, String> params) {
        String comment_id = params.get("comment_id");
        String content = params.get("content");;
        Comment comment = commentService.findById(Integer.parseInt(comment_id)).get();
        comment.setContent(content);
        comment.setEdit(true);
        commentService.update(comment);
        return new ResponseEntity<>(comment, HttpStatus.CREATED);
    }

    @DeleteMapping("/{id}")
    @JsonView(Comment.comment.class)
    public ResponseEntity<Void> deleteComment(@PathVariable int id) {
        Comment comment = commentService.findById(id).get();
        System.out.println(comment.getPath());
        Post post = comment.getPost();
        int row= commentService.deleteByPath(comment.getPath());
        post.setCount_comment(post.getCount_comment()-row);
//        comment.setc
        return ResponseEntity.noContent().build();
    }
}
