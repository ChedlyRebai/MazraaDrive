import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DocumentAccess } from './document-access';

describe('DocumentAccess', () => {
  let component: DocumentAccess;
  let fixture: ComponentFixture<DocumentAccess>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [DocumentAccess]
    })
    .compileComponents();

    fixture = TestBed.createComponent(DocumentAccess);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
