package com.example.demo.model.entity;

import com.fasterxml.jackson.annotation.JsonView;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "likes")
public class Like {
    public interface likePublic {};
    @Id
    @GeneratedValue(strategy =  GenerationType.IDENTITY)
    @JsonView(Like.likePublic.class)
    private int id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    private int type_id ;

    private String type;
}
