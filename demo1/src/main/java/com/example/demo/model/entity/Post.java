package com.example.demo.model.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonView;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "posts")
public class Post {

    public interface PostWithUserIntroductionView extends User.baseJson {}

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @JsonView(Post.PostWithUserIntroductionView.class)
    private int id;

    @Column(nullable = false)
    @JsonView(Post.PostWithUserIntroductionView.class)
    private String title;

    @Lob
    @Column(columnDefinition = "LONGTEXT", nullable = false)
    @JsonView(Post.PostWithUserIntroductionView.class)
    private String content;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy hh:mm:ss a", timezone = "Asia/Ho_Chi_Minh")
    @JsonView(Post.PostWithUserIntroductionView.class)
    private Date date;

    private boolean status;
    @JsonView(Post.PostWithUserIntroductionView.class)
    private Long count_comment;
    @JsonView(Post.PostWithUserIntroductionView.class)
    private Long count_like;
    @JsonView(Post.PostWithUserIntroductionView.class)
    private Long count_view;

    @ManyToOne
    @JoinColumn(name = "user_id")
    @JsonView(Post.PostWithUserIntroductionView.class)
    private User user;

    @OneToMany
    @JsonIgnore
    private List<Comment> comments;


    @PrePersist
    protected void onCreate() {
        ZoneId zoneId = ZoneId.of("Asia/Ho_Chi_Minh"); // Múi giờ của Việt Nam
        LocalDateTime currentDateTime = LocalDateTime.now(zoneId);
        date = Date.from(currentDateTime.atZone(ZoneId.systemDefault()).toInstant());
        count_comment= 0L;
        count_like=0L;
        count_view=0L;
    }
}
