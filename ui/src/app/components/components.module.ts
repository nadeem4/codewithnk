import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FooterComponent } from './footer/footer.component';
import { HeaderComponent } from './header/header.component';
import { BannerComponent } from './banner/banner.component';
import { PostComponent } from './post/post.component';
import { BlogComponent } from './blog/blog.component';



@NgModule({
  declarations: [FooterComponent, HeaderComponent, BannerComponent, PostComponent, BlogComponent],
  imports: [
    CommonModule
  ]
})
export class ComponentsModule { }
