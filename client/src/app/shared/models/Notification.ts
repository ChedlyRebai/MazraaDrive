import { PagedResult } from './pageresult';

export interface NotificationDTO {
       title: string;
       userId: string;
       message: string;
       isRead: boolean;
       link: string | null;
       type: string | null;
       actionUrl: string | null;
       senderId: string | null;
}

export interface NotificationPagedResult extends PagedResult<NotificationDTO> {
       totalNotifications: number;
       unreadNotifications: number;
}