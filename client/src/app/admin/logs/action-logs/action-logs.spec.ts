import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ActionLogs } from './action-logs';

describe('ActionLogs', () => {
  let component: ActionLogs;
  let fixture: ComponentFixture<ActionLogs>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ActionLogs]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ActionLogs);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
