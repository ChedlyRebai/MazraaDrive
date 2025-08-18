import { TestBed } from '@angular/core/testing';

import { AccessRightService } from './access-right-service';

describe('AccessRightService', () => {
  let service: AccessRightService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(AccessRightService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
