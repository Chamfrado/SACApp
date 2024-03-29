package br.com.sacfullnet.sacfullnet.controller;


import br.com.sacfullnet.sacfullnet.Security.TokenService;
import br.com.sacfullnet.sacfullnet.model.DTO.AuthenticationDTO;
import br.com.sacfullnet.sacfullnet.model.DTO.LoginResponseDTO;
import br.com.sacfullnet.sacfullnet.model.DTO.RegisterDTO;
import br.com.sacfullnet.sacfullnet.model.User;
import br.com.sacfullnet.sacfullnet.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("auth")
public class AuthenticationController {
    @Autowired
    private AuthenticationManager authenticationManager;
    @Autowired
    private UserService repository;
    @Autowired
    private TokenService tokenService;

    @PostMapping("/login")
    public ResponseEntity login(@RequestBody AuthenticationDTO data){
        var usernamePassword = new UsernamePasswordAuthenticationToken(data.login(), data.password());

        var auth = this.authenticationManager.authenticate(usernamePassword);

        var token = tokenService.generateToken((User) auth.getPrincipal());

        return ResponseEntity.ok(new LoginResponseDTO(token));
    }

    @PostMapping("/register")
    public ResponseEntity register(@RequestBody RegisterDTO data){
        if(this.repository.findByLogin(data.login()) != null) return ResponseEntity.badRequest().build();

        String encryptedPassword = new BCryptPasswordEncoder().encode(data.password());
        User newUser = new User(data.login(), encryptedPassword, data.role());

        this.repository.save(newUser);

        return ResponseEntity.ok().build();
    }

    @PostMapping("/user")
    public ResponseEntity getUser(@RequestBody AuthenticationDTO data){

        User user = (User) repository.findByLogin(data.login());

        if(user == null){
            return ResponseEntity.badRequest().build();
        }

        return ResponseEntity.ok(user);
    }

    @PutMapping("/update")
    public ResponseEntity update(@RequestBody User updatedUser) {


        if(updatedUser.getPassword().length() == 60){
            User newUser = new User(updatedUser.getId() ,updatedUser.getLogin(), updatedUser.getPassword(), updatedUser.getRole());

            this.repository.update(newUser);
        }else{
            String encryptedPassword = new BCryptPasswordEncoder().encode(updatedUser.getPassword());
            User newUser = new User(updatedUser.getId() ,updatedUser.getLogin(), encryptedPassword, updatedUser.getRole());

            this.repository.update(newUser);
        }



        return ResponseEntity.ok().build();
    }
}