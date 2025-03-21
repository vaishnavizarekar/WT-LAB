import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common'; // Import CommonModule
import { FormsModule } from '@angular/forms'; // Import FormsModule

@Component({
  selector: 'app-registration',
  standalone: true,
  imports: [CommonModule, FormsModule], // Add CommonModule and FormsModule to imports
  templateUrl: './registration.component.html',
  styleUrls: ['./registration.component.css']
})
export class RegistrationComponent {
  firstname: string = '';
  lastname: string = '';
  mobile: string = '';
  altmobile: string = '';
  address: string = '';
  username: string = '';
  email: string = '';
  altemail: string = '';
  password: string = '';

  constructor(private router: Router) {}

  completeRegistration() {
    // Logic for completing registration goes here
    if (this.isValid()) {
      console.log('Registration complete');
      alert('Registration successful');
      // After registration logic is complete, navigate to the login page
      this.router.navigate(['/login']);
    } else {
      alert('Please fill out the form correctly.');
    }
  }

  isValid(): boolean {
    // Add your custom validation logic here if needed
    return true;
  }

  redirectToLogin() {
    this.router.navigate(['/login']);
  }
}