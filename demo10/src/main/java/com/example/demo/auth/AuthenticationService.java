package com.example.demo.auth;

import com.example.demo.Entity.CartItem;
import com.example.demo.Ex.CustomerNotFoundException;
import com.example.demo.config.JwtService;
import com.example.demo.model.Email;
import com.example.demo.model.EmailUntilt;
import com.example.demo.model.GoogleLoginRequest;
import com.example.demo.token.Token;
import com.example.demo.token.TokenRepository;
import com.example.demo.token.TokenType;
import com.example.demo.user.Role;
import com.example.demo.user.User;
import com.example.demo.user.UserRepository;
import com.nimbusds.oauth2.sdk.AccessTokenResponse;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.client.RestTemplate;
import org.webjars.NotFoundException;

import javax.management.relation.InvalidRoleInfoException;
import javax.swing.text.Utilities;
import java.util.*;

import org.springframework.security.oauth2.client.OAuth2AuthorizedClient;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClientService;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;


@Service
@RequiredArgsConstructor
public class AuthenticationService {
  private final UserRepository repository;
  private final TokenRepository tokenRepository;
  private final PasswordEncoder passwordEncoder;
  private final JwtService jwtService;
  private final AuthenticationManager authenticationManager;
  private final OAuth2AuthorizedClientService authorizedClientService;


  public AuthenticationResponse register(RegisterRequest request) {
    var user = User.builder()
        .firstname(request.getFirstname())
        .lastname(request.getLastname())
        .email(request.getEmail())
        .password(passwordEncoder.encode(request.getPassword()))
        .role(Role.USER)
        .build();
    var savedUser = repository.save(user);
    var jwtToken = jwtService.generateToken(user);
    saveUserToken(savedUser, jwtToken);
    return AuthenticationResponse.builder()
        .token(jwtToken)
        .build();
  }

//  public AuthenticationResponse authenticateWithGoogle(HttpServletRequest request) {
//    // Kiểm tra xem người dùng đã xác thực thông qua OAuth2 chưa
//    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//    if (authentication instanceof OAuth2AuthenticationToken) {
//      OAuth2AuthenticationToken oauth2Authentication = (OAuth2AuthenticationToken) authentication;
//
//      OAuth2User principal = oauth2Authentication.getPrincipal();
//      String email = principal.getAttribute("email");
//      if (email == null || email.isEmpty()) {
//        throw new IllegalArgumentException("Không tìm thấy email từ Google OAuth2.");
//      }
//
//      var user = repository.findByEmail(email);
//      if (user.isEmpty()) {
//        // Nếu email chưa tồn tại, bạn có thể tạo một người dùng mới với thông tin từ Google.
//        var newUser = createUserFromGoogleInfo(principal.getAttributes());
//        repository.save(newUser);
//        user = Optional.of(newUser);
//      }
//
//      if (user.isPresent()) {
//        var jwtToken = jwtService.generateToken(user.get());
//        revokeAllUserTokens(user.get());
//        saveUserToken(user.get(), jwtToken);
//
//        return AuthenticationResponse.builder()
//                .token(jwtToken)
//                .type("Bearer")
//                .id(user.get().getId())
//                .email(user.get().getEmail())
//                .firstname(user.get().getFirstname())
//                .lastname(user.get().getLastname())
//                .roles(user.get().getAuthorities())
//                .build();
//      }
//    }
//
//    // Trả về giá trị mặc định hoặc null nếu không xác thực bằng OAuth2
//    return null;
//  }


  private User createUserFromGoogleInfo(Map<String, Object> googleAttributes) {
    String email = (String) googleAttributes.get("email");
    String firstName = (String) googleAttributes.get("given_name");
    String lastName = (String) googleAttributes.get("family_name");

    return User.builder()
            .email(email)
            .firstname(firstName)
            .lastname(lastName)
            .role(Role.USER)
            .build();
  }

  public AuthenticationResponse authenticateWithGoogle(@RequestBody GoogleLoginRequest request) {
    // Lấy thông tin người dùng từ frontend
    String email = request.getEmail();
    String givenName = request.getGivenName();
    String familyName = request.getFamilyName();

    // Kiểm tra xem người dùng đã tồn tại trong cơ sở dữ liệu hay chưa
    Optional<User> existingUser = repository.findByEmail(email);
    User user;
    if (existingUser.isPresent()) {
      // Nếu người dùng đã tồn tại, cập nhật thông tin từ frontend và lưu vào cơ sở dữ liệu
      user = existingUser.get();
      user.setFirstname(givenName);
      user.setLastname(familyName);
      // Cập nhật các thông tin khác nếu cần
    } else {
      // Nếu người dùng chưa tồn tại, tạo mới và lưu vào cơ sở dữ liệu
      user = User.builder()
              .firstname(givenName)
              .lastname(familyName)
              .email(email)
              .role(Role.USER)
              .build();
    }
    repository.save(user);

    // Tạo token và lưu vào cơ sở dữ liệu
    String jwtToken = jwtService.generateToken(user);
    saveUserToken(user, jwtToken);

    // Trả về thông tin đăng nhập thành công
    return AuthenticationResponse.builder()
            .token(jwtToken)
            .type("Bearer")
            .id(user.getId())
            .email(user.getEmail())
            .firstname(user.getFirstname())
            .lastname(user.getLastname())
            .roles(user.getAuthorities())
            .build();
  }

