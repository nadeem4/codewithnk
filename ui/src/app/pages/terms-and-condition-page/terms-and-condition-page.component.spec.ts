import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TermsAndConditionPageComponent } from './terms-and-condition-page.component';

describe('TermsAndConditionPageComponent', () => {
  let component: TermsAndConditionPageComponent;
  let fixture: ComponentFixture<TermsAndConditionPageComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ TermsAndConditionPageComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(TermsAndConditionPageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
