import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FoldersManagement } from './folders-management';

describe('FoldersManagement', () => {
  let component: FoldersManagement;
  let fixture: ComponentFixture<FoldersManagement>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [FoldersManagement]
    })
    .compileComponents();

    fixture = TestBed.createComponent(FoldersManagement);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
