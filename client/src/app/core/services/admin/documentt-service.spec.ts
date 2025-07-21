import { TestBed } from '@angular/core/testing';

import { DocumenttService } from './documentt-service';

describe('DocumenttService', () => {
  let service: DocumenttService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(DocumenttService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
