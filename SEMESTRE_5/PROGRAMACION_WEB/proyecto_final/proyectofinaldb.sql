DROP SCHEMA IF EXISTS `proyectofinaldb`;
CREATE SCHEMA IF  NOT EXISTS `proyectofinaldb` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci;
USE `proyectofinaldb`;

CREATE TABLE `usuarios`(
    `nombre` text not null,
    `direccion` text not null,
    `telefono` varchar(15) not null,
    `correo` text not null,
    `nombre_usuario` text not null,
    `password` varchar(25) not null,
    `fecha registro` datetime not null default current_timestamp on update current_timestamp, 
    `permisos` int(11) not null default '1',
    `id` int(11) not null auto_increment,
    PRIMARY KEY(`id`)
) ENGINE=InnoDB;

INSERT INTO `usuarios` VALUES ('Aleks Ivan Velazquez Arriaga','Calle 9 numero 55','5578283967','aleksvelazquez32@aragon.unam.mx','Velalmanez','123456', default, 1,1);