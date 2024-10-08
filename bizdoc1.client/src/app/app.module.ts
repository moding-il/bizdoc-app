import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';

import { BizDocModule, MaterialModule } from '@bizdoc/core';
import { CredentialsModule } from '@bizdoc/credentials';
import { AppComponent } from './app.component';

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    ReactiveFormsModule,
    MaterialModule,
    HttpClientModule,
    BrowserModule,
    BizDocModule.forRoot({
      appTitle: 'BizDoc1',
      components: []
    }),
    CredentialsModule.forRoot()
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
