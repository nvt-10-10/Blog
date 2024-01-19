//package com.example.demo.service;
//
//import com.example.demo.auth.AuthenticationRequest;
//import com.example.demo.auth.AuthenticationResponse;
//import com.example.demo.model.entity.User;
//import com.example.demo.repository.UserRepository;
//import lombok.RequiredArgsConstructor;
//import org.springframework.security.authentication.AuthenticationManager;
//import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
//import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.stereotype.Service;
//
//import java.util.ArrayList;
//import java.util.Collection;
//
//@Service
//@RequiredArgsConstructor
//public class AuthenticationService {
//    private final UserRepository userRepository;
//    private final AuthenticationService authenticationService;
//    private final AuthenticationManager authenticationManager;
//    private final JwtService jwtService;
//
//    public AuthenticationResponse authenticationResponse (AuthenticationRequest authenticationRequest){
//        authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(authenticationRequest.getEmail(),authenticationRequest.getPassword()));
//        User user = userRepository.getUserByEmail(authenticationRequest.getEmail()).orElseThrow();
//        Collection<SimpleGrantedAuthority> authorities = new ArrayList<>();
//        var jwtToken = jwtService.generateToken(user,authorities);
//        var jwtRefreshToken = jwtService.generateRefreshToken(user,authorities);
//        return AuthenticationResponse.builder().token(jwtToken).refreshToken(jwtRefreshToken).build();
//
//    }
//}