  public AuthenticationResponse authenticate(AuthenticationRequest request) {
    authenticationManager.authenticate(
        new UsernamePasswordAuthenticationToken(
            request.getEmail(),
            request.getPassword()
        )
    );
    var user = repository.findByEmail(request.getEmail())
        .orElseThrow();
    var jwtToken = jwtService.generateToken(user);
    revokeAllUserTokens(user);
    saveUserToken(user, jwtToken);
    return AuthenticationResponse.builder()
        .token(jwtToken)
            .type("Beerer")
            .id(user.getId())
            .email(user.getEmail())
            .firstname(user.getFirstname())
            .lastname(user.getLastname())
            .roles(user.getAuthorities())

        .build();
  }
  public void updateUserRole(String email, String newRole) {
    User user = repository.findByEmail(email)
            .orElseThrow(() -> new NotFoundException("User not found"));

//    Role role;
//    try {
//      role = Role.valueOf(newRole.toUpperCase()); // Chuyển đổi chuỗi thành enum Role
//    } catch (IllegalArgumentException e) {
//     e.getMessage();
//    }

    user.setRole(Role.valueOf(newRole)); // Gán enum Role vào trường role
    repository.save(user);
  }
  public List<AuthenticationResponse> findAll() {
    List<User> users = repository.findAll();
    List<AuthenticationResponse> responses = new ArrayList<>();

    for (User user : users) {
      AuthenticationResponse response = AuthenticationResponse.builder()
              .token("your_token_value")
              .type("Bearer")
              .id(user.getId())
              .email(user.getEmail())
              .firstname(user.getFirstname())
              .lastname(user.getLastname())
              .roles(user.getAuthorities())
              .build();

      responses.add(response);
    }

    return responses;
  }
  public void updatePassword(String token, String newPassword) {
    User user = repository.findByResetPasswordToken(token);

    user.setPassword(passwordEncoder.encode(newPassword));

    user.setResetPasswordToken(null);
    repository.save(user);
  }
  public void updateResetPasswordToken(String token, String email) throws CustomerNotFoundException {
    User user = repository.findByEmail(email)
            .orElseThrow(() -> new NotFoundException("User not found"));
    if (user != null) {
      user.setResetPasswordToken(token);
      repository.save(user);
      System.out.println("da up date" + token);
    } else {
      throw new CustomerNotFoundException("Could not find any customer with the email " + email);
    }
  }
//  public class RandomStringGenerator {
//    public static void main(String[] args) {
//      int length = 45;
//      String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
//      StringBuilder randomString = new StringBuilder();
//      Random random = new Random();
//      for (int i = 0; i < length; i++) {
//        randomString.append(chars.charAt(random.nextInt(chars.length())));
//      }
//      System.out.println("Random string: " + randomString.toString());
//    }
//  }
  public String RandomStringGenerator(int n){
    String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
    String sum="";
      StringBuilder randomString = new StringBuilder();
      Random random = new Random();
      for (int i = 0; i < n; i++) {
       sum= randomString.append(chars.charAt(random.nextInt(chars.length()))).toString();
      }
      return sum;
  }
  public String processForgotPasswordForm(String email){

    String token= RandomStringGenerator(45);
    try{
      updateResetPasswordToken(token,email);
      String resetPassWord= "http://localhost:3000/reset_password/"+token;
      Email email1 = new Email();
      email1.setFrom("nguyenduy.30719@gmail.com");
      email1.setFromPss("iuntfgqwytqmwsvr");
      email1.setTo(email);
      email1.setSubject(" :");
      StringBuilder sb= new StringBuilder();
      sb.append("<p>Hello,</p>\n" +
              "            + \"<p>You have requested to reset your password.</p>\"\n" +
              "            + \"<p>Click the link below to change your password:</p>\"\n" +
              "            + \"<p><a href=\"" + resetPassWord + "\">Change my password</a></p>\"\n" +
              "            + \"<br>\"\n" +
              "            + \"<p>Ignore this email if you do remember your password, \"\n" +
              "            + \"or you have not made the request.</p>\"").append("<br>");


      email1.setContent(sb.toString());
      try {
        EmailUntilt.send(email1);
      } catch (Exception e) {
        throw new RuntimeException(e);
      }



    }catch (Exception e){
      e.getMessage();
    }
    return email+" "+token;
  }
  public AuthenticationResponse getUserByID(String email) {

    var user = repository.findByEmail(email)
            .orElseThrow();

    return AuthenticationResponse.builder()
            .token("")
            .type("Beerer")
            .id(user.getId())
            .email(user.getEmail())
            .firstname(user.getFirstname())
            .lastname(user.getLastname())
            .roles(user.getAuthorities())

            .build();
  }

  public AuthenticationResponse authenticate1(AuthenticationRequest request) {
    authenticationManager.authenticate(
            new UsernamePasswordAuthenticationToken(
                    request.getEmail(),
                    request.getPassword()
            )
    );
    var user = repository.findByEmail(request.getEmail())
            .orElseThrow();
    var jwtToken = jwtService.generateToken(user);
    revokeAllUserTokens(user);
    saveUserToken(user, jwtToken);
    return AuthenticationResponse.builder()
            .token(jwtToken)
            .type("Beerer")
            .email(user.getEmail())
            .firstname(user.getFirstname())
            .lastname(user.getLastname())
            .roles(user.getAuthorities())

            .build();
  }

  private void saveUserToken(User user, String jwtToken) {
    var token = Token.builder()
        .user(user)
        .token(jwtToken)
        .tokenType(TokenType.BEARER)
        .expired(false)
        .revoked(false)
        .build();
    tokenRepository.save(token);
  }

  private void revokeAllUserTokens(User user) {
    var validUserTokens = tokenRepository.findAllValidTokenByUser(user.getId());
    if (validUserTokens.isEmpty())
      return;
    validUserTokens.forEach(token -> {
      token.setExpired(true);
      token.setRevoked(true);
    });
    tokenRepository.saveAll(validUserTokens);
  }




}
