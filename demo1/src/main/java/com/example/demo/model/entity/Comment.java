package com.example.demo.model.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonView;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;


import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "comments")
public class Comment {
    public interface comment extends  User.baseJson{}

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @JsonView(Comment.comment.class)
    private int id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    @JsonView(Comment.comment.class)
    private User user;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "post_id")
    private Post post;
    @JsonView(Comment.comment.class)
    private String content;

    private String path;

    @ColumnDefault("0")
    @JsonView(Comment.comment.class)
    private int count_like;

    @ColumnDefault("0")
    @JsonView(Comment.comment.class)
    private int count_comment;
    @Column(updatable = false)
    @JsonView(Comment.comment.class)
    private Date date;

    @ColumnDefault("false")
    @JsonView(Comment.comment.class)
    private boolean isEdit;

    @PrePersist
    public void onCreate() {
        ZoneId zoneId = ZoneId.of("Asia/Ho_Chi_Minh"); // Múi giờ của Việt Nam
        LocalDateTime currentDateTime = LocalDateTime.now(zoneId);
        date = Date.from(currentDateTime.atZone(ZoneId.systemDefault()).toInstant());

    }
}
