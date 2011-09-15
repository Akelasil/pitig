CREATE TABLE `admin_artista` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `i_alias` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `curriculum` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `imagen_file_name` varchar(255) DEFAULT NULL,
  `imagen_content_type` varchar(255) DEFAULT NULL,
  `imagen_file_size` int(11) DEFAULT NULL,
  `imagen_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE `admin_coleccions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `admin_obras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `anio_realizacion` date DEFAULT NULL,
  `medidas` varchar(255) DEFAULT NULL,
  `seccion` varchar(255) DEFAULT NULL,
  `tecnica` varchar(255) DEFAULT NULL,
  `precio` decimal(11,2) DEFAULT NULL,
  `admin_coleccion_id` int(11) DEFAULT NULL,
  `admin_artistum_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `imagen_file_name` varchar(255) DEFAULT NULL,
  `imagen_content_type` varchar(255) DEFAULT NULL,
  `imagen_file_size` int(11) DEFAULT NULL,
  `imagen_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO schema_migrations (version) VALUES ('20110809150614');

INSERT INTO schema_migrations (version) VALUES ('20110817163624');

INSERT INTO schema_migrations (version) VALUES ('20110825155722');

INSERT INTO schema_migrations (version) VALUES ('20110830181335');

INSERT INTO schema_migrations (version) VALUES ('20110905101753');