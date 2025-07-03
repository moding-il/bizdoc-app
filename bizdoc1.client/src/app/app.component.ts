import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';

@Component({
  standalone: false,
  selector: 'app-root',
  template: '<bizdoc></bizdoc>',
})
export class AppComponent implements OnInit {
  constructor() { }
  ngOnInit(): void {
  }
}
