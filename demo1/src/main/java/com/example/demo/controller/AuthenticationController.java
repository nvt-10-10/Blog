//package com.example.demo.controller;
//
//import com.example.demo.auth.AuthenticationRequest;
//import com.example.demo.auth.AuthenticationResponse;
//import com.example.demo.service.AuthenticationService;
//import lombok.RequiredArgsConstructor;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//@RestController
//@RequestMapping("/api/v1/auth")
//@RequiredArgsConstructor
//public class AuthenticationController {
//    private final AuthenticationService authenticationService;
//    @PostMapping("login")
//    public ResponseEntity<AuthenticationResponse> login(@RequestBody AuthenticationRequest authenticationRequest){
//return  ResponseEntity.ok(authenticationService.authenticationResponse(authenticationRequest));
//    }
//}
