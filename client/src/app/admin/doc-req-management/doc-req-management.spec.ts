import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DocReqManagement } from './doc-req-management';

describe('DocReqManagement', () => {
  let component: DocReqManagement;
  let fixture: ComponentFixture<DocReqManagement>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [DocReqManagement]
    })
    .compileComponents();

    fixture = TestBed.createComponent(DocReqManagement);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
