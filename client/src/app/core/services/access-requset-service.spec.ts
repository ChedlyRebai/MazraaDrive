import { TestBed } from '@angular/core/testing';

import { AccessRequsetService } from './access-requset-service';

describe('AccessRequsetService', () => {
  let service: AccessRequsetService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(AccessRequsetService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
