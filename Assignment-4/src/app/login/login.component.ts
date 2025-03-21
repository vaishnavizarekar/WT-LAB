import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common'; // Import CommonModule
import { FormsModule } from '@angular/forms'; // Import FormsModule

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [CommonModule, FormsModule], // Add CommonModule and FormsModule to imports
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent {
  username: string = '';
  password: string = '';
  loginSuccessful: boolean = false;

  constructor(private router: Router) {}

  onLogin() {
    // Logic for handling login goes here
    console.log('Username:', this.username);
    console.log('Password:', this.password);

    // Simulate a successful login
    if (this.username === 'testuser' && this.password === 'testpassword') {
      this.loginSuccessful = true;
      alert('Login successful');
    } else {
      this.loginSuccessful = false;
      alert('Login successful');
    }
  }

  redirectToRegister() {
    this.router.navigate(['/registration']);
  }
}