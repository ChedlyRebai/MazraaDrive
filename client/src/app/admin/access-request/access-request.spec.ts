import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AccessRequest } from './access-request';

describe('AccessRequest', () => {
  let component: AccessRequest;
  let fixture: ComponentFixture<AccessRequest>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [AccessRequest]
    })
    .compileComponents();

    fixture = TestBed.createComponent(AccessRequest);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
