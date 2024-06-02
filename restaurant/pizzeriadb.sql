-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-06-2024 a las 07:05:09
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pizzeriadb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen`
--

CREATE TABLE `almacen` (
  `id_almacen` int(30) NOT NULL,
  `tipo_almacen` varchar(30) NOT NULL,
  `descripcion_almacen` varchar(50) NOT NULL,
  `estado_almacen` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `almacen`
--

INSERT INTO `almacen` (`id_almacen`, `tipo_almacen`, `descripcion_almacen`, `estado_almacen`) VALUES
(1, 'carnes', 'se guardan carnes', 'Activo'),
(2, 'Pan', 'Se guardan toda clase de pan ', 'Activo'),
(3, 'harinas', 'Se guardan harinas', 'Activo'),
(4, 'Aves', 'todo tipo de carne de aves pavo,pollo,cordero', 'Activo'),
(6, 'Secos', 'todo lo relacionado con lo seco', 'Inactivo'),
(10, 'Lacteos', 'Quesos,Quesillos,Requeson', 'Activo'),
(11, 'Bebidas', 'Gaseosas y Jugos', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(3, 'pbkdf2_sha256$390000$dJ1ZQzc9xk8EgibVBYJJaC$Gu9m/qflUhptEW/zTcEmtBB5MEc+pigyHKhksN9Od1U=', '2023-03-17 05:25:16.969859', 1, 'admin', '', '', '', 1, 1, '2023-03-10 00:15:56.323046'),
(4, 'pbkdf2_sha256$390000$mu3XCmhJ9mwFQarQeWCCAB$hXlrBimc3ZS7JzAjfBf19yysJg9IO1rx8bPzM69yOM8=', '2023-03-16 20:37:04.000000', 0, 'fidel11', 'fidel', 'castro', 'Fidelcastro@gmail.com', 0, 1, '2023-03-16 20:19:18.000000'),
(7, 'pbkdf2_sha256$390000$IzX8EeJcXJgmyTPpjMKotm$BpAlWVSIak0c2/f/eyfKnqytPc9ankSKe6MBs9PtQd0=', '2023-03-16 23:40:06.809581', 0, 'Ethan11', 'Ethan', 'Armando', 'Cardona123@gmail.com', 0, 1, '2023-03-16 23:38:17.763453'),
(8, 'pbkdf2_sha256$390000$bzBe71B9SmXaPYSSAFdKNG$7q846ygnCaniqCbbD8twp4I03UN+4vSDtX2eVulGobs=', NULL, 0, 'Ada21', 'Ada', 'Wong', 'Ada@ujcv.edu.hn', 0, 1, '2023-03-16 23:55:16.048968');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `id` int(20) NOT NULL,
  `nombre_cargo` varchar(50) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`id`, `nombre_cargo`, `descripcion`) VALUES
(1, 'Contador', 'Contabiliza lo que sale y lo que entra en la empresa'),
(2, 'Administrador', 'administrar los alimentos del inventario y el monto'),
(3, 'gerencia', 'Diseñar las vistas para los clientes'),
(4, 'guianza', 'Guiar a los lideres'),
(5, 'Chefs', 'Puede Crear la comida'),
(7, 'Limpieza', 'Limpia el Desastre');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `categoria_id` int(20) NOT NULL,
  `nombre_categoria` varchar(50) NOT NULL,
  `descripcion_categoria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`categoria_id`, `nombre_categoria`, `descripcion_categoria`) VALUES
(1, 'Panes', 'harina y pastas'),
(2, 'Carnes', 'Carnes Rojas no pescados solo rojas'),
(3, 'Quesos', 'Quesos harinas etc'),
(35, 'Pastas', 'Todo lo relacionado con pasta'),
(36, 'Gaseosas', 'Refrescos y Jugos Helados');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(40) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `dni` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre`, `apellido`, `dni`) VALUES
(2, 'Ada Lopez', 'Sanidad Arellano', '0801200313890'),
(3, 'Noe Ramirez', 'Vladimir Vasques', '1234567891234'),
(4, 'Sanchez Lopez', 'Sisa Velazquez', '0908012345671'),
(5, 'Edelman Leiva', 'Davidovich Gonzalez', '0801200215712'),
(6, 'Ethan Armando', 'Cardona Gonzalez', '0801200315744'),
(7, 'David Ramirez', 'Jose Jose', '0801200112345'),
(8, 'Julio Lopez', 'Funez Josue', '0826195600003');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id_departamento` int(50) NOT NULL,
  `departamento` varchar(50) NOT NULL,
  `codigo_postal` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id_departamento`, `departamento`, `codigo_postal`) VALUES
(1, 'Lempiras', '11111'),
(2, 'Choluteca', '22222'),
(3, 'Yoro', '22222'),
(4, 'Choloma', '11111'),
(5, 'Copan', '22222'),
(85, 'Cortes', '44444');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuentos`
--

