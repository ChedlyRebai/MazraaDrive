import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RoleMangement } from './role-mangement';

describe('RoleMangement', () => {
  let component: RoleMangement;
  let fixture: ComponentFixture<RoleMangement>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [RoleMangement]
    })
    .compileComponents();

    fixture = TestBed.createComponent(RoleMangement);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
