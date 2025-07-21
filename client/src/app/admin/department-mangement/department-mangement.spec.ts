import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DepartmentMangement } from './department-mangement';

describe('DepartmentMangement', () => {
  let component: DepartmentMangement;
  let fixture: ComponentFixture<DepartmentMangement>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [DepartmentMangement]
    })
    .compileComponents();

    fixture = TestBed.createComponent(DepartmentMangement);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
