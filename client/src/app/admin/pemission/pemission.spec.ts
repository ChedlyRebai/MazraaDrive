import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Pemission } from './pemission';

describe('Pemission', () => {
  let component: Pemission;
  let fixture: ComponentFixture<Pemission>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Pemission]
    })
    .compileComponents();

    fixture = TestBed.createComponent(Pemission);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
