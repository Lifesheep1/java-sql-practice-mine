CREATE TABLE `Users`(
    `user_id` BIGINT PRIMARY KEY AUTO_INCREMENT,
    `username` VARCHAR(255) NOT NULL UNIQUE,
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `password` VARCHAR(255) NOT NULL,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE `Boards`(
    `board_id` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` varchar(255) not null,
    `description` text
);
CREATE TABLE `Posts`(
    `post_id` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `title` varchar(255) NOT NULL,
    `content` text NOT NULL,
    `user_id` BIGINT,
     FOREIGN KEY(`user_id`) REFERENCES `Users`(`user_id`),
    `board_id` BIGINT,
     FOREIGN KEY(`board_id`) REFERENCES `Boards`(`board_id`),
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
);
CREATE TABLE `Comments`(
    `comment_id` BIGINT NOT NULL PRIMARY key AUTO_INCREMENT,
    `content` text NOT NULL,
    `user_id` BIGINT,
     FOREIGN KEY(`user_id`) REFERENCES `Users`(`user_id`),
    `post_id` BIGINT,
     FOREIGN KEY(`post_id`) REFERENCES `Posts`(`post_id`),
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
);
CREATE TABLE `Tags`(
    `tag_id` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` varchar(255) NOT NULL UNIQUE
);
CREATE TABLE `Post_Tags`(
    `post_id` BIGINT NOT NULL,
     FOREIGN KEY(`post_id`) REFERENCES `Posts`(`post_id`),
    `tag_id` BIGINT NOT NULL,
     FOREIGN KEY(`tag_id`) REFERENCES `Tags`(`tag_id`)
);