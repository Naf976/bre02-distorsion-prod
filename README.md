# bre01-distorsion
Distorsion project for the BRE01 session

## Project brief

Distorsion is an anonymous message board, that allows posting messages in channels, grouped by categories.

## Routes

- pas de route : page d'accueil
- `about` : page à propos
- `list-categories`
- `create-category`
- `list-channels`
- `create-channel`
- `list-messages`
- `create-message`
- `register`
- `login`

## Models

### Category

- `id`
- `name`

### Channel

- `id`
- `name`
- `category_id`

### Messages
- `id`
- `content`
- `channel_id`
- `user_id`

### User
- `id`
- `username`
- `password`
- `role`


