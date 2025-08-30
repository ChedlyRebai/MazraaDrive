import { CommonModule } from '@angular/common';
import { Component, NgModule, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { ThemeSwitcher } from '../../admin/themeswitcher';

interface Message {
  id: string;
  senderId: string;
  senderName: string;
  senderAvatar?: string;
  text: string;
  sentAt: Date;
  read?: boolean;
}

@Component({
  selector: 'app-chat-doc',
  templateUrl: './chat-doc.html',
  styleUrls: ['./chat-doc.css'],
  imports: [CommonModule, FormsModule, ThemeSwitcher],
})
export class ChatDoc implements OnInit {
  conversation = {
    name: 'Ioni Bowcher',
    avatarUrl: '/images/avatar/ionibowcher.png',
    lastActive: new Date(Date.now() - 1000 * 60 * 60), // 1 hour ago
  };

  currentUserId = 'me'; // replace with real current user id from auth service
  messageText = '';

  messages: Message[] = [
    {
      id: 'm1',
      senderId: 'user-ioni',
      senderName: 'Ioni Bowcher',
      senderAvatar: '/images/avatar/ionibowcher.png',
      text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
      sentAt: new Date(),
      read: true,
    },
    {
      id: 'm2',
      senderId: 'user-ioni',
      senderName: 'Ioni Bowcher',
      senderAvatar: '/images/avatar/ionibowcher.png',
      text: 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      sentAt: new Date(),
      read: true,
    },
    {
      id: 'm3',
      senderId: this.currentUserId,
      senderName: 'You',
      senderAvatar: '/images/avatar/you.png',
      text: 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      sentAt: new Date(),
      read: true,
    },
  ];

  ngOnInit(): void {
    // scroll to bottom after initial render
    setTimeout(() => this.scrollToBottom(), 50);
  }

  send(): void {
    const text = (this.messageText || '').trim();
    if (!text) return;

    const msg: Message = {
      id: Date.now().toString(),
      senderId: this.currentUserId,
      senderName: 'You',
      senderAvatar: '/images/avatar/you.png',
      text,
      sentAt: new Date(),
      read: false,
    };

    this.messages.push(msg);
    this.messageText = '';
    this.scrollToBottom();

    // TODO: send message to server / websocket
  }

  toggleEmoji(): void {
    this.messageText = (this.messageText || '') + '😀';
  }

  trackById(_i: number, m: Message) {
    return m.id;
  }

  private scrollToBottom() {
    try {
      const container = document.querySelector('.user-message-container');
      if (container) container.scrollTop = container.scrollHeight;
    } catch {
      //
    }
  }
}
