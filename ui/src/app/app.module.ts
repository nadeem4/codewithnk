import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { PostPageComponent } from './pages/post-page/post-page.component';
import { BlogsPageComponent } from './pages/blogs-page/blogs-page.component';
import { HomePageComponent } from './pages/home-page/home-page.component';
import { AboutUsPageComponent } from './pages/about-us-page/about-us-page.component';
import { ContactUsPageComponent } from './pages/contact-us-page/contact-us-page.component';
import { PrivacyPolicyPageComponent } from './pages/privacy-policy-page/privacy-policy-page.component';
import { TermsAndConditionPageComponent } from './pages/terms-and-condition-page/terms-and-condition-page.component';
import { ComponentsModule } from './components/components.module';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

@NgModule({
  declarations: [
    AppComponent,
    PostPageComponent,
    BlogsPageComponent,
    HomePageComponent,
    AboutUsPageComponent,
    ContactUsPageComponent,
    PrivacyPolicyPageComponent,
    TermsAndConditionPageComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    ComponentsModule,
    BrowserAnimationsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
