package com.example.demo.model.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonView;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.antlr.v4.runtime.misc.NotNull;
import org.hibernate.annotations.ColumnDefault;


import java.util.Date;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "users", uniqueConstraints = {
        @UniqueConstraint(name = "unique_username", columnNames = "username"),
        @UniqueConstraint(name = "unique_email", columnNames = "email")
})
public class User {
    public interface baseJson{}
    public interface fulldata extends baseJson{}

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @JsonView(User.baseJson.class)
    private int id;

    @JsonView(User.fulldata.class)
    private String username;

    @NotNull
//    @JsonView(User.fulldata.class)
    private String password;
    @JsonView(User.baseJson.class)
    private String name;

    @ColumnDefault("'https://mighty.tools/mockmind-api/content/human/65.jpg'")
    @JsonView(User.baseJson.class)
    private String img;

    @NotNull
    @JsonView(User.baseJson.class)
    private String email;
    @JsonView(User.fulldata.class)
    private String address;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy")
    private Date date_of_birth;

    @OneToMany
    @JsonIgnore
    private List<Post> posts ;

    @OneToMany
    @JsonIgnore
    private List<Comment> comments;

    @OneToMany
    @JsonIgnore
    private List<Like> likes;
}
