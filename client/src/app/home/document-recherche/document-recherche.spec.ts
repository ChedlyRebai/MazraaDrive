import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DocumentRecherche } from './document-recherche';

describe('DocumentRecherche', () => {
  let component: DocumentRecherche;
  let fixture: ComponentFixture<DocumentRecherche>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [DocumentRecherche]
    })
    .compileComponents();

    fixture = TestBed.createComponent(DocumentRecherche);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
