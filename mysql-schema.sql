use website_rest;

SET FOREIGN_KEY_CHECKS = 0;


CREATE TABLE IF NOT EXISTS users (
  `googlesub` varchar(255) UNIQUE NOT NULL,
  `name` varchar (50) NOT NULL,
  `email` varchar (50) NOT NULL,
  `creation_datetime` DATETIME not null,
  `enabled` tinyint(1) NOT NULL,
  `role` VARCHAR (30) NOT NULL,
  `nickname` varchar (16) UNIQUE,
  PRIMARY KEY (`googlesub`),
  KEY (`nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 DEFAULT COLLATE utf8_bin;


CREATE TABLE IF NOT EXISTS gameplans (
	`id` int(11) NOT NULL AUTO_INCREMENT,
    `title` varchar(50) NOT NULL,
    `main_text` varchar(3000),
    `author_googlesub` varchar (50) NOT NULL,
    `creation_datetime` DATETIME not null,
    PRIMARY KEY (`id`),
    CONSTRAINT `FK_gameplans` FOREIGN KEY (`author_googlesub`)
    REFERENCES `users` (`googlesub`),
    CONSTRAINT `UQ_author_title_` UNIQUE(`author_googlesub`, `title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 DEFAULT COLLATE utf8_bin;

CREATE TABLE IF NOT EXISTS friendships (
`id` int(11) NOT NULL AUTO_INCREMENT,
`friend_1_googlesub` varchar(255),
`friend_2_googlesub` varchar(255),
`status`  tinyint(1) NOT NULL,
PRIMARY KEY (`id`),
KEY `FK_friend_1_idx` (`friend_1_googlesub`),
KEY `FK_friend_2_idx` (`friend_2_googlesub`),
UNIQUE KEY `fiends_combination` (`friend_1_googlesub`, `friend_2_googlesub`),

CHECK(`status` between 0 and 1),
CHECK(`friend_1_googlesub`<>`friend_2_googlesub`),

CONSTRAINT `FK_friend_1` FOREIGN KEY (`friend_1_googlesub`)
REFERENCES `users` (`googlesub`),

CONSTRAINT `FK_friend_2` FOREIGN KEY (`friend_2_googlesub`)
REFERENCES `users` (`googlesub`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 DEFAULT COLLATE utf8_bin;


DROP TRIGGER IF EXISTS quefriendships;
delimiter $
create trigger quefriendships before insert on friendships
for each row
begin
  if exists (
    select *
    from friendships
    where friend_1_googlesub = new.friend_2_googlesub and friend_2_googlesub = new.friend_1_googlesub
  )
  then
    signal sqlstate '45000' set message_text = ' uniquefriendships trigger: inverse friendship exists! ';
  end if;
end$
delimiter ;

CREATE TABLE IF NOT EXISTS gameplan_members (
`id` int(11) NOT NULL AUTO_INCREMENT,
`gameplan_id` int(11) NOT NULL,
`member_user_googlesub` varchar(255),
`status` tinyint(1) DEFAULT 0,
PRIMARY KEY (`id`),

CONSTRAINT `FK1_game_members` foreign key (`gameplan_id`) references `gameplans` (`id`),
CONSTRAINT `FK2_game_members` foreign key (`member_user_googlesub`) references `users` (`googlesub`),

UNIQUE KEY `gameplan_member_combination` (`gameplan_id`, `member_user_googlesub`),

CHECK(`status` between 0 and 1)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 DEFAULT COLLATE utf8_bin;

SET FOREIGN_KEY_CHECKS = 1;