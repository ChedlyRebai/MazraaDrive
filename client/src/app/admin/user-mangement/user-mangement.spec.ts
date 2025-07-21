import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UserMangement } from './user-mangement';

describe('UserMangement', () => {
  let component: UserMangement;
  let fixture: ComponentFixture<UserMangement>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [UserMangement]
    })
    .compileComponents();

    fixture = TestBed.createComponent(UserMangement);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
