import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';


import {MatFormFieldModule} from '@angular/material/form-field'
import {MatButtonModule} from '@angular/material/button';

import { FooterComponent } from './footer/footer.component';
import { HeaderComponent } from './header/header.component';
import { BannerComponent } from './banner/banner.component';
import { PostComponent } from './post/post.component';
import { BlogComponent } from './blog/blog.component';
import { RouterModule } from '@angular/router';
import { BrowserModule } from '@angular/platform-browser';
import { SubscribeComponent } from './subscribe/subscribe.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';


const Components = [
  FooterComponent, HeaderComponent, BannerComponent, PostComponent, BlogComponent, SubscribeComponent
]

@NgModule({
  declarations: [...Components, ],
  imports: [
    BrowserModule,
    CommonModule,
    RouterModule,
    MatFormFieldModule,
    FormsModule,
    ReactiveFormsModule,
    MatButtonModule
  ],
  exports: [ ...Components]
})
export class ComponentsModule { }
