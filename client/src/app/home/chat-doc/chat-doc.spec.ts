import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ChatDoc } from './chat-doc';

describe('ChatDoc', () => {
  let component: ChatDoc;
  let fixture: ComponentFixture<ChatDoc>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ChatDoc]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ChatDoc);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
