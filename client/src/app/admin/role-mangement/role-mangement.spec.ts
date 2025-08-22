import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RoleMangementComponent } from './role-mangement';

describe('RoleMangement', () => {
  let component: RoleMangementComponent;
  let fixture: ComponentFixture<RoleMangementComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [RoleMangementComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(RoleMangementComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
