import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DocumentMangement } from './document-mangement';

describe('DocumentMangement', () => {
  let component: DocumentMangement;
  let fixture: ComponentFixture<DocumentMangement>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [DocumentMangement]
    })
    .compileComponents();

    fixture = TestBed.createComponent(DocumentMangement);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