CREATE TABLE `descuentos` (
  `id_descuento` int(40) NOT NULL,
  `descuento` varchar(50) NOT NULL,
  `fecha_inicio` date NOT NULL DEFAULT current_timestamp(),
  `fecha_final` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `descuentos`
--

INSERT INTO `descuentos` (`id_descuento`, `descuento`, `fecha_inicio`, `fecha_final`) VALUES
(1, '0.10', '2023-04-17', '2023-04-17'),
(2, '0.05', '2023-04-17', '2023-04-17'),
(3, '0.00', '2023-04-17', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id_detalle` int(40) NOT NULL,
  `tamaño_menu` varchar(40) NOT NULL,
  `estado_pedido` varchar(40) NOT NULL COMMENT 'Llave foranea',
  `descripcion_detalle` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id_detalle`, `tamaño_menu`, `estado_pedido`, `descripcion_detalle`) VALUES
(1, 'Individual', 'Ejecucion', 'Combo Normal'),
(2, 'Individual', 'En Espera', 'Combo Simple'),
(3, 'Parejas', 'En Espera', 'Como Mediano ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(4, '2023-03-16 20:19:18.890045', '4', 'fidel11', 1, '[{\"added\": {}}]', 4, 3),
(5, '2023-03-16 21:58:10.308542', '4', 'fidel11', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 3),
(6, '2023-03-16 23:37:26.813022', '6', 'pepe12', 3, '', 4, 3),
(7, '2023-03-16 23:37:34.830029', '5', 'Armando', 3, '', 4, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-02-11 19:42:35.260510'),
(2, 'auth', '0001_initial', '2023-02-11 19:42:40.881465'),
(3, 'admin', '0001_initial', '2023-02-11 19:42:42.133256'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-02-11 19:42:42.216180'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-02-11 19:42:42.262136'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-02-11 19:42:42.921251'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-02-11 19:42:43.484206'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-02-11 19:42:43.609093'),
(9, 'auth', '0004_alter_user_username_opts', '2023-02-11 19:42:43.642080'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-02-11 19:42:44.008679'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-02-11 19:42:44.042641'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-02-11 19:42:44.079615'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-02-11 19:42:44.186523'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-02-11 19:42:44.635287'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-02-11 19:42:44.834539'),
(16, 'auth', '0011_update_proxy_permissions', '2023-02-11 19:42:44.890752'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-02-11 19:42:44.994240'),
(18, 'sessions', '0001_initial', '2023-02-11 19:42:45.308780');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('3cgbpb95v3lie28ieniglotu97prqiae', 'e30:1paoDd:WGiDL-ujDCPUeS_Nqs4cl7qAceEMS8zEZNGQjau5pH4', '2023-03-25 01:40:21.400383'),
('9yrgi8v72ujklp3t8nj92ydqp4zzqwd2', '.eJw9zFsLgjAYBuD_MrwMMTUPXTUiQTthYnU725LFts-cMyj6782bbp_38EFGs14RydASFdC3LJijGeqI1i_oqUXHbxwvdMrL9RxtNCRZEebHdJuXGKdGNWu_PezpOOIhduOs3skqeOJ3Up_AjJV9UiCb_n9ugXRMCE7BElaUK7DGJOHCwmPqrIThup3EvYG06cAEu4OaFoEfxt4iStH3B1B7OrI:1psZVd:FazyAGj1McNTXmFVktB8dxufI6y-Gyhwvp8pn0Gt8rE', '2023-05-13 01:36:21.336608'),
('jwpws4ege3wzhlhz2l51w1t2z7p15yqj', '.eJw9zFsLgjAYBuD_MrwMMTUPXTUiQTthYnU725LFts-cMyj6782bbp_38EFGs14RydASFdC3LJijGeqI1i_oqUXHbxwvdMrL9RxtNCRZEebHdJuXGKdGNWu_PezpOOIhduOs3skqeOJ3Up_AjJV9UiCb_n9ugXRMCE7BElaUK7DGJOHCwmPqrIThup3EvYG06cAEu4OaFoEfxt4iStH3B1B7OrI:1pmO8U:ddnJjqANijwR7Sy9l6AbRcIMQ7HqEvWYvELfUG0dRX4', '2023-04-26 00:14:54.227855'),
('mqetc4d164hbvy8l3ak9keurjmd90w0o', 'e30:1paoDF:0h4mPIzNa6x3s1elaFpEYsXNzM8invZsyI54Tm7-g3M', '2023-03-25 01:39:57.861054'),
('oe6qv67ywz9u72payj5nbrsm4nbpoq6p', 'e30:1paoBu:Zi9jc7QKfuZoq_10w9lVIvAnwr8CdxDooSVOcUM_tbg', '2023-03-25 01:38:34.718746'),
('r9pc2j3unacvvpnl15hopp0d67gow0ea', 'e30:1pcsVN:Ae_-RHGGzSKZVHaKI18ETun96rGqhm-E5tQ_nzmk2nk', '2023-03-30 18:39:13.814794'),
('roqcpg8xmqxscfmbjvktfp7e80cycp7r', '.eJw9jMkKwjAUAH9FQo8i2tZqPYm4YHEXXI6peW1DlleTVBHx340XrzPDvEljwWiqgIzImjNqhgPSJjW19omGeRiEedCNA52lz41LT84WdhuXeSh2h0tTXqMoLBe1qNP7PC8fxV7E19XkXLDlJnEvf9KocvOf89ZScFtxRb2iNUjJGXqZNVpgyydouDegKJceHyvKYAoK9ewB8qXHFbqf6txQ-cyBhAL1bxCFST_uRT3y-QKZLEU9:1rPWFt:zI02w12H_wNkE59vckvEeeIlHtv2S7WWWiw-KoGcJpY', '2024-01-29 23:20:33.142170'),
('ywxvye8wjcg4vruobvub33tgdi98okna', '.eJw9zFsLgjAYBuD_MrwMMTUPXTUiQTthYnU725LFts-cMyj6782bbp_38EFGs14RydASFdC3LJijGeqI1i_oqUXHbxwvdMrL9RxtNCRZEebHdJuXGKdGNWu_PezpOOIhduOs3skqeOJ3Up_AjJV9UiCb_n9ugXRMCE7BElaUK7DGJOHCwmPqrIThup3EvYG06cAEu4OaFoEfxt4iStH3B1B7OrI:1phJ6l:UPhzjMuXFxp_QdpjYzlfxjSasy5awRd6sdyapZzebEA', '2023-04-11 23:52:07.136112'),
('zzmgzbrx13oizz16fo276twmgae30tix', 'e30:1pcsWT:KPT2qaHs9m-MT4rwwH1-x9XaqPukLQaKg39G4Z7YtsQ', '2023-03-30 18:40:21.774090');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elaboracion`
--

CREATE TABLE `elaboracion` (
  `id_elaboracion` int(20) NOT NULL,
  `descripcion_elaboracion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `elaboracion`
--

INSERT INTO `elaboracion` (`id_elaboracion`, `descripcion_elaboracion`) VALUES
(1, 'Se muele la masa para ser horneada ya luego de ser horneada se saca y se muele para ser amasada a mano o con un rodillo'),
(2, 'Se pone la pasta y se amasa'),
(3, 'Se hornea el molde para luego ser horneada y se le pone el quesillo se muele el ajo'),
(5, 'amazar la masa y se mete al horno'),
(8, 'Se hierve la carne para posteriormente amasar la harina luego poner salsa encima y hornear'),
(9, 'No Aplicable');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `jornada` varchar(20) NOT NULL,
  `sucursal_asignado` varchar(50) NOT NULL COMMENT 'llave foranea',
  `departamento_asignado` varchar(50) NOT NULL COMMENT 'llave foranea',
  `puesto_asignado` varchar(20) NOT NULL COMMENT 'llave foranea',
  `cargo_asignado` varchar(30) NOT NULL COMMENT 'llave foranea',
  `tipodedocumentos` varchar(30) NOT NULL COMMENT 'Llave Foranea',
  `numero_identificacion` varchar(40) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `nombre`, `apellido`, `telefono`, `jornada`, `sucursal_asignado`, `departamento_asignado`, `puesto_asignado`, `cargo_asignado`, `tipodedocumentos`, `numero_identificacion`, `fecha_registro`) VALUES
(1, 'Ethan', 'Armando', '88446955', 'Matutina', 'Blv.Fuerzas Armadas', 'Lempiras', 'Cocina', 'Contador', 'RTN', '0801200315744', '2023-03-10 01:36:21'),
(4, 'Anita', 'Barevientos', '99382070', 'Matutina', 'Blv.Fuerzas Armadas', 'Lempira', 'Cocina', 'Contador', 'DNI', '12345678A', '2023-03-19 04:01:40'),
(5, 'Edelman', 'Leiva', '32654131', 'Nocturna', 'Blv.Fuerzas Armadas', 'Lempiras', 'Cocina', 'Contador', 'DNI', '12345678A', '2023-03-19 15:11:58'),
(6, 'Jorge', 'Peres', '32654131', 'Matutina', 'Blv.Fuerzas Armadas', 'Lempiras', 'Cocina', 'Contador', 'Tarjeta de Residenci', 'A1234567', '2023-03-19 18:54:43'),
(7, 'Doman', 'Ramirez', '88446955', 'Matutina', 'Los Prinos', 'Lempiras', 'Contador', 'Contador', 'DNI', '12345678A', '2023-03-21 03:52:15'),
(14, 'Juan', 'lobo', '88446955', 'Matutina', 'Blv.Fuerzas Armadas', 'Lempiras', 'Cocina', 'Contador', 'DNI', 'AB00003', '2023-03-10 14:15:57'),
(16, 'Pedro', 'Castro', '32470569', 'Matutina', 'Blv.Fuerzas Armadas', 'Lempiras', 'Cocina', 'Contador', 'RTN', '0801200116789', '2023-03-16 05:06:13'),
(17, 'Douman Rodriguez', 'Flores Castro', '88446855', 'Matutina', 'Colonia Miraflores', 'Cortes', 'Limpieza', 'Limpieza', 'DNI', '0801200315744', '2023-04-20 18:33:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_pedido`
--

CREATE TABLE `estado_pedido` (
  `id_estado` int(50) NOT NULL,
  `descripcion_pedido` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado_pedido`
--

INSERT INTO `estado_pedido` (`id_estado`, `descripcion_pedido`) VALUES
(1, 'En Espera'),
(2, 'En Ejecucion'),
(3, 'Terminado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id_factura` int(50) NOT NULL,
  `codigo_cai` varchar(90) NOT NULL,
  `numero_factura` varchar(90) NOT NULL,
  `nombre_encargado` varchar(90) NOT NULL,
  `apellido_encargado` varchar(90) NOT NULL,
  `correo_encargado` varchar(90) NOT NULL,
  `telefono_encargado` varchar(90) NOT NULL,
  `nombre_cliente` varchar(90) NOT NULL,
  `menu_cantidades` varchar(90) NOT NULL,
  `tamaño_menu` varchar(90) NOT NULL,
  `estado_pedido` varchar(90) NOT NULL,
  `fecha_realizacion_pedido` varchar(90) DEFAULT NULL,
  `descuento` varchar(90) NOT NULL,
  `isv` varchar(90) NOT NULL,
  `metodo_pago` varchar(90) NOT NULL,
  `numero_tarjeta` varchar(90) NOT NULL,
  `cantidad_pagar` varchar(90) NOT NULL,
  `total_pagar` varchar(90) NOT NULL,
  `cambio` varchar(50) NOT NULL,
  `fecha_emision` varchar(50) NOT NULL COMMENT 'SAR',
  `fecha_final` varchar(50) NOT NULL COMMENT 'SAR',
  `numero_inicial` varchar(50) NOT NULL COMMENT 'SAR',
  `numero_final` varchar(50) NOT NULL COMMENT 'SAR',
  `dni_cliente` varchar(50) NOT NULL COMMENT 'dni del cliente',
  `impuesto` varchar(50) NOT NULL COMMENT 'acumulado imp'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id_factura`, `codigo_cai`, `numero_factura`, `nombre_encargado`, `apellido_encargado`, `correo_encargado`, `telefono_encargado`, `nombre_cliente`, `menu_cantidades`, `tamaño_menu`, `estado_pedido`, `fecha_realizacion_pedido`, `descuento`, `isv`, `metodo_pago`, `numero_tarjeta`, `cantidad_pagar`, `total_pagar`, `cambio`, `fecha_emision`, `fecha_final`, `numero_inicial`, `numero_final`, `dni_cliente`, `impuesto`) VALUES
(127, 'A1B2-C3D4-E5F6-G7H8-I9J0-K1L2-M3N4', '004-005-10-00341', 'Midari Ikishima', 'Junko Midori', 'ShadeDemonEvelyn@hotmail.com', '32654131', 'Ethan Armando', '(1)xPepsi Zero', 'Individual', 'Terminado', '2024-03-30', '0.00', '0', 'tarjeta', '************1234', '59.00', '59', '0.00', '2023-03-29', '2023-03-31', '10', '500', '0801200315744', '9'),
(128, 'A1B2-C3D4-E5F6-G7H8-I9J0-K1L2-M3N4', '004-005-10-00342', 'Midari Ikishima', 'Junko Midori', 'ShadeDemonEvelyn@hotmail.com', '32654131', 'Noe Ramirez', '(1)xCalzones\r\n(1)xPepsi Zero\r\n(1)xCocas Colas', 'Individual\r\nParejas\r\nIndividual', 'Terminado', '2024-03-30', '0.00', '150.0', 'mixto', '************1234', '67.00', '217', '0.00', '2023-03-29', '2023-03-31', '10', '500', '1234567891234', '27'),
(132, 'A1B2-C3D4-E5F6-G7H8-I9J0-K1L2-M3N4', '004-005-10-00346', 'Midari Ikishima', 'Junko Midori', 'ShadeDemonEvelyn@hotmail.com', '32654131', 'Ethan Armando', '(1)xHongos\r\n(1)xPepsi Zero', 'Individual\r\nIndividual', 'Terminado', '2024-03-30', '0.00', '0', 'efectivo', '************', '250', '231.5', '18.50', '2023-03-29', '2023-03-31', '10', '500', '0801200315744', '31.5'),
(133, 'A1B2-C3D4-E5F6-G7H8-I9J0-K1L2-M3N4', '004-005-10-00347', 'Midari Ikishima', 'Junko Midori', 'ShadeDemonEvelyn@hotmail.com', '32654131', 'Noe Ramirez', '(1)xHongos\r\n(1)xCocas Colas', 'Individual\r\nIndividual', 'Terminado', '2024-03-30', '0.00', '0', 'tarjeta', '************1234', '192.50', '192.5', '0.00', '2023-03-29', '2023-03-31', '10', '500', '1234567891234', '22.5'),
(134, 'A1B2-C3D4-E5F6-G7H8-I9J0-K1L2-M3N4', '004-005-10-00348', 'Midari Ikishima', 'Junko Midori', 'ShadeDemonEvelyn@hotmail.com', '32654131', 'Edelman Leiva', '(2)xCalzones\r\n(2)xPepsi Zero', 'Individual\r\nIndividual', 'Terminado', '2024-03-31', '0.00', '100.0', 'mixto', '************1234', '294.00', '394', '0.00', '2023-03-29', '2023-03-31', '10', '500', '0801200215712', '54'),
(135, 'A1B2-C3D4-E5F6-G7H8-I9J0-K1L2-M3N4', '004-005-10-00349', 'Midari Ikishima', 'Junko Midori', 'ShadeDemonEvelyn@hotmail.com', '32654131', 'Ada Lopez', '(1)xBacon Cheese\r\n(1)xCocas Colas', 'Individual\r\nIndividual', 'Terminado', '2024-03-31', '0.00', '0', 'efectivo', '************', '150', '145.35', '4.65', '2023-03-29', '2023-03-31', '10', '500', '0801200313890', '16.35'),
(136, 'A1B2-C3D4-E5F6-G7H8-I9J0-K1L2-M3N4', '004-005-10-00350', 'Midari Ikishima', 'Junko Midori', 'ShadeDemonEvelyn@hotmail.com', '32654131', 'Sanchez Lopez', '(1)xCrazy Puffs\r\n(1)xCocas Colas', 'Individual\r\nIndividual', 'Terminado', '2024-04-02', '0.00', '50.0', 'mixto', '************2413', '56.82', '106.82', '0.00', '2023-03-29', '2023-03-31', '10', '500', '0908012345671', '11.32'),
(137, 'A1B2-C3D4-E5F6-G7H8-I9J0-K1L2-M3N4', '004-005-10-00351', 'Jorge Andino', 'Cruz Andino', 'jorge@luisgmail.com', '32470569', 'Edelman Leiva', '(2)xCrazy Puffs\r\n(1)xPepsi Zero', 'Individual\r\nIndividual', 'Terminado', '2024-04-11', '0.00', '100.0', 'mixto', '************1234', '132.65', '232.65', '0.00', '2023-03-29', '2023-03-31', '10', '500', '0801200215712', '31.65'),
(138, 'A1B2-C3D4-E5F6-G7H8-I9J0-K1L2-M3N4', '004-005-10-00352', 'Edelman Davidovich', 'Leiva Gonzalez', 'Edelman21@gmail.com', '87722631', 'Julio Lopez', '(1)xHongos\r\n(1)xPepsi Zero', 'Individual\r\nIndividual', 'Terminado', '2024-05-27', '0.00', '0', 'tarjeta', '************4567', '231.50', '231.5', '0.00', '2023-03-29', '2023-03-31', '10', '500', '0826195600003', '31.5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `familia_producto`
--

CREATE TABLE `familia_producto` (
  `id_familia_producto` int(30) NOT NULL,
  `nombre_familia` varchar(50) NOT NULL,
  `descripcion_familia` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `familia_producto`
--

INSERT INTO `familia_producto` (`id_familia_producto`, `nombre_familia`, `descripcion_familia`) VALUES
(1, 'Secosas', 'Queso y quesillo'),
(2, 'Lacteos', 'Leche unicamente'),
(3, 'Carnes', 'aves de todo tipo'),
(35, 'Embutidos', 'Chorizos,Salamis,Chanchos'),
(36, 'Refrescos', 'Gaseosas y Jugos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historico_menu`
--

CREATE TABLE `historico_menu` (
  `id_historico` int(50) NOT NULL,
  `nombre_menu` varchar(100) NOT NULL COMMENT 'Llave Foranea',
  `fecha_inicio` date NOT NULL DEFAULT current_timestamp(),
  `fecha_final` date DEFAULT NULL,
  `precio_menu` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historico_menu`
--

INSERT INTO `historico_menu` (`id_historico`, `nombre_menu`, `fecha_inicio`, `fecha_final`, `precio_menu`) VALUES
(97, 'Calzones', '2023-03-28', '2023-03-28', '99'),
(98, 'Calzones', '2023-03-28', NULL, '120'),
(99, 'Hongos', '2023-03-28', '2023-03-28', '120'),
(100, 'Hongos', '2023-03-28', NULL, '150'),
(101, 'Pepsi Zero', '2023-04-25', NULL, '50'),
(102, 'Cocas Colas', '2023-04-25', NULL, '20'),
(103, 'Bacon Cheese', '2024-03-31', NULL, '109'),
(104, 'Crazy Puffs', '2024-04-02', NULL, '75.50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historico_producto`
--

CREATE TABLE `historico_producto` (
  `id_historico` int(20) NOT NULL,
  `nombre_producto` varchar(50) NOT NULL COMMENT 'llave foranea productos',
  `precio_producto` varchar(50) NOT NULL COMMENT 'llave foranea productos',
  `fecha_inicio` date NOT NULL DEFAULT current_timestamp(),
  `fecha_final` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historico_producto`
--

INSERT INTO `historico_producto` (`id_historico`, `nombre_producto`, `precio_producto`, `fecha_inicio`, `fecha_final`) VALUES
(2, 'Queso Sula', '150', '2023-03-28', '2023-03-28'),
(3, 'Queso Sula', '99', '2023-03-28', '2023-04-01'),
(4, 'Queso Sula', '100', '2023-04-01', NULL),
(5, 'Salamis tribu', '99', '2023-04-20', '2023-04-20'),
(6, 'Salamis tribu', '80', '2023-04-20', NULL),
(7, 'Pepsi Zero', '50', '2023-04-25', NULL),
(9, 'Cocas Colas', '20', '2023-04-25', NULL),
(10, 'Harina Maseca', '50', '2024-03-31', NULL),
(11, 'Harina Integral', '90.50', '2024-04-02', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impuesto`
--

CREATE TABLE `impuesto` (
  `id_impuesto` int(40) NOT NULL,
  `impuesto` varchar(50) NOT NULL,
  `fecha_inicio` date NOT NULL DEFAULT current_timestamp(),
  `fecha_final` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `impuesto`
--

INSERT INTO `impuesto` (`id_impuesto`, `impuesto`, `fecha_inicio`, `fecha_final`) VALUES
(4, '0.18', '2023-04-11', '2023-04-11'),
(5, '0.19', '2023-04-11', '2023-04-11'),
(6, '0.16', '2023-04-11', '2023-04-11'),
(8, '0.14', '2023-04-20', '2023-04-21'),
(9, '0.15', '2023-04-21', '2023-04-25'),
(10, '0.00', '2023-04-25', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impuesto_historico`
--

CREATE TABLE `impuesto_historico` (
  `id_historico` int(40) NOT NULL,
  `impuesto` varchar(50) NOT NULL,
  `fecha_inicio` date NOT NULL DEFAULT current_timestamp(),
  `fecha_final` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id_inventario` int(20) NOT NULL,
  `producto` varchar(50) NOT NULL COMMENT 'Tiene que venir de la tabla de productos',
  `cantidad_actual` varchar(50) NOT NULL,
  `cantidad_minima` varchar(50) NOT NULL,
  `cantidad_maxima` varchar(50) NOT NULL,
  `unidad_de_medida` varchar(50) NOT NULL,
  `menu_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id_inventario`, `producto`, `cantidad_actual`, `cantidad_minima`, `cantidad_maxima`, `unidad_de_medida`, `menu_id`) VALUES
(3, 'Queso Sula', '15', '50', '200', 'Gr', 'Calzones'),
(5, 'Salamis tribu', '14', '50', '200', 'Gr', 'Hongos'),
(6, 'Pepsi Zero', '11', '50', '200', 'Lbs', 'Pepsi Zero'),
(7, 'Cocas Colas', '73', '50', '200', 'Gr', 'Cocas Colas'),
(8, 'Harina Maseca', '99', '20', '150', 'Gr', 'Bacon Cheese'),
(9, 'Harina Integral', '98', '50', '100', 'Gr', 'Crazy Puffs');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(20) NOT NULL,
  `nombre_menu` varchar(50) NOT NULL,
  `precio_menu` varchar(50) NOT NULL,
  `descripcion_menu` text NOT NULL,
  `modo_elaboracion` varchar(30) NOT NULL,
  `impuesto` varchar(50) NOT NULL COMMENT 'tabla_impuestos'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id_menu`, `nombre_menu`, `precio_menu`, `descripcion_menu`, `modo_elaboracion`, `impuesto`) VALUES
(2, 'Calzones', '120', 'hecho con pasta milanesa', 'Se muele la masa para ser horn', '0.15'),
(3, 'Hongos', '150', 'pizza rellena de crema de hongos', 'Se muele la masa para ser horn', '0.15'),
(5, 'Pepsi Zero', '50', 'Gaseosa', 'No Aplicable', '0.18'),
(6, 'Cocas Colas', '20', 'Gaseosa', 'No Aplicable', '0.00'),
(7, 'Bacon Cheese', '109', 'Bacon Cheese Bread\r\n', 'Se pone la pasta y se amasa', '0.15'),
(8, 'Crazy Puffs', '75.50', 'piezas de pan rellenas de pepperoni', 'Se pone la pasta y se amasa', '0.15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_pago`
--

CREATE TABLE `metodo_pago` (
  `id_metodo_pago` int(100) NOT NULL,
  `forma_pago` varchar(50) NOT NULL,
  `moneda` varchar(40) NOT NULL,
  `fecha_pago` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `metodo_pago`
--

INSERT INTO `metodo_pago` (`id_metodo_pago`, `forma_pago`, `moneda`, `fecha_pago`) VALUES
(1, 'tarjeta', 'lps', '2023-03-20'),
(2, 'efectivo', 'lps', '2023-03-20'),
(3, 'mixto', 'lps', '2023-03-29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(40) NOT NULL,
  `nombre_cliente` varchar(50) NOT NULL,
  `dni_cliente` varchar(50) NOT NULL,
  `nombre_menu` text NOT NULL,
  `tamaño_menu` varchar(250) NOT NULL,
  `estado_pedido` varchar(40) NOT NULL,
  `cantidades` varchar(250) NOT NULL,
  `fecha_pedido` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `nombre_cliente`, `dni_cliente`, `nombre_menu`, `tamaño_menu`, `estado_pedido`, `cantidades`, `fecha_pedido`) VALUES
(59, 'Ethan Armando', '0801200315744', '(1)xPepsi Zero', 'Individual', 'Terminado', '(1)', '2024-03-30'),
(60, 'Noe Ramirez', '1234567891234', '(1)xCalzones\n(1)xPepsi Zero\n(1)xCocas Colas', 'Individual\nParejas\nIndividual', 'Terminado', '(1),(1),(1)', '2024-03-30'),
(61, 'Ethan Armando', '0801200315744', '(1)xHongos\n(1)xPepsi Zero', 'Individual\nIndividual', 'Terminado', '(1),(1)', '2024-03-30'),
(62, 'Noe Ramirez', '1234567891234', '(1)xHongos\n(1)xCocas Colas', 'Individual\nIndividual', 'Terminado', '(1),(1)', '2024-03-30'),
(63, 'Edelman Leiva', '0801200215712', '(2)xCalzones\n(2)xPepsi Zero', 'Individual\nIndividual', 'Terminado', '(2),(2)', '2024-03-31'),
(64, 'Ada Lopez', '0801200313890', '(1)xBacon Cheese\n(1)xCocas Colas', 'Individual\nIndividual', 'Terminado', '(1),(1)', '2024-03-31'),
(65, 'Sanchez Lopez', '0908012345671', '(1)xCrazy Puffs\n(1)xCocas Colas', 'Individual\nIndividual', 'Terminado', '(1),(1)', '2024-04-02'),
(66, 'Edelman Leiva', '0801200215712', '(2)xCrazy Puffs\n(1)xPepsi Zero', 'Individual\nIndividual', 'Terminado', '(2),(1)', '2024-04-11'),
(67, 'Julio Lopez', '0826195600003', '(1)xHongos\n(1)xPepsi Zero', 'Individual\nIndividual', 'Terminado', '(1),(1)', '2024-05-27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(20) NOT NULL COMMENT 'llave primaria ',
  `nombre_producto` varchar(50) NOT NULL COMMENT 'nombre del producto',
  `id_categoria` varchar(50) NOT NULL COMMENT 'llave foranea categoria',
  `almacen_id` varchar(50) NOT NULL COMMENT 'llave foranea almacen',
  `familia_id` varchar(50) NOT NULL COMMENT 'llave foranea familia',
  `menu_id` varchar(50) NOT NULL COMMENT 'llave foranea menu',
  `provedor_id` varchar(50) NOT NULL COMMENT 'Llave foranea Provedores',
  `precio_producto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre_producto`, `id_categoria`, `almacen_id`, `familia_id`, `menu_id`, `provedor_id`, `precio_producto`) VALUES
(3, 'Queso Sula', 'Quesos', 'Secos', 'Secosas', 'Hongos', 'Pedro', '100'),
(4, 'Salamis tribu', 'Carnes', 'carnes', 'Carnes', 'Calzones', 'Pedro Ernesto', '80'),
(5, 'Pepsi Zero', 'Carnes', 'Secos', 'Secosas', 'Pepsi Zero', 'Fujitsu Juan', '50'),
(7, 'Cocas Colas', 'Gaseosas', 'Bebidas', 'Refrescos', 'Cocas Colas', 'Pedro Ernesto', '20'),
(8, 'Harina Maseca', 'Panes', 'Pan', 'Secosas', 'Bacon Cheese', 'Ada Juarez', '50'),
(9, 'Harina Integral', 'Panes', 'harinas', 'Secosas', 'Crazy Puffs', 'Fujitsu Juan', '90.50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promociones`
--

CREATE TABLE `promociones` (
  `id_promocion` int(50) NOT NULL,
  `nombre_promocion` varchar(50) NOT NULL,
  `menu_id` text NOT NULL COMMENT 'Llave Foranea',
  `precio_oferta` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `tiempo_inicio` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_final` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `promociones`
--

INSERT INTO `promociones` (`id_promocion`, `nombre_promocion`, `menu_id`, `precio_oferta`, `descripcion`, `tiempo_inicio`, `fecha_final`) VALUES
(3, 'Pizza Suprema', 'Hongos', '100', 'Pizza grande supremacia', '2023-04-16 00:00:00', '2023-04-30'),
(4, 'Calzonada doble', 'Calzones', '99', 'Calzones a 2 x 1', '2023-04-16 00:00:00', '2023-04-26'),
(6, 'Hongos Triples', 'Hongos', '100', 'Hongeate el Triple', '2023-04-20 00:00:00', '2023-04-28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provedores`
--

CREATE TABLE `provedores` (
  `id_provedor` int(40) NOT NULL COMMENT 'Llave primaria',
  `nombre_provedor` varchar(50) NOT NULL,
  `apellido_provedor` varchar(50) NOT NULL,
  `compañia_provevdor` varchar(50) NOT NULL,
  `telefono_provedor` varchar(50) NOT NULL,
  `email_provedor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `provedores`
--

INSERT INTO `provedores` (`id_provedor`, `nombre_provedor`, `apellido_provedor`, `compañia_provevdor`, `telefono_provedor`, `email_provedor`) VALUES
(1, 'Jorge', 'Apellido', 'Bimbo ', '88446955', 'jorge@andino.com'),
(3, 'Pedro Ernesto', 'Sanchez Juarez', 'Suli', '32470569', 'Pedro@gmail.com'),
(4, 'Ada Juarez', 'Sanchez Perez', 'Gran dia', '99382070', 'Ada@ujcv.edu.hn'),
(5, 'Fujitsu Juan', 'Juancho Jose', 'Chino', '32654131', 'Fu21@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puesto`
--

CREATE TABLE `puesto` (
  `puesto_id` int(50) NOT NULL,
  `puesto` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `puesto`
--

INSERT INTO `puesto` (`puesto_id`, `puesto`, `descripcion`) VALUES
(1, 'Cocina', 'Elaborar Comida del menu'),
(2, 'Contador', 'Suma de Ingresos de lo que sale y entra en la empr'),
(5, 'Gerente', 'Dirige al nuevo grupo'),
(7, 'Secretaria', 'Manejo de ingresos fuera de la empresa'),
(8, 'Administrador', 'Se encarga de Demandar trabajo'),
(10, 'Limpieza', 'Limpia el Desastre de la Cocina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta`
--

CREATE TABLE `receta` (
  `id_receta` int(20) NOT NULL,
  `nombre_receta` varchar(100) NOT NULL,
  `menu_id` varchar(50) NOT NULL,
  `descripcion_receta` text NOT NULL,
  `porciones_receta` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `receta`
--

INSERT INTO `receta` (`id_receta`, `nombre_receta`, `menu_id`, `descripcion_receta`, `porciones_receta`) VALUES
(1, 'pizza rellena con queso   ', 'Hongos', 'se realiza un conteo blah blah blah', '4-porciones'),
(2, 'Calzones  ', 'Peperoni', 'pizza comun y corriente', '8-porciones'),
(37, 'Hongos Vaporwave', 'Hongos', 'Pizza Colorida', '4-porciones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservaciones`
--

CREATE TABLE `reservaciones` (
  `id_reservacion` int(20) NOT NULL,
  `nombre_reservante` varchar(50) NOT NULL,
  `nombre_sucursal` varchar(50) NOT NULL COMMENT 'Llave Foranea',
  `numero_mesas` varchar(20) NOT NULL,
  `fecha_reserva` date NOT NULL,
  `fecha_llegada` date NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservaciones`
--

INSERT INTO `reservaciones` (`id_reservacion`, `nombre_reservante`, `nombre_sucursal`, `numero_mesas`, `fecha_reserva`, `fecha_llegada`, `descripcion`) VALUES
(4, 'Ada Lopez', 'Los Prinos', '2', '2023-04-20', '2023-04-29', 'Llegara mi Familia'),
(5, 'Noe Ramirez', 'Calle 3 Toncontin', '7', '2023-04-20', '2023-04-22', 'llegare solo y con aishly'),
(6, 'Edelman Leiva', 'Blv.Fuerzas Armadas', '2', '2023-04-21', '2023-04-28', 'Llegare con los pibes a comer');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sar`
--

CREATE TABLE `sar` (
  `id_sar` int(50) NOT NULL,
  `codigo_sar` varchar(100) NOT NULL,
  `fecha_emision` date NOT NULL,
  `fecha_final` date DEFAULT NULL,
  `numero_inicial` varchar(50) NOT NULL,
  `numero_final` varchar(50) NOT NULL,
  `consecutivo` varchar(80) NOT NULL,
  `cod_sucursal` varchar(50) NOT NULL COMMENT 'Llave foranea con sucursal',
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sar`
--

INSERT INTO `sar` (`id_sar`, `codigo_sar`, `fecha_emision`, `fecha_final`, `numero_inicial`, `numero_final`, `consecutivo`, `cod_sucursal`, `descripcion`) VALUES
(7, 'A1B2-C3D4-E5F6-G7H8-I9J0-K1L2-M3N4', '2023-03-29', '2023-03-31', '10', '500', '352', '5', 'CAI Validado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `id_sucursal` int(20) NOT NULL,
  `direccion_sucursal` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`id_sucursal`, `direccion_sucursal`, `descripcion`) VALUES
(1, 'Blv.Fuerzas Armadas', 'Falta pagar deudas'),
(4, 'Los Prinos', 'Nos han embargado'),
(5, 'Calle 3 Toncontin', 'Las compras han rebajado endeudado'),
(6, 'Choluteca Calle 21 Av.Juanalaines', 'La sucursal mas poblada de todo latinoamerica'),
(7, 'Colonia Miraflores', 'Enfrente del Mercadito CHW');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodocumentosemp`
--

CREATE TABLE `tipodocumentosemp` (
  `id` int(20) NOT NULL,
  `tipo_identificacion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipodocumentosemp`
--

INSERT INTO `tipodocumentosemp` (`id`, `tipo_identificacion`) VALUES
(1, 'RTN'),
(2, 'DNI'),
(6, 'Pasaporte'),
(8, 'Tarjeta de Residenci');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id_usuario` int(40) NOT NULL,
  `username` varchar(50) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `email` varchar(60) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `password` varchar(120) NOT NULL,
  `intentos` int(11) NOT NULL,
  `bloqueado` tinyint(1) NOT NULL,
  `fecha_modificacion` date NOT NULL DEFAULT current_timestamp(),
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `password_reset_token` varchar(255) DEFAULT NULL,
  `roles` varchar(120) NOT NULL COMMENT 'ROL DEL USUARIO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_usuario`, `username`, `nombre`, `apellido`, `telefono`, `email`, `estado`, `password`, `intentos`, `bloqueado`, `fecha_modificacion`, `fecha_creacion`, `password_reset_token`, `roles`) VALUES
(124, 'JorgeA24', 'Jorge Andino', 'Cruz Andino', '32470569', 'jorge@luisgmail.com', 'Activo', '$2b$04$aGZnVGaMPXKjz.zP3p8Bce9wiw.qIA.EgWnuRjfjSqKGLJyf5pAeK', 0, 0, '2024-05-07', '2024-04-09 06:00:00', NULL, 'Cliente'),
(132, 'Midar87', 'Midari Ikishima', 'Junko Midori', '32654131', 'Juana@12gmail.com', 'Activo', '$2b$04$Fobyk4M.s8BqMPuH7tz5beHVeBVhC4c7/jqZqOg74kEuxWpToSR4O', 0, 0, '2024-05-23', '2023-04-19 06:00:00', '52d108dc6c847c73cc66a541e87858f076d789efb0aaa8c46f16953c08428416', 'Empleado'),
(133, 'Juan24', 'Andrea Jauna', 'Juana Lainez', '99382170', 'ethan.cardona@ujcv.edu.hn', 'Activo', '$2b$04$W6Yui3foCwkSONBpPhToxuLvw9LSJgEaTNEP7XPxfgBK/dEO.iJni', 0, 0, '2024-05-27', '2024-04-12 06:00:00', '53b100a30a9a2ec4af9b3dfd0709f724f024d14bdeea4f6121eec643523c0096', 'Administrador'),
(134, 'Edelman21', 'Edelman Davidovich', 'Leiva Gonzalez', '87722631', 'Edelman21@gmail.com', 'Activo', '$2b$04$1LIv6AAQum6Ti6AVZlLqHOBitMywzLIQCi65jGOkry0pH4PrV1iYC', 0, 0, '2024-06-01', '2024-04-17 06:00:00', NULL, 'Administrador');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD PRIMARY KEY (`id_almacen`);

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`categoria_id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id_departamento`);

--
-- Indices de la tabla `descuentos`
--
ALTER TABLE `descuentos`
  ADD PRIMARY KEY (`id_descuento`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id_detalle`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `elaboracion`
--
ALTER TABLE `elaboracion`
  ADD PRIMARY KEY (`id_elaboracion`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `estado_pedido`
--
ALTER TABLE `estado_pedido`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_factura`);

--
-- Indices de la tabla `familia_producto`
--
ALTER TABLE `familia_producto`
  ADD PRIMARY KEY (`id_familia_producto`);

--
-- Indices de la tabla `historico_menu`
--
ALTER TABLE `historico_menu`
  ADD PRIMARY KEY (`id_historico`);

--
-- Indices de la tabla `historico_producto`
--
ALTER TABLE `historico_producto`
  ADD PRIMARY KEY (`id_historico`);

--
-- Indices de la tabla `impuesto`
--
ALTER TABLE `impuesto`
  ADD PRIMARY KEY (`id_impuesto`);

--
-- Indices de la tabla `impuesto_historico`
--
ALTER TABLE `impuesto_historico`
  ADD PRIMARY KEY (`id_historico`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id_inventario`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indices de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  ADD PRIMARY KEY (`id_metodo_pago`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `promociones`
--
ALTER TABLE `promociones`
  ADD PRIMARY KEY (`id_promocion`);

--
-- Indices de la tabla `provedores`
--
ALTER TABLE `provedores`
  ADD PRIMARY KEY (`id_provedor`);

--
-- Indices de la tabla `puesto`
--
ALTER TABLE `puesto`
  ADD PRIMARY KEY (`puesto_id`);

--
-- Indices de la tabla `receta`
--
ALTER TABLE `receta`
  ADD PRIMARY KEY (`id_receta`);

--
-- Indices de la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  ADD PRIMARY KEY (`id_reservacion`);

--
-- Indices de la tabla `sar`
--
ALTER TABLE `sar`
  ADD PRIMARY KEY (`id_sar`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`id_sucursal`);

--
-- Indices de la tabla `tipodocumentosemp`
--
ALTER TABLE `tipodocumentosemp`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `almacen`
--
ALTER TABLE `almacen`
  MODIFY `id_almacen` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `categoria_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id_departamento` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT de la tabla `descuentos`
--
ALTER TABLE `descuentos`
  MODIFY `id_descuento` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id_detalle` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `elaboracion`
--
ALTER TABLE `elaboracion`
  MODIFY `id_elaboracion` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `estado_pedido`
--
ALTER TABLE `estado_pedido`
  MODIFY `id_estado` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id_factura` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT de la tabla `familia_producto`
--
ALTER TABLE `familia_producto`
  MODIFY `id_familia_producto` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `historico_menu`
--
ALTER TABLE `historico_menu`
  MODIFY `id_historico` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT de la tabla `historico_producto`
--
ALTER TABLE `historico_producto`
  MODIFY `id_historico` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `impuesto`
--
ALTER TABLE `impuesto`
  MODIFY `id_impuesto` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `impuesto_historico`
--
ALTER TABLE `impuesto_historico`
  MODIFY `id_historico` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1960;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id_inventario` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  MODIFY `id_metodo_pago` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(20) NOT NULL AUTO_INCREMENT COMMENT 'llave primaria ', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `promociones`
--
ALTER TABLE `promociones`
  MODIFY `id_promocion` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `provedores`
--
ALTER TABLE `provedores`
  MODIFY `id_provedor` int(40) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `puesto`
--
ALTER TABLE `puesto`
  MODIFY `puesto_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `receta`
--
ALTER TABLE `receta`
  MODIFY `id_receta` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  MODIFY `id_reservacion` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `sar`
--
ALTER TABLE `sar`
  MODIFY `id_sar` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `id_sucursal` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tipodocumentosemp`
--
ALTER TABLE `tipodocumentosemp`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_usuario` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
