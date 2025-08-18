import { TestBed } from '@angular/core/testing';

import { DocumentRequsetService } from './document-requset-service';

describe('DocumentRequsetService', () => {
  let service: DocumentRequsetService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(DocumentRequsetService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
