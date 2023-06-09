USE [master]
GO
/****** Object:  Database [uchebka]    Script Date: 14.03.2023 11:43:36 ******/
CREATE DATABASE [uchebka]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'uchebka', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\uchebka.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'uchebka_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\uchebka_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [uchebka] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [uchebka].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [uchebka] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [uchebka] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [uchebka] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [uchebka] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [uchebka] SET ARITHABORT OFF 
GO
ALTER DATABASE [uchebka] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [uchebka] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [uchebka] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [uchebka] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [uchebka] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [uchebka] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [uchebka] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [uchebka] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [uchebka] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [uchebka] SET  DISABLE_BROKER 
GO
ALTER DATABASE [uchebka] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [uchebka] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [uchebka] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [uchebka] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [uchebka] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [uchebka] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [uchebka] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [uchebka] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [uchebka] SET  MULTI_USER 
GO
ALTER DATABASE [uchebka] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [uchebka] SET DB_CHAINING OFF 
GO
ALTER DATABASE [uchebka] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [uchebka] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [uchebka] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [uchebka] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [uchebka] SET QUERY_STORE = ON
GO
ALTER DATABASE [uchebka] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [uchebka]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 14.03.2023 11:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[surname] [varchar](50) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[patronimyc] [varchar](50) NOT NULL,
	[id_dolgj] [int] NOT NULL,
	[id_admin] [nvarchar](50) NOT NULL,
	[photo_admin] [varchar](max) NOT NULL,
 CONSTRAINT [PK_admin] PRIMARY KEY CLUSTERED 
(
	[id_admin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[adress_client]    Script Date: 14.03.2023 11:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adress_client](
	[id_strana] [int] NOT NULL,
	[id_gorod] [int] NOT NULL,
	[id_ulicta] [int] NOT NULL,
	[number_house] [varchar](50) NOT NULL,
	[number_kvartira] [varchar](50) NOT NULL,
	[id_adress_client] [int] NOT NULL,
 CONSTRAINT [PK_adress_client] PRIMARY KEY CLUSTERED 
(
	[id_adress_client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[client]    Script Date: 14.03.2023 11:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client](
	[id_client] [nvarchar](100) NOT NULL,
	[Surname] [varchar](50) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[patronimyc] [varchar](50) NOT NULL,
	[id_gender] [int] NOT NULL,
	[birthday] [date] NOT NULL,
	[number_phone] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[id_adress_client] [int] NOT NULL,
	[adress_projiv] [varchar](50) NOT NULL,
	[pasport] [varchar](50) NOT NULL,
	[kod_podrazd] [varchar](50) NOT NULL,
	[kem_vidan] [varchar](100) NOT NULL,
	[date_vidachi] [date] NOT NULL,
	[nubmer_dogovora] [varchar](50) NOT NULL,
	[date_zaklyucheniya] [date] NOT NULL,
	[id_contract] [int] NOT NULL,
	[prichina_rastorgj] [varchar](50) NULL,
	[lictev_chet] [varchar](50) NOT NULL,
	[date_raztorjg_dogovora] [date] NULL,
	[date_podpisaniya] [date] NULL,
	[number_oborud] [varchar](50) NULL,
 CONSTRAINT [PK_client] PRIMARY KEY CLUSTERED 
(
	[id_client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[client_oborud]    Script Date: 14.03.2023 11:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client_oborud](
	[number_oborud] [nvarchar](50) NOT NULL,
	[name] [varchar](max) NOT NULL,
 CONSTRAINT [PK_client_oborud] PRIMARY KEY CLUSTERED 
(
	[number_oborud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[client_uslugi]    Script Date: 14.03.2023 11:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client_uslugi](
	[id_client] [nvarchar](100) NOT NULL,
	[id_uslugi] [int] NOT NULL,
 CONSTRAINT [PK_client_uslugi] PRIMARY KEY CLUSTERED 
(
	[id_client] ASC,
	[id_uslugi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contract type]    Script Date: 14.03.2023 11:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contract type](
	[name] [varchar](50) NOT NULL,
	[id_contract] [int] NOT NULL,
 CONSTRAINT [PK_contract type] PRIMARY KEY CLUSTERED 
(
	[id_contract] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dolgjnost]    Script Date: 14.03.2023 11:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dolgjnost](
	[name] [varchar](50) NOT NULL,
	[id_dolgj] [int] NOT NULL,
 CONSTRAINT [PK_dolgjnost] PRIMARY KEY CLUSTERED 
(
	[id_dolgj] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gender]    Script Date: 14.03.2023 11:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gender](
	[name] [varchar](50) NOT NULL,
	[id_gender] [int] NOT NULL,
 CONSTRAINT [PK_gender] PRIMARY KEY CLUSTERED 
(
	[id_gender] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gorod]    Script Date: 14.03.2023 11:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gorod](
	[name] [varchar](50) NOT NULL,
	[id_gorod] [int] NOT NULL,
 CONSTRAINT [PK_gorod] PRIMARY KEY CLUSTERED 
(
	[id_gorod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[info_admin]    Script Date: 14.03.2023 11:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[info_admin](
	[id_info] [int] NOT NULL,
	[id_dolgj] [int] NOT NULL,
	[info] [varchar](max) NULL,
 CONSTRAINT [PK_info_admin] PRIMARY KEY CLUSTERED 
(
	[id_info] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[magistral]    Script Date: 14.03.2023 11:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[magistral](
	[number_magistral] [nvarchar](50) NOT NULL,
	[name] [varchar](max) NOT NULL,
 CONSTRAINT [PK_magistral] PRIMARY KEY CLUSTERED 
(
	[number_magistral] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rayoun]    Script Date: 14.03.2023 11:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rayoun](
	[id_rayoun] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[plosdad] [float] NOT NULL,
	[naselenie] [int] NOT NULL,
	[kolvo_stancii] [int] NOT NULL,
	[id_type_zastroiki] [int] NOT NULL,
 CONSTRAINT [PK_rayoun] PRIMARY KEY CLUSTERED 
(
	[id_rayoun] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seti_dostupa]    Script Date: 14.03.2023 11:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seti_dostupa](
	[number_dostupa] [nvarchar](50) NOT NULL,
	[id_seti] [int] NOT NULL,
 CONSTRAINT [PK_seti_dostupa_1] PRIMARY KEY CLUSTERED 
(
	[number_dostupa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seti_name]    Script Date: 14.03.2023 11:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seti_name](
	[name] [varchar](max) NOT NULL,
	[id_seti] [int] NOT NULL,
 CONSTRAINT [PK_seti_name] PRIMARY KEY CLUSTERED 
(
	[id_seti] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status]    Script Date: 14.03.2023 11:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status](
	[name] [varchar](50) NOT NULL,
	[id_status] [int] NOT NULL,
 CONSTRAINT [PK_status] PRIMARY KEY CLUSTERED 
(
	[id_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[strana]    Script Date: 14.03.2023 11:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[strana](
	[name] [varchar](50) NOT NULL,
	[id_strana] [int] NOT NULL,
 CONSTRAINT [PK_strana] PRIMARY KEY CLUSTERED 
(
	[id_strana] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[type_problem]    Script Date: 14.03.2023 11:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type_problem](
	[name] [varchar](50) NOT NULL,
	[id_type_problem] [int] NOT NULL,
 CONSTRAINT [PK_type_problem] PRIMARY KEY CLUSTERED 
(
	[id_type_problem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[type_uslugi]    Script Date: 14.03.2023 11:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type_uslugi](
	[name] [varchar](50) NOT NULL,
	[id_type_uslugi] [int] NOT NULL,
 CONSTRAINT [PK_type_uslugi] PRIMARY KEY CLUSTERED 
(
	[id_type_uslugi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[type_zastroyki]    Script Date: 14.03.2023 11:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type_zastroyki](
	[name] [varchar](50) NOT NULL,
	[id_type_zastroiki] [int] NOT NULL,
 CONSTRAINT [PK_type_zastroyki] PRIMARY KEY CLUSTERED 
(
	[id_type_zastroiki] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ulitca]    Script Date: 14.03.2023 11:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ulitca](
	[name] [varchar](50) NOT NULL,
	[id_ulitca] [int] NOT NULL,
 CONSTRAINT [PK_ulitca] PRIMARY KEY CLUSTERED 
(
	[id_ulitca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[uslugaCRM]    Script Date: 14.03.2023 11:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uslugaCRM](
	[name] [varchar](50) NOT NULL,
	[id_usligaCRM] [int] NOT NULL,
 CONSTRAINT [PK_uslugaCRM] PRIMARY KEY CLUSTERED 
(
	[id_usligaCRM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[uslugi]    Script Date: 14.03.2023 11:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uslugi](
	[name] [varchar](50) NOT NULL,
	[id_uslugi] [int] NOT NULL,
 CONSTRAINT [PK_uslugi] PRIMARY KEY CLUSTERED 
(
	[id_uslugi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vid_uslugi]    Script Date: 14.03.2023 11:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vid_uslugi](
	[name] [varchar](50) NOT NULL,
	[id_vid_uslugi] [int] NOT NULL,
 CONSTRAINT [PK_vid_uslugi] PRIMARY KEY CLUSTERED 
(
	[id_vid_uslugi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zayavka_CRM]    Script Date: 14.03.2023 11:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zayavka_CRM](
	[id_CRM] [nvarchar](100) NOT NULL,
	[id_uslugaCRM] [int] NOT NULL,
	[id_vid_uslugi] [int] NOT NULL,
	[id_type_uslugi] [int] NOT NULL,
	[id_status] [int] NOT NULL,
	[type_oborud] [varchar](50) NULL,
	[opisanie_problem] [varchar](max) NULL,
	[date_zakritie] [date] NULL,
	[id_type_problem] [int] NOT NULL,
 CONSTRAINT [PK_zayavka_CRM] PRIMARY KEY CLUSTERED 
(
	[id_CRM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[admin] ([surname], [name], [patronimyc], [id_dolgj], [id_admin], [photo_admin]) VALUES (N'Шилов', N'Вольдемар', N'Степанович', 1, N'ID1516', N'ID1516.jpg')
INSERT [dbo].[admin] ([surname], [name], [patronimyc], [id_dolgj], [id_admin], [photo_admin]) VALUES (N'Мясников', N'Власий', N'Лаврентьевич', 2, N'ID1517', N'ID1517.jpg')
INSERT [dbo].[admin] ([surname], [name], [patronimyc], [id_dolgj], [id_admin], [photo_admin]) VALUES (N'Макаров', N'Овидий', N'Вячеславович', 3, N'ID1518', N'ID1518.jpg')
INSERT [dbo].[admin] ([surname], [name], [patronimyc], [id_dolgj], [id_admin], [photo_admin]) VALUES (N'Рябов', N'Валентин', N'Миронович', 3, N'ID1519', N'ID1519.jpg')
INSERT [dbo].[admin] ([surname], [name], [patronimyc], [id_dolgj], [id_admin], [photo_admin]) VALUES (N'Архипов', N'Валентин', N'Богуславович', 3, N'ID1520', N'ID1520.jpg')
INSERT [dbo].[admin] ([surname], [name], [patronimyc], [id_dolgj], [id_admin], [photo_admin]) VALUES (N'Федосеев', N'Август', N'Аристархович', 3, N'ID1521', N'ID1521.jpg')
INSERT [dbo].[admin] ([surname], [name], [patronimyc], [id_dolgj], [id_admin], [photo_admin]) VALUES (N'Козлов', N'Азарий', N'Владимирович', 3, N'ID1522', N'ID1522.jpg')
INSERT [dbo].[admin] ([surname], [name], [patronimyc], [id_dolgj], [id_admin], [photo_admin]) VALUES (N'Кондратьев', N'Владислав', N'Агафонович', 3, N'ID1523', N'ID1523.jpg')
INSERT [dbo].[admin] ([surname], [name], [patronimyc], [id_dolgj], [id_admin], [photo_admin]) VALUES (N'Лапин', N'Альфред', N'Александрович', 3, N'ID1524', N'ID1524.jpg')
INSERT [dbo].[admin] ([surname], [name], [patronimyc], [id_dolgj], [id_admin], [photo_admin]) VALUES (N'Тимофеев', N'Май', N'Филиппович', 3, N'ID1525', N'ID1525.jpg')
INSERT [dbo].[admin] ([surname], [name], [patronimyc], [id_dolgj], [id_admin], [photo_admin]) VALUES (N'Сидоров', N'Арсений', N'Богуславович', 4, N'ID1526', N'ID1526.jpg')
INSERT [dbo].[admin] ([surname], [name], [patronimyc], [id_dolgj], [id_admin], [photo_admin]) VALUES (N'Самсонов', N'Егор', N'Тимофеевич', 5, N'ID1527', N'ID1527.jpg')
INSERT [dbo].[admin] ([surname], [name], [patronimyc], [id_dolgj], [id_admin], [photo_admin]) VALUES (N'Журавлёв', N'Панкрат', N'Валерьянович', 5, N'ID1528', N'ID1528.jpg')
INSERT [dbo].[admin] ([surname], [name], [patronimyc], [id_dolgj], [id_admin], [photo_admin]) VALUES (N'Жуков', N'Виталий', N'Проклович', 5, N'ID1529', N'ID1529.jpg')
INSERT [dbo].[admin] ([surname], [name], [patronimyc], [id_dolgj], [id_admin], [photo_admin]) VALUES (N'Якушев', N'Гордий', N'Гордеевич', 5, N'ID1530', N'ID1530.jpg')
INSERT [dbo].[admin] ([surname], [name], [patronimyc], [id_dolgj], [id_admin], [photo_admin]) VALUES (N'Симонова', N'Сильвия', N'Валерьевна', 6, N'ID1531', N'ID1531.jpg')
INSERT [dbo].[admin] ([surname], [name], [patronimyc], [id_dolgj], [id_admin], [photo_admin]) VALUES (N'Дмитриева', N'Вероника', N'Прокловна', 6, N'ID1532', N'ID1532.jpg')
INSERT [dbo].[admin] ([surname], [name], [patronimyc], [id_dolgj], [id_admin], [photo_admin]) VALUES (N'Панова', N'Марина', N'Викторовна', 6, N'ID1533', N'ID1533.jpg')
INSERT [dbo].[admin] ([surname], [name], [patronimyc], [id_dolgj], [id_admin], [photo_admin]) VALUES (N'Афанасьева', N'Дарина', N'Львовна', 7, N'ID1534', N'ID1534.jpg')
INSERT [dbo].[admin] ([surname], [name], [patronimyc], [id_dolgj], [id_admin], [photo_admin]) VALUES (N'Шубина', N'Мелитта', N'Тарасовна', 7, N'ID1535', N'ID1535.jpg')
INSERT [dbo].[admin] ([surname], [name], [patronimyc], [id_dolgj], [id_admin], [photo_admin]) VALUES (N'Белякова', N'Элла', N'Игнатьевна', 7, N'ID1536', N'ID1536.jpg')
INSERT [dbo].[admin] ([surname], [name], [patronimyc], [id_dolgj], [id_admin], [photo_admin]) VALUES (N'Осипова', N'Индира', N'Оскаровна', 7, N'ID1537', N'ID1537.jpg')
INSERT [dbo].[admin] ([surname], [name], [patronimyc], [id_dolgj], [id_admin], [photo_admin]) VALUES (N'Ефремова', N'Анна', N'Николаевна', 7, N'ID1538', N'ID1538.jpg')
INSERT [dbo].[admin] ([surname], [name], [patronimyc], [id_dolgj], [id_admin], [photo_admin]) VALUES (N'Симонова', N'Герда', N'Наумовна', 7, N'ID1539', N'ID1539.jpg')
INSERT [dbo].[admin] ([surname], [name], [patronimyc], [id_dolgj], [id_admin], [photo_admin]) VALUES (N'Авдеева', N'Нега', N'Евгеньевна', 7, N'ID1540', N'ID1540.jpg')
INSERT [dbo].[admin] ([surname], [name], [patronimyc], [id_dolgj], [id_admin], [photo_admin]) VALUES (N'Никифорова', N'Алиса', N'Робертовна', 7, N'ID1541', N'ID1541.jpg')
INSERT [dbo].[admin] ([surname], [name], [patronimyc], [id_dolgj], [id_admin], [photo_admin]) VALUES (N'Семёнова', N'Габриэлла', N'Иринеевна', 7, N'ID1542', N'ID1542.jpg')
INSERT [dbo].[admin] ([surname], [name], [patronimyc], [id_dolgj], [id_admin], [photo_admin]) VALUES (N'Авдеева', N'Таисия', N'Анатольевна', 7, N'ID1543', N'ID1543.jpg')
INSERT [dbo].[admin] ([surname], [name], [patronimyc], [id_dolgj], [id_admin], [photo_admin]) VALUES (N'Мухина', N'Доминика', N'Лукьяновна', 7, N'ID1544', N'ID1544.jpg')
INSERT [dbo].[admin] ([surname], [name], [patronimyc], [id_dolgj], [id_admin], [photo_admin]) VALUES (N'Муравьёва', N'Римма', N'Максовна', 7, N'ID1545', N'ID1545.jpg')
GO
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 1, 1, N'16', N'118', 1)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 2, 2, N'23', N'214', 2)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 3, 3, N'16', N'51', 3)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 4, 4, N'13', N'89', 4)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 2, 5, N'5', N'213', 5)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 5, 6, N'4', N'144', 6)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 6, 7, N'7', N'161', 7)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 7, 8, N'17', N'19', 8)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 8, 9, N'4', N'95', 9)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 9, 10, N'7', N'212', 10)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 10, 11, N'4', N'4', 11)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 11, 12, N'12', N'86', 12)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 12, 13, N'19', N'122', 13)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 13, 7, N'19', N'120', 14)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 14, 14, N'7', N'69', 15)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 15, 15, N'20', N'100', 16)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 16, 9, N'14', N'57', 17)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 17, 2, N'11', N'113', 18)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 18, 16, N'7', N'23', 19)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 19, 17, N'12', N'155', 20)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 20, 18, N'10', N'55', 21)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 21, 11, N'8', N'58', 22)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 22, 19, N'4', N'150', 23)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 23, 20, N'12', N'21', 24)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 24, 21, N'1', N'129', 25)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 25, 22, N'2', N'119', 26)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 26, 17, N'21', N'101', 27)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 27, 23, N'16', N'102', 28)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 28, 24, N'19', N'121', 29)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 29, 25, N'14', N'87', 30)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 30, 26, N'5', N'32', 31)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 31, 27, N'16', N'219', 32)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 32, 28, N'9', N'149', 33)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 2, 21, N'19', N'106', 34)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 33, 29, N'3', N'180', 35)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 34, 30, N'9', N'16', 36)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 35, 31, N'4', N'56', 37)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 36, 32, N'22', N'205', 38)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 37, 33, N'22', N'216', 39)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 38, 34, N'15', N'55', 40)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 39, 35, N'25', N'169', 41)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 40, 36, N'17', N'97', 42)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 41, 37, N'10', N'155', 43)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 42, 38, N'2', N'89', 44)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 43, 39, N'22', N'22', 45)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 44, 40, N'4', N'125', 46)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 45, 41, N'22', N'60', 47)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 14, 42, N'23', N'192', 48)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 46, 43, N'22', N'29', 49)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 47, 44, N'23', N'120', 50)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 48, 45, N'10', N'2', 51)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 49, 46, N'10', N'213', 52)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 50, 47, N'12', N'92', 53)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 51, 48, N'11', N'87', 54)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 52, 39, N'22', N'196', 55)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 53, 11, N'1', N'88', 56)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 54, 22, N'13', N'182', 57)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 55, 49, N'13', N'192', 58)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 56, 47, N'14', N'211', 59)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 57, 50, N'19', N'58', 60)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 58, 51, N'15', N'190', 61)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 59, 52, N'2', N'21', 62)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 60, 40, N'1', N'58', 63)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 61, 40, N'18', N'50', 64)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 62, 49, N'10', N'126', 65)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 40, 53, N'15', N'36', 66)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 63, 54, N'20', N'180', 67)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 64, 2, N'16', N'160', 68)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 35, 26, N'17', N'127', 69)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 46, 55, N'6', N'114', 70)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 65, 56, N'18', N'63', 71)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 66, 57, N'18', N'92', 72)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 51, 58, N'12', N'51', 73)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 67, 51, N'9', N'124', 74)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 68, 55, N'15', N'115', 75)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 69, 59, N'8', N'77', 76)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 70, 48, N'20', N'209', 77)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 71, 60, N'1', N'98', 78)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 63, 26, N'15', N'149', 79)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 6, 42, N'17', N'20', 80)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 67, 2, N'3', N'131', 81)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 47, 61, N'4', N'147', 82)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 25, 62, N'12', N'109', 83)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 72, 52, N'11', N'91', 84)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 73, 63, N'12', N'212', 85)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 74, 64, N'12', N'197', 86)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 29, 46, N'2', N'151', 87)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 52, 64, N'6', N'146', 88)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 73, 56, N'6', N'213', 89)
INSERT [dbo].[adress_client] ([id_strana], [id_gorod], [id_ulicta], [number_house], [number_kvartira], [id_adress_client]) VALUES (1, 40, 65, N'2', N'217', 90)
GO
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78А000001', N'Маслака', N'Жанна', N'Петровна', 1, CAST(N'1981-10-22' AS Date), N'+7 (969) 681-71-93', N'janna22101981@mail.ru', 1, N'1077:10:18', N'4282 450721', N'610-512', N'ОВД России по г. Артем', CAST(N'2021-05-11' AS Date), N'78А000001-1 - 2018', CAST(N'2018-01-01' AS Date), 1, N'', N'785493417', NULL, NULL, N'АО567-ТНС-11')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78А000002', N'Гриневеца', N'Наталия', N'Афанасьевна', 1, CAST(N'1983-06-23' AS Date), N'+7 (905) 769-52-73', N'nataliya27@yandex.ru', 2, N'8002Б:5:13', N'4972 329168', N'470-574', N'Управление внутренних дел по г. Курган', CAST(N'2017-03-19' AS Date), N'78А000002-2 - 2018', CAST(N'2018-02-02' AS Date), 1, N'', N'785493418', NULL, NULL, N'АО567-ТНС-12')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78А000003', N'Янов', N'Игнатий', N'Тимофеевич', 2, CAST(N'1987-09-04' AS Date), N'+7 (907) 675-91-40', N'ignatiy1987@yandex.ru', 3, N'1155:11:12', N'4439 706015', N'200-608', N'Отделением УФМС России в г. Тольятти', CAST(N'2013-01-01' AS Date), N'78А000003-3 - 2018', CAST(N'2018-03-03' AS Date), 1, N'', N'785493419', NULL, NULL, N'АО567-ТНС-13')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78А000004', N'Фастера', N'Клара', N'Герасимовна', 1, CAST(N'1964-04-21' AS Date), N'+7 (909) 182-89-26', N'klara6712@mail.ru', 4, N'1253:6:18', N'4619 108064', N'710-647', N'Отделением УФМС России по г. Пенза', CAST(N'2013-03-01' AS Date), N'78А000004-4 - 2018', CAST(N'2018-04-04' AS Date), 2, N'Переезд', N'785493420', CAST(N'2020-12-16' AS Date), NULL, N'АО567-ТНС-14')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78А000005', N'Кирсанов', N'Филипп', N'Германович', 2, CAST(N'1982-09-05' AS Date), N'+7 (979) 631-90-51', N'filipp7232@outlook.com', 5, N'1675:1:25', N'4687 731090', N'270-701', N'Отделом внутренних дел России по г. Каменск - Уральский', CAST(N'2014-09-16' AS Date), N'78А000005-5 - 2019', CAST(N'2019-05-05' AS Date), 1, N'', N'785493421', NULL, NULL, N'АО567-ТНС-11')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78А000006', N'Быкова', N'Ольга', N'Герасимовна', 1, CAST(N'1971-04-28' AS Date), N'+7 (980) 165-72-86', N'olga21@yandex.ru', 6, N'1155:0:19', N'4774 849631', N'770-592', N'Управление внутренних дел по г. Пушкино', CAST(N'2020-08-05' AS Date), N'78А000006-6 - 2019', CAST(N'2019-06-06' AS Date), 1, N'', N'785493422', NULL, NULL, N'АО567-ТНС-12')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78А000007', N'Осина', N'Нонна', N'Ростиславовна', 1, CAST(N'1963-08-23' AS Date), N'+7 (935) 322-45-38', N'nonna.osina@gmail.com', 7, N'1070:0:16', N'4120 125651', N'910-770', N'Отделением УФМС России по г. Армавир', CAST(N'2015-05-23' AS Date), N'78А000007-7 - 2019', CAST(N'2019-07-07' AS Date), 1, N'', N'785493423', NULL, NULL, N'АО567-ТНС-13')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78А000008', N'Илюшин', N'Тимофей', N'Савванович', 2, CAST(N'1965-09-05' AS Date), N'+7 (927) 221-17-95', N'timofey05091965@yandex.ru', 8, N'8007:45:20', N'4085 748295', N'170-522', N'Отделом УФМС России по г. Брянск', CAST(N'2019-04-25' AS Date), N'78А000008-8 - 2019', CAST(N'2019-08-08' AS Date), 2, N'', N'785493424', NULL, NULL, N'АО567-ТНС-14')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78А000009', N'Блантер', N'Аполлинария', N'Григориевна', 1, CAST(N'1968-05-16' AS Date), N'+7 (911) 374-73-77', N'apollinariya25@yandex.ru', 9, N'8002В:0:26', N'4488 865481', N'130-277', N'Отделом УФМС России по г. Самара', CAST(N'2017-11-17' AS Date), N'78А000009-9 - 2019', CAST(N'2019-09-09' AS Date), 1, N'', N'785493425', NULL, NULL, N'АО567-ТНС-11')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78А000010', N'Левковича', N'Василиса', N'Вячеславовна', 1, CAST(N'1988-11-16' AS Date), N'+7 (938) 249-10-91', N'vasilisa1988@yandex.ru', 10, N'7507:0:26', N'4071 593651', N'250-758', N'Отделением УФМС России по г. Йошкар-Ола', CAST(N'2014-08-04' AS Date), N'78А000010-10 - 2019', CAST(N'2019-10-10' AS Date), 1, N'Переезд', N'785493426', CAST(N'2020-10-12' AS Date), NULL, N'АО567-ТНС-12')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78А000011', N'Моренов', N'Трофим', N'Юлианович', 2, CAST(N'1987-07-25' AS Date), N'+7 (983) 326-40-34', N'trofim93@outlook.com', 11, N'1078:4:17', N'4765 421287', N'430-219', N'ОВД России по г. Северодвинск', CAST(N'2018-08-02' AS Date), N'78А000011-11 - 2019', CAST(N'2019-11-11' AS Date), 1, N'', N'785493427', NULL, NULL, N'АО567-ТНС-13')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78А000012', N'Зылькова', N'Нина', N'Нифонтовна', 1, CAST(N'1978-02-02' AS Date), N'+7 (945) 882-26-21', N'nina91@mail.ru', 12, N'1083:2:15', N'4973 633385', N'510-866', N'Отделением УФМС России в г. Миасс', CAST(N'2018-11-17' AS Date), N'78А000012-12 - 2019', CAST(N'2019-12-12' AS Date), 2, N'', N'785493428', NULL, NULL, N'АО567-ТНС-14')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78А000013', N'Шеляпин', N'Роман', N'Викторович', 2, CAST(N'1968-05-10' AS Date), N'+7 (933) 954-75-29', N'roman10051968@hotmail.com', 13, N'1088:10:61', N'4148 271134', N'570-755', N'Отделением УФМС России по г. Москва', CAST(N'2012-09-02' AS Date), N'78А000013-5 - 2019', CAST(N'2019-05-13' AS Date), 1, N'Переезд', N'785493429', CAST(N'2021-07-22' AS Date), NULL, N'АО567-ТНС-11')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78А000014', N'Немцов', N'Константин', N'Викторович', 2, CAST(N'1972-11-20' AS Date), N'+7 (927) 422-89-21', N'konstantin.nemcov@rambler.ru', 14, N'1249А:1:3', N'4486 117836', N'820-772', N'Отделением УФМС России в г. Октябрьский', CAST(N'2011-11-14' AS Date), N'78А000014-6 - 2018', CAST(N'2018-06-14' AS Date), 1, N'', N'785493430', NULL, NULL, N'АО567-ТНС-12')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78А000015', N'Хуртина', N'Алиса', N'Афанасьевна', 1, CAST(N'1972-03-14' AS Date), N'+7 (920) 799-48-21', N'alisa14031972@outlook.com', 15, N'1688:3:29', N'4154 169152', N'810-600', N'Отделением УФМС России по г. Елец', CAST(N'2011-11-06' AS Date), N'78А000015-7 - 2018', CAST(N'2018-07-15' AS Date), 1, N'', N'785493431', NULL, NULL, N'АО567-ТНС-13')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78А000016', N'Стукалов', N'Яков', N'Ильич', 2, CAST(N'1966-05-21' AS Date), N'+7 (940) 476-89-72', N'yakov2699@outlook.com', 16, N'1006:4:5', N'4098 479713', N'900-684', N'Управление внутренних дел по г. Йошкар-Ола', CAST(N'2012-05-27' AS Date), N'78А000016-8 - 2019', CAST(N'2019-08-16' AS Date), 1, N'', N'785493432', NULL, NULL, N'АО567-ТНС-14')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78А000017', N'Ярилова', N'Катерина', N'Георгьевна', 1, CAST(N'1960-11-19' AS Date), N'+7 (919) 542-98-82', N'katerina19111960@hotmail.com', 17, N'1152:3:3', N'4123 170850', N'280-853', N'Отделом УФМС России по г. Коломна', CAST(N'2019-08-09' AS Date), N'78А000017-5 - 2019', CAST(N'2019-05-17' AS Date), 2, N'', N'785493433', NULL, NULL, N'АО567-ТНС-11')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78А000018', N'Петрухин', N'Феликс', N'Савванович', 2, CAST(N'1963-10-07' AS Date), N'+7 (931) 834-85-32', N'feliks07101963@mail.ru', 18, N'1006:4:3', N'4398 991681', N'220-122', N'ОВД России по г. Северск', CAST(N'2013-12-28' AS Date), N'78А000018-6 - 2019', CAST(N'2019-06-18' AS Date), 1, N'', N'785493434', NULL, NULL, N'АО567-ТНС-12')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78А000019', N'Ивашкина', N'София', N'Александровна', 1, CAST(N'1964-12-20' AS Date), N'+7 (998) 401-69-41', N'sofiya24@hotmail.com', 19, N'1079:0:21', N'4921 840663', N'160-827', N'ОВД России по г. Мурманск', CAST(N'2013-01-26' AS Date), N'78А000019-7 - 2018', CAST(N'2018-07-19' AS Date), 1, N'', N'785493435', NULL, NULL, N'АО567-ТНС-13')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78А000020', N'Золотова', N'Рада', N'Юлиановна', 1, CAST(N'1984-07-01' AS Date), N'+7 (982) 913-95-79', N'rada29@rambler.ru', 20, N'1622:6:60', N'4438 240819', N'720-540', N'ОУФМС России по г. Долгопрудный', CAST(N'2019-09-03' AS Date), N'78А000020-8 - 2018', CAST(N'2018-08-20' AS Date), 1, N'Переезд', N'785493436', CAST(N'2019-06-17' AS Date), NULL, N'АО567-ТНС-14')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78А000021', N'Базарова', N'Ольга', N'Павловна', 1, CAST(N'1992-08-22' AS Date), N'+7 (923) 230-93-14', N'olga.bazarova@ya.ru', 21, N'1634:0:31', N'4713 580078', N'190-617', N'Отделением УФМС России в г. Муром', CAST(N'2016-05-25' AS Date), N'78А000021-1 - 2019', CAST(N'2019-01-21' AS Date), 1, N'', N'785493437', NULL, NULL, N'АО567-ТНС-11')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78А000022', N'Хуснутдинов', N'Валентин', N'Макарович', 2, CAST(N'1985-05-15' AS Date), N'+7 (921) 783-40-62', N'valentin1985@outlook.com', 22, N'7501Б:66:148', N'4269 628189', N'860-324', N'Управление внутренних дел по г. Каспийск', CAST(N'2019-07-05' AS Date), N'78А000022-2 - 2019', CAST(N'2019-02-22' AS Date), 1, N'', N'785493438', NULL, NULL, N'АО567-ТНС-12')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78А000023', N'Лукьянова', N'Вера', N'Константиновна', 1, CAST(N'1974-03-01' AS Date), N'+7 (967) 143-74-89', N'vera1974@mail.ru', 23, N'1005:0:87', N'4060 460768', N'180-948', N'Отделением УФМС России по г. Новый Уренгой', CAST(N'2016-01-20' AS Date), N'78А000023-3 - 2019', CAST(N'2019-03-23' AS Date), 1, N'Переезд', N'785493439', CAST(N'2021-05-03' AS Date), NULL, N'АО567-ТНС-13')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78А000024', N'Ярмоленко', N'Ева', N'Серафимовна', 1, CAST(N'1992-02-17' AS Date), N'+7 (954) 426-46-81', N'eva1992@ya.ru', 24, N'1657:0:73', N'4677 708908', N'880-626', N'Отделением УФМС России по г. Элиста', CAST(N'2015-08-05' AS Date), N'78А000024-4 - 2020', CAST(N'2020-04-24' AS Date), 1, N'', N'785493440', NULL, NULL, N'АО567-ТНС-14')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78А000025', N'Федосеева', N'Алла', N'Прохор', 1, CAST(N'1976-04-19' AS Date), N'+7 (943) 841-45-49', N'alla7235@gmail.com', 25, N'8002В:0:52', N'4989 891444', N'570-829', N'Отделением УФМС России по г. Владикавказ', CAST(N'2015-11-12' AS Date), N'78А000025-5 - 2020', CAST(N'2020-05-25' AS Date), 1, N'', N'785493441', NULL, NULL, N'АО567-ТНС-11')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78А000026', N'Бурцова', N'Юлия', N'Павловна', 1, CAST(N'1996-05-05' AS Date), N'+7 (995) 553-35-63', N'yuliya1996@ya.ru', 26, N'1154:0:32', N'4723 614685', N'980-476', N'Управление внутренних дел по г. Щёлково', CAST(N'2015-09-09' AS Date), N'78А000026-1 - 2020', CAST(N'2020-01-26' AS Date), 1, N'', N'785493442', NULL, NULL, N'АО567-ТНС-12')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78А000027', N'Тизенгаузена', N'Светлана', N'Георгьевна', 1, CAST(N'1973-02-22' AS Date), N'+7 (912) 930-82-23', N'svetlana57@gmail.com', 27, N'1069:0:30', N'4321 448056', N'530-343', N'Отделом внутренних дел России по г. Брянск', CAST(N'2014-04-27' AS Date), N'78А000027-2 - 2020', CAST(N'2020-02-27' AS Date), 1, N'', N'785493443', NULL, NULL, N'АО567-ТНС-13')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78А000028', N'Рыченкова', N'Анна', N'Степановна', 1, CAST(N'1986-02-17' AS Date), N'+7 (995) 583-89-93', N'anna15@hotmail.com', 28, N'1664:0:95', N'4379 365579', N'170-504', N'Отделением УФМС России по г. Комсомольск-на-Амуре', CAST(N'2019-09-03' AS Date), N'78А000028-3 - 2020', CAST(N'2020-03-28' AS Date), 1, N'', N'785493444', NULL, NULL, N'АО567-ТНС-14')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78А000029', N'Есипова', N'Юлиана', N'Фадеевна', 1, CAST(N'1980-10-10' AS Date), N'+7 (933) 384-80-14', N'yuliana20@gmail.com', 29, N'1089:2:32', N'4424 942158', N'670-351', N'Отделом внутренних дел России по г. Череповец', CAST(N'2014-01-06' AS Date), N'78А000029-4 - 2020', CAST(N'2020-04-01' AS Date), 1, N'', N'785493445', NULL, NULL, N'АО567-ТНС-11')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78А000030', N'Ёжиков', N'Валерий', N'Давидович', 2, CAST(N'1982-09-03' AS Date), N'+7 (947) 786-92-96', N'valeriy77@yandex.ru', 30, N'1094:0:29', N'4716 277897', N'110-284', N'Отделом УФМС России по г. Орёл', CAST(N'2012-05-06' AS Date), N'78А000030-5 - 2020', CAST(N'2020-05-02' AS Date), 1, N'', N'785493446', NULL, NULL, N'АО567-ТНС-12')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78В00001', N'Хахалин', N'Леонтий', N'Климентович', 2, CAST(N'1963-06-17' AS Date), N'+7 (944) 665-88-32', N'leontiy17061963@hotmail.com', 61, N'7501Б:75:52', N'4784 622440', N'220-269', N'Отделением УФМС России по г. Ногинск', CAST(N'2012-11-06' AS Date), N'78В00001-11 - 2018', CAST(N'2018-11-08' AS Date), 1, N'', N'785493477', NULL, NULL, N'АО567-ТНС-11')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78В00002', N'Толкачев', N'Валерий', N'Артемович', 2, CAST(N'1982-08-17' AS Date), N'+7 (998) 660-29-86', N'valeriy.tolkachev@ya.ru', 62, N'7501Б:74:131', N'4853 522824', N'620-789', N'Отделом внутренних дел России по г. Арзамас', CAST(N'2017-08-01' AS Date), N'78В00002-12 - 2019', CAST(N'2019-12-09' AS Date), 1, N'', N'785493478', NULL, NULL, N'АО567-ТНС-12')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78В00003', N'Тимиряев', N'Юрий', N'Ростиславович', 2, CAST(N'1969-03-28' AS Date), N'+7 (953) 212-37-58', N'yuriy1969@ya.ru', 63, N'8006:28:39', N'4933 815058', N'300-538', N'Отделением УФМС России по г. Нефтеюганск', CAST(N'2019-09-12' AS Date), N'78В00003-5 - 2019', CAST(N'2019-05-10' AS Date), 1, N'', N'785493479', NULL, NULL, N'АО567-ТНС-13')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78В00004', N'Мутовина', N'Алина', N'Денисовна', 1, CAST(N'1994-09-01' AS Date), N'+7 (944) 536-51-24', N'alina01091994@mail.ru', 64, N'1634:0:29', N'4562 774155', N'930-653', N'Отделом внутренних дел России по г. Пушкино', CAST(N'2021-01-12' AS Date), N'78В00004-6 - 2019', CAST(N'2019-06-11' AS Date), 1, N'', N'785493480', NULL, NULL, N'АО567-ТНС-14')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78В00005', N'Сапалёва', N'Марьямна', N'Никандровна', 1, CAST(N'1969-10-18' AS Date), N'+7 (919) 940-39-80', N'maryamna1969@ya.ru', 65, N'1070:0:20', N'4517 796000', N'790-155', N'Отделом УФМС России по г. Химки', CAST(N'2021-05-06' AS Date), N'78В00005-7 - 2018', CAST(N'2018-07-12' AS Date), 1, N'', N'785493481', NULL, NULL, N'АО567-ТНС-11')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78В00006', N'Панкратов', N'Михаил', N'Панкратович', 2, CAST(N'1988-10-23' AS Date), N'+7 (911) 254-87-88', N'mihail1988@yandex.ru', 66, N'1617:21:19', N'4147 123053', N'290-203', N'Управление внутренних дел по г. Ачинск', CAST(N'2021-02-24' AS Date), N'78В00006-8 - 2018', CAST(N'2018-08-13' AS Date), 1, N'', N'785493482', NULL, NULL, N'АО567-ТНС-12')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78В00007', N'Стрелков', N'Степан', N'Артемович', 2, CAST(N'1977-07-23' AS Date), N'+7 (999) 844-48-82', N'stepan92@rambler.ru', 67, N'1687:5:15', N'4351 381116', N'300-295', N'Отделением УФМС России в г. Нижневартовск', CAST(N'2015-07-13' AS Date), N'78В00007-5 - 2019', CAST(N'2019-05-14' AS Date), 1, N'', N'785493483', NULL, NULL, N'АО567-ТНС-13')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78В00008', N'Быкова', N'Юлиана', N'Викторовна', 1, CAST(N'1964-01-23' AS Date), N'+7 (943) 612-29-44', N'yuliana.bykova@gmail.com', 68, N'1165:3:10', N'4076 368255', N'400-500', N'ОУФМС России по г. Симферополь', CAST(N'2020-09-04' AS Date), N'78В00008-6 - 2019', CAST(N'2019-06-15' AS Date), 1, N'', N'785493484', NULL, NULL, N'АО567-ТНС-14')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78В00009', N'Созыкин', N'Максим', N'Максимович', 2, CAST(N'1964-08-09' AS Date), N'+7 (985) 373-40-87', N'maksim6497@gmail.com', 69, N'1058:35:29', N'4932 338977', N'580-112', N'Отделением УФМС России в г. Волгоград', CAST(N'2020-07-25' AS Date), N'78В00009-7 - 2019', CAST(N'2019-07-16' AS Date), 2, N'', N'785493485', NULL, NULL, N'АО567-ТНС-11')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78В00010', N'Островерх', N'Елизавета', N'Максимовна', 1, CAST(N'1984-04-20' AS Date), N'+7 (906) 406-82-93', N'elizaveta32@rambler.ru', 70, N'1161:2:3', N'4314 468424', N'300-688', N'Отделением УФМС России по г. Новочеркасск', CAST(N'2018-07-19' AS Date), N'78В00010-8 - 2020', CAST(N'2020-08-17' AS Date), 1, N'', N'785493486', NULL, NULL, N'АО567-ТНС-12')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78В00011', N'Жванецкий', N'Савва', N'Феоктистович', 2, CAST(N'1984-11-13' AS Date), N'+7 (907) 504-86-73', N'savva.jvaneckiy@mail.ru', 71, N'8006:0:16', N'4315 284633', N'250-607', N'Отделом УФМС России по г. Северск', CAST(N'2019-09-29' AS Date), N'78В00011-1 - 2020', CAST(N'2020-01-18' AS Date), 1, N'', N'785493487', NULL, NULL, N'АО567-ТНС-13')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78В00012', N'Оборин', N'Петр', N'Нифонтович', 2, CAST(N'1979-12-18' AS Date), N'+7 (968) 813-14-51', N'petr.oborin@yandex.ru', 72, N'8006:0:24', N'4042 735498', N'160-536', N'Управление внутренних дел по г. Санкт-Петербург', CAST(N'2018-09-14' AS Date), N'78В00012-2 - 2020', CAST(N'2020-02-19' AS Date), 1, N'', N'785493488', NULL, NULL, N'АО567-ТНС-14')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78В00013', N'Мичурина', N'Маргарита', N'Феоктистовна', 1, CAST(N'1980-09-02' AS Date), N'+7 (926) 967-88-84', N'margarita26@hotmail.com', 73, N'8007:0:47', N'4659 666209', N'770-332', N'Отделением УФМС России по г. Старый Оскол', CAST(N'2017-02-21' AS Date), N'78В00013-3 - 2020', CAST(N'2020-03-20' AS Date), 1, N'', N'785493489', NULL, NULL, N'АО567-ТНС-11')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78В00014', N'Блаженнов', N'Алексей', N'Севастьянович', 2, CAST(N'1966-06-27' AS Date), N'+7 (991) 960-22-40', N'aleksey.blajennov@outlook.com', 74, N'1675:0:15', N'4810 848544', N'230-356', N'ОУФМС России по г. Копейск', CAST(N'2021-02-18' AS Date), N'78В00014-4 - 2020', CAST(N'2020-04-21' AS Date), 1, N'', N'785493490', NULL, NULL, N'АО567-ТНС-12')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78В00015', N'Кожевин', N'Прохор', N'Никанорович', 2, CAST(N'1967-01-05' AS Date), N'+7 (994) 825-60-23', N'prohor1967@hotmail.com', 75, N'1675:0:46', N'4356 138139', N'990-733', N'ОВД России по г. Бердск', CAST(N'2014-05-29' AS Date), N'78В00015-5 - 2020', CAST(N'2020-05-22' AS Date), 1, N'', N'785493491', NULL, NULL, N'АО567-ТНС-13')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78В00016', N'Саврасова', N'Лариса', N'Ефремовна', 1, CAST(N'1992-05-23' AS Date), N'+7 (972) 970-41-38', N'larisa.savrasova@mail.ru', 76, N'1676:0:25', N'4982 966896', N'610-241', N'Отделением УФМС России по г. Батайск', CAST(N'2018-05-19' AS Date), N'78В00016-1 - 2020', CAST(N'2020-01-23' AS Date), 1, N'', N'785493492', NULL, NULL, N'АО567-ТНС-14')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78В00017', N'Рыбакова', N'Вероника', N'Филипповна', 1, CAST(N'1965-02-26' AS Date), N'+7 (980) 793-71-73', N'veronika1965@hotmail.com', 77, N'1676:0:27', N'4675 570112', N'470-311', N'ОУФМС России по г. Владикавказ', CAST(N'2019-07-18' AS Date), N'78В00017-2 - 2020', CAST(N'2020-02-24' AS Date), 2, N'', N'785493493', NULL, NULL, N'АО567-ТНС-11')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78В00018', N'Яманова', N'Варвара', N'Михаиловна', 1, CAST(N'1996-05-13' AS Date), N'+7 (925) 114-41-99', N'varvara8263@yandex.ru', 78, N'1676:0:42', N'4579 481830', N'250-625', N'Отделом внутренних дел России по г. Ижевск', CAST(N'2011-12-30' AS Date), N'78В00018-3 - 2020', CAST(N'2020-03-25' AS Date), 1, N'', N'785493494', NULL, NULL, N'АО567-ТНС-12')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78В00019', N'Шаповалов', N'Давид', N'Феоктистович', 2, CAST(N'1991-02-02' AS Date), N'+7 (929) 893-95-56', N'david.apovalov@outlook.com', 79, N'1676:0:5', N'4929 776986', N'660-447', N'Отделением УФМС России по г. Щёлково', CAST(N'2019-07-17' AS Date), N'78В00019-4 - 2020', CAST(N'2020-04-26' AS Date), 1, N'', N'785493495', NULL, NULL, N'АО567-ТНС-13')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78В00020', N'Емельяненко', N'Марина', N'Ивановна', 1, CAST(N'1980-12-25' AS Date), N'+7 (931) 962-20-15', N'marina88@yandex.ru', 80, N'1678:0:16', N'4413 882242', N'410-299', N'Отделом внутренних дел России по г. Ангарск', CAST(N'2017-01-29' AS Date), N'78В00020-5 - 2020', CAST(N'2020-05-27' AS Date), 1, N'', N'785493496', NULL, NULL, N'АО567-ТНС-14')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78В00021', N'Калитин', N'Юрий', N'Трофимович', 2, CAST(N'1974-12-19' AS Date), N'+7 (907) 419-48-75', N'yuriy.kalitin@yandex.ru', 81, N'1719:0:87', N'4548 456482', N'230-621', N'ОВД России по г. Владимир', CAST(N'2013-01-10' AS Date), N'78В00021-6 - 2020', CAST(N'2020-06-28' AS Date), 1, N'', N'785493497', NULL, NULL, N'АО567-ТНС-11')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78В00022', N'Яресько', N'Илья', N'Александрович', 2, CAST(N'1993-02-14' AS Date), N'+7 (981) 962-25-81', N'ilya1948@hotmail.com', 82, N'1059:0:172', N'4977 672187', N'710-497', N'Отделением УФМС России в г. Каменск - Уральский', CAST(N'2012-07-17' AS Date), N'78В00022-7 - 2020', CAST(N'2020-07-14' AS Date), 1, N'', N'785493498', NULL, NULL, N'АО567-ТНС-12')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78В00023', N'Савенков', N'Герасим', N'Емельянович', 2, CAST(N'1979-01-12' AS Date), N'+7 (961) 296-50-28', N'gerasim1979@hotmail.com', 83, N'1155:0:52', N'4748 514770', N'670-637', N'Управление внутренних дел по г. Архангельск', CAST(N'2020-12-31' AS Date), N'78В00023-8 - 2020', CAST(N'2020-08-15' AS Date), 1, N'', N'785493499', NULL, NULL, N'АО567-ТНС-13')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78В00024', N'Аленин', N'Константин', N'Маркович', 2, CAST(N'1991-06-10' AS Date), N'+7 (905) 150-77-58', N'konstantin8668@mail.ru', 84, N'1291:26:14', N'4785 339267', N'670-101', N'Отделом внутренних дел России по г. Архангельск', CAST(N'2012-09-06' AS Date), N'78В00024-9 - 2020', CAST(N'2020-09-16' AS Date), 2, N'', N'785493500', NULL, NULL, N'АО567-ТНС-14')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78В00025', N'Малахов', N'Адам', N'Германович', 2, CAST(N'1974-08-19' AS Date), N'+7 (966) 296-90-40', N'adam3380@rambler.ru', 85, N'1253:5:14', N'4038 549286', N'630-527', N'Отделением УФМС России по г. Дзержинск', CAST(N'2020-04-11' AS Date), N'78В00025-10 - 2020', CAST(N'2020-10-17' AS Date), 1, N'', N'785493501', NULL, NULL, N'АО567-ТНС-11')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78В00026', N'Цур', N'Феликс', N'Антонрвич', 2, CAST(N'1990-05-14' AS Date), N'+7 (971) 277-27-82', N'feliks1990@rambler.ru', 86, N'1072:2:14', N'4674 806377', N'360-223', N'Отделением УФМС России по г. Курган', CAST(N'2019-01-08' AS Date), N'78В00026-11 - 2020', CAST(N'2020-11-18' AS Date), 1, N'', N'785493502', NULL, NULL, N'АО567-ТНС-12')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78В00027', N'Стожко', N'Вероника', N'Серафимовна', 1, CAST(N'1965-02-07' AS Date), N'+7 (997) 491-72-92', N'veronika1965@mail.ru', 87, N'1155:12:14', N'4191 550817', N'910-534', N'ОВД России по г. Калуга', CAST(N'2011-08-26' AS Date), N'78В00027-12 - 2020', CAST(N'2020-12-19' AS Date), 1, N'', N'785493503', NULL, NULL, N'АО567-ТНС-13')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78В00028', N'Корявова', N'Марфа', N'Феоктистовна', 1, CAST(N'1981-03-15' AS Date), N'+7 (952) 835-52-37', N'marfa.koryavova@ya.ru', 88, N'1079:9:10', N'4465 579021', N'960-397', N'Отделом УФМС России по г. Ессентуки', CAST(N'2021-06-27' AS Date), N'78В00028-5 - 2021', CAST(N'2021-05-12' AS Date), 1, N'', N'785493504', NULL, NULL, N'АО567-ТНС-14')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78В00029', N'Левкин', N'Никита', N'Севастьянович', 2, CAST(N'1994-06-25' AS Date), N'+7 (999) 966-90-28', N'nikita.levkin@hotmail.com', 89, N'1657:17:10', N'4783 688278', N'570-750', N'ОУФМС России по г. Сургут', CAST(N'2013-07-27' AS Date), N'78В00029-6 - 2021', CAST(N'2021-06-13' AS Date), 2, N'', N'785493505', NULL, NULL, N'АО567-ТНС-11')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78В00030', N'Татаров', N'Федор', N'Саввеевич', 2, CAST(N'1963-12-05' AS Date), N'+7 (973) 199-13-43', N'fedor1963@rambler.ru', 90, N'1253:5:15', N'4874 869737', N'610-648', N'Отделением УФМС России в г. Альметьевск', CAST(N'2013-11-12' AS Date), N'78В00030-7 - 2021', CAST(N'2021-07-21' AS Date), 1, N'', N'785493506', NULL, NULL, N'АО567-ТНС-12')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78П000001', N'Крюков', N'Вячеслав', N'Леонидович', 2, CAST(N'1963-12-13' AS Date), N'+7 (944) 355-69-20', N'vyacheslav13121963@rambler.ru', 31, N'1675:1:1', N'4344 547115', N'740-826', N'Управление внутренних дел по г. Ярославль', CAST(N'2017-04-03' AS Date), N'78П000001-6 - 2020', CAST(N'2020-06-03' AS Date), 1, N'Переезд', N'785493447', CAST(N'2020-12-12' AS Date), NULL, N'АО567-ТНС-13')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78П000002', N'Сазонтов', N'Илья', N'Панкратович', 2, CAST(N'1968-10-01' AS Date), N'+7 (939) 963-15-37', N'ilya86@hotmail.com', 32, N'1675:1:23', N'4078 955891', N'430-593', N'Отделением УФМС России по г. Улан-Удэ', CAST(N'2019-11-24' AS Date), N'78П000002-7 - 2020', CAST(N'2020-07-04' AS Date), 1, N'', N'785493448', NULL, NULL, N'АО567-ТНС-14')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78П000003', N'Ягнятев', N'Лаврентий', N'Ильич', 2, CAST(N'1978-05-02' AS Date), N'+7 (941) 625-44-90', N'lavrentiy4683@hotmail.com', 33, N'1690:4:10', N'4522 699723', N'820-880', N'Отделом УФМС России по г. Евпатория', CAST(N'2015-09-06' AS Date), N'78П000003-8 - 2020', CAST(N'2020-08-05' AS Date), 1, N'', N'785493449', NULL, NULL, N'АО567-ТНС-11')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78П000004', N'Лагранский', N'Тарас', N'Филиппович', 2, CAST(N'1967-02-15' AS Date), N'+7 (957) 966-75-33', N'taras1967@ya.ru', 34, N'1675:1:39', N'4441 576025', N'100-819', N'Отделом внутренних дел России по г. Салават', CAST(N'2017-03-02' AS Date), N'78П000004-9 - 2020', CAST(N'2020-09-06' AS Date), 1, N'', N'785493450', NULL, NULL, N'АО567-ТНС-12')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78П000005', N'Корявина', N'Екатерина', N'Васильевна', 1, CAST(N'1968-05-07' AS Date), N'+7 (972) 832-62-78', N'ekaterina2832@outlook.com', 35, N'7507:15:58', N'4674 163981', N'440-136', N'Отделом УФМС России по г. Краснодар', CAST(N'2017-11-21' AS Date), N'78П000005-10 - 2020', CAST(N'2020-10-07' AS Date), 1, N'', N'785493451', NULL, NULL, N'АО567-ТНС-13')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78П000006', N'Анюков', N'Илья', N'Филиппович', 2, CAST(N'1984-02-27' AS Date), N'+7 (930) 473-85-98', N'ilya58@gmail.com', 36, N'1720:3:13', N'4645 165137', N'760-990', N'Отделением УФМС России по г. Владивосток', CAST(N'2017-07-22' AS Date), N'78П000006-11 - 2020', CAST(N'2020-11-08' AS Date), 1, N'', N'785493452', NULL, NULL, N'АО567-ТНС-14')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78П000007', N'Горлова', N'Надежда', N'Витальевна', 1, CAST(N'1960-06-08' AS Date), N'+7 (991) 462-70-89', N'nadejda69@hotmail.com', 37, N'8004:0:107', N'4464 780862', N'350-557', N'Управление внутренних дел по г. Сызрань', CAST(N'2021-08-10' AS Date), N'78П000007-12 - 2020', CAST(N'2020-12-09' AS Date), 1, N'', N'785493453', NULL, NULL, N'АО567-ТНС-11')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78П000008', N'Коровин', N'Прохор', N'Яковеевичевич', 2, CAST(N'1967-06-01' AS Date), N'+7 (976) 211-74-35', N'prohor7239@rambler.ru', 38, N'1686:3:5', N'4881 213142', N'560-494', N'Отделением УФМС России по г. Тула', CAST(N'2020-11-11' AS Date), N'78П000008-5 - 2020', CAST(N'2020-05-10' AS Date), 1, N'Переезд', N'785493454', CAST(N'2020-12-25' AS Date), NULL, N'АО567-ТНС-12')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78П000009', N'Набоков', N'Герасим', N'Васильевич', 2, CAST(N'1979-10-08' AS Date), N'+7 (905) 403-28-97', N'gerasim1979@ya.ru', 39, N'8002Б:6:45', N'4139 649753', N'430-822', N'ОВД России по г. Салават', CAST(N'2012-03-16' AS Date), N'78П000009-6 - 2020', CAST(N'2020-06-11' AS Date), 1, N'', N'785493455', NULL, NULL, N'АО567-ТНС-13')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78П000010', N'Сотникова', N'Рада', N'Алексеевна', 1, CAST(N'1969-02-08' AS Date), N'+7 (961) 256-78-85', N'rada.sotnikova@outlook.com', 40, N'1005:11:9', N'4214 784297', N'900-632', N'Отделением УФМС России в г. Первоуральск', CAST(N'2015-03-03' AS Date), N'78П000010-7 - 2020', CAST(N'2020-07-12' AS Date), 1, N'', N'785493456', NULL, NULL, N'АО567-ТНС-14')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78П000011', N'Аниканова', N'Римма', N'Вячеславовна', 1, CAST(N'1965-08-23' AS Date), N'+7 (917) 493-29-50', N'rimma.anikanova@rambler.ru', 41, N'1658:11:12', N'4789 530264', N'400-698', N'Управление внутренних дел по г. Петропавловск-Камчатский', CAST(N'2014-05-04' AS Date), N'78П000011-8 - 2020', CAST(N'2020-08-13' AS Date), 1, N'', N'785493457', NULL, NULL, N'АО567-ТНС-11')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78П000012', N'Шорин', N'Савва', N'Семенович', 2, CAST(N'1990-10-11' AS Date), N'+7 (905) 936-34-44', N'savva67@rambler.ru', 42, N'1257:3:33', N'4748 919067', N'980-776', N'ОУФМС России по г. Красногорск', CAST(N'2020-04-21' AS Date), N'78П000012-5 - 2020', CAST(N'2020-05-14' AS Date), 1, N'', N'785493458', NULL, NULL, N'АО567-ТНС-12')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78П000013', N'Левченко', N'Николай', N'Яковлевич', 2, CAST(N'1973-12-23' AS Date), N'+7 (963) 125-74-19', N'nikolay23121973@outlook.com', 43, N'1664:34:82', N'4056 786676', N'370-589', N'Отделением УФМС России в г. Сочи', CAST(N'2014-11-13' AS Date), N'78П000013-6 - 2020', CAST(N'2020-06-15' AS Date), 1, N'', N'785493459', NULL, NULL, N'АО567-ТНС-13')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78П000014', N'Онипченко', N'Иван', N'Яковлевич', 2, CAST(N'1981-02-17' AS Date), N'+7 (976) 919-27-53', N'ivan8381@hotmail.com', 44, N'1720:3:12', N'4312 568195', N'310-996', N'Отделением УФМС России по г. Петропавловск-Камчатский', CAST(N'2013-01-29' AS Date), N'78П000014-7 - 2020', CAST(N'2020-07-16' AS Date), 1, N'', N'785493460', NULL, NULL, N'АО567-ТНС-14')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78П000015', N'Сазонтова', N'Инна', N'Никитьевна', 1, CAST(N'1965-01-20' AS Date), N'+7 (963) 328-58-26', N'inna20011965@mail.ru', 45, N'1004:5:26', N'4066 999471', N'450-296', N'ОВД России по г. Ноябрьск', CAST(N'2020-03-17' AS Date), N'78П000015-8 - 2020', CAST(N'2020-08-17' AS Date), 1, N'', N'785493461', NULL, NULL, N'АО567-ТНС-11')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78П000016', N'Подчасов', N'Александр', N'Викторович', 2, CAST(N'1991-03-21' AS Date), N'+7 (953) 410-16-83', N'aleksandr.podchasov@yandex.ru', 46, N'7507:0:57', N'4984 847790', N'320-225', N'Отделением УФМС России по г. Томск', CAST(N'2012-02-20' AS Date), N'78П000016-1 - 2020', CAST(N'2020-01-18' AS Date), 1, N'', N'785493462', NULL, NULL, N'АО567-ТНС-12')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78П000017', N'Викашева', N'Юлиана', N'Прокловна', 1, CAST(N'1965-05-01' AS Date), N'+7 (986) 669-21-71', N'yuliana01051965@outlook.com', 47, N'1079:0:14', N'4944 608863', N'520-843', N'Отделением УФМС России в г. Мурманск', CAST(N'2015-09-17' AS Date), N'78П000017-2 - 2018', CAST(N'2018-02-19' AS Date), 1, N'', N'785493463', NULL, NULL, N'АО567-ТНС-13')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78П000018', N'Забирова', N'Анастасия', N'Ильиновна', 1, CAST(N'1988-01-20' AS Date), N'+7 (920) 761-80-24', N'anastasiya5199@mail.ru', 48, N'1079:0:18', N'4977 360062', N'320-709', N'ОУФМС России по г. Королёв', CAST(N'2018-06-04' AS Date), N'78П000018-3 - 2018', CAST(N'2018-03-20' AS Date), 1, N'', N'785493464', NULL, NULL, N'АО567-ТНС-14')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78П000019', N'Чилаев', N'Филипп', N'Власович', 2, CAST(N'1974-11-08' AS Date), N'+7 (953) 968-77-22', N'filipp84@ya.ru', 49, N'1616:7:23', N'4764 148660', N'240-212', N'Отделом УФМС России по г. Салават', CAST(N'2019-04-13' AS Date), N'78П000019-4 - 2018', CAST(N'2018-04-21' AS Date), 1, N'', N'785493465', NULL, NULL, N'АО567-ТНС-11')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78П000020', N'Дегтярев', N'Максим', N'Юринович', 2, CAST(N'1995-10-16' AS Date), N'+7 (964) 544-81-89', N'maksim.degtyarev@outlook.com', 50, N'1616:7:24', N'4120 657886', N'260-701', N'Управление внутренних дел по г. Екатеринбург', CAST(N'2017-10-16' AS Date), N'78П000020-5 - 2018', CAST(N'2018-05-22' AS Date), 1, N'', N'785493466', NULL, NULL, N'АО567-ТНС-12')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78П000021', N'Дьяченко', N'Александр', N'Федорович', 2, CAST(N'1992-12-26' AS Date), N'+7 (916) 269-52-36', N'aleksandr.dyachenko@hotmail.com', 51, N'1617:1002:43', N'4679 597711', N'750-817', N'ОВД России по г. Якутск', CAST(N'2015-07-03' AS Date), N'78П000021-1 - 2019', CAST(N'2019-01-23' AS Date), 1, N'', N'785493467', NULL, NULL, N'АО567-ТНС-13')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78П000022', N'Любимцева', N'Лариса', N'Егоровна', 1, CAST(N'1992-09-03' AS Date), N'+7 (958) 258-18-16', N'larisa.lyubimceva@hotmail.com', 52, N'1247:0:24', N'4667 209858', N'280-797', N'Отделом внутренних дел России по г. Саранск', CAST(N'2020-08-14' AS Date), N'78П000022-2 - 2019', CAST(N'2019-02-24' AS Date), 1, N'', N'785493468', NULL, NULL, N'АО567-ТНС-14')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78П000023', N'Грош', N'Савва', N'Дмитриевич', 2, CAST(N'1979-11-26' AS Date), N'+7 (984) 723-11-37', N'savva.grosh@gmail.com', 53, N'1663:27:51', N'4513 103714', N'880-434', N'Отделением УФМС России в г. Нижний Тагил', CAST(N'2013-05-17' AS Date), N'78П000023-3 - 2019', CAST(N'2019-03-25' AS Date), 1, N'', N'785493469', NULL, NULL, N'АО567-ТНС-11')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78П000024', N'Типалова', N'Альбина', N'Вениаминовна', 1, CAST(N'1966-02-20' AS Date), N'+7 (922) 357-70-81', N'albina1966@hotmail.com', 54, N'1163:7:17', N'4448 309925', N'620-263', N'Отделом внутренних дел России по г. Красноярск', CAST(N'2012-01-19' AS Date), N'78П000024-4 - 2019', CAST(N'2019-04-26' AS Date), 1, N'', N'785493470', NULL, NULL, N'АО567-ТНС-12')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78П000025', N'Дементьев', N'Константин', N'Николаевич', 2, CAST(N'1967-09-19' AS Date), N'+7 (939) 842-35-92', N'konstantin1967@yandex.ru', 55, N'1247:5:7', N'4889 439740', N'400-291', N'Отделом внутренних дел России по г. Королёв', CAST(N'2016-01-17' AS Date), N'78П000025-5 - 2019', CAST(N'2019-05-27' AS Date), 1, N'', N'785493471', NULL, NULL, N'АО567-ТНС-13')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78П000026', N'Клим', N'Таисия', N'Емельяновна', 1, CAST(N'1985-02-06' AS Date), N'+7 (981) 763-96-93', N'taisiya8398@hotmail.com', 56, N'1719:0:11', N'4633 194980', N'640-292', N'ОУФМС России по г. Северск', CAST(N'2017-06-13' AS Date), N'78П000026-6 - 2019', CAST(N'2019-06-28' AS Date), 1, N'', N'785493472', NULL, NULL, N'АО567-ТНС-14')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78П000027', N'Унгерн', N'Данила', N'Гаврннлович', 2, CAST(N'1964-07-09' AS Date), N'+7 (968) 529-93-71', N'danila35@gmail.com', 57, N'1720:0:14', N'4558 533085', N'150-752', N'Отделением УФМС России по г. Сызрань', CAST(N'2017-04-28' AS Date), N'78П000027-7 - 2019', CAST(N'2019-07-04' AS Date), 1, N'', N'785493473', NULL, NULL, N'АО567-ТНС-11')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78П000028', N'Грош', N'Валерий', N'Павлович', 2, CAST(N'1984-05-21' AS Date), N'+7 (961) 170-54-61', N'valeriy21051984@yandex.ru', 58, N'1720:0:16', N'4589 314328', N'470-665', N'ОУФМС России по г. Оренбург', CAST(N'2013-03-21' AS Date), N'78П000028-8 - 2019', CAST(N'2019-08-05' AS Date), 1, N'', N'785493474', NULL, NULL, N'АО567-ТНС-12')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78П000029', N'Трохина', N'Антонина', N'Климентьевна', 1, CAST(N'1976-04-26' AS Date), N'+7 (995) 641-58-36', N'antonina8270@mail.ru', 59, N'7503:0:29', N'4756 531306', N'790-365', N'Отделом УФМС России по г. Кемерово', CAST(N'2012-05-30' AS Date), N'78П000029-9 - 2019', CAST(N'2019-09-06' AS Date), 1, N'', N'785493475', NULL, NULL, N'АО567-ТНС-13')
INSERT [dbo].[client] ([id_client], [Surname], [name], [patronimyc], [id_gender], [birthday], [number_phone], [email], [id_adress_client], [adress_projiv], [pasport], [kod_podrazd], [kem_vidan], [date_vidachi], [nubmer_dogovora], [date_zaklyucheniya], [id_contract], [prichina_rastorgj], [lictev_chet], [date_raztorjg_dogovora], [date_podpisaniya], [number_oborud]) VALUES (N'78П000030', N'Пестов', N'Семен', N'Антонович', 2, CAST(N'1973-07-20' AS Date), N'+7 (939) 867-86-86', N'semen76@gmail.com', 60, N'8002В:0:9', N'4991 788059', N'660-555', N'ОУФМС России по г. Рубцовск', CAST(N'2017-10-11' AS Date), N'78П000030-10 - 2018', CAST(N'2018-10-07' AS Date), 1, N'', N'785493476', NULL, NULL, N'АО567-ТНС-14')
GO
INSERT [dbo].[client_oborud] ([number_oborud], [name]) VALUES (N'АО567-ТНС-11', N'Точка доступа HP ProCurve ')
INSERT [dbo].[client_oborud] ([number_oborud], [name]) VALUES (N'АО567-ТНС-12', N'Точка доступа TP-Link TL-WA701ND ')
INSERT [dbo].[client_oborud] ([number_oborud], [name]) VALUES (N'АО567-ТНС-13', N'Точка доступа Sitecom WLX-2000 ')
INSERT [dbo].[client_oborud] ([number_oborud], [name]) VALUES (N'АО567-ТНС-14', N'Точка доступа Buffalo AirStation N300 Dual Band ')
GO
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000001', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000002', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000002', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000003', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000004', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000004', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000004', 3)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000005', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000005', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000006', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000007', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000007', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000007', 3)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000008', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000009', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000009', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000010', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000011', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000011', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000011', 3)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000012', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000012', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000012', 3)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000013', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000014', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000014', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000015', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000015', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000015', 3)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000016', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000017', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000017', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000018', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000018', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000019', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000019', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000019', 3)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000020', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000021', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000021', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000022', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000022', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000022', 3)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000023', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000023', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000024', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000025', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000025', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000025', 3)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000026', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000026', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000026', 3)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000027', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000028', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000028', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000028', 3)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000029', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000029', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78А000030', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00001', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00001', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00002', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00002', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00003', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00003', 3)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00004', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00004', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00005', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00005', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00006', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00006', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00007', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00007', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00008', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00008', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00009', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00009', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00010', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00010', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00011', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00012', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00013', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00014', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00014', 3)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00015', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00016', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00017', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00018', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00018', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00018', 3)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00019', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00019', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00019', 3)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00020', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00021', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00021', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00022', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00022', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00023', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00024', 1)
GO
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00024', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00025', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00025', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00026', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00026', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00027', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00027', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00028', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00029', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00029', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00029', 3)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00030', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78В00030', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000001', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000001', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000001', 3)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000002', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000003', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000003', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000003', 3)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000004', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000004', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000005', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000006', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000006', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000007', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000007', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000008', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000009', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000009', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000010', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000011', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000011', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000011', 3)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000012', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000012', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000013', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000013', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000014', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000015', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000016', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000016', 3)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000017', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000018', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000019', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000020', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000020', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000021', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000021', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000022', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000022', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000023', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000023', 3)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000024', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000025', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000025', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000026', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000026', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000027', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000028', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000028', 2)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000029', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000030', 1)
INSERT [dbo].[client_uslugi] ([id_client], [id_uslugi]) VALUES (N'78П000030', 2)
GO
INSERT [dbo].[contract type] ([name], [id_contract]) VALUES (N'с пролонгацией', 1)
INSERT [dbo].[contract type] ([name], [id_contract]) VALUES (N'без пролонгации', 2)
GO
INSERT [dbo].[dolgjnost] ([name], [id_dolgj]) VALUES (N'Руководитель по работе с клиентами', 1)
INSERT [dbo].[dolgjnost] ([name], [id_dolgj]) VALUES (N'Руководитель отдела технической поддержки', 2)
INSERT [dbo].[dolgjnost] ([name], [id_dolgj]) VALUES (N'Специалист ТП (выездной инженер)', 3)
INSERT [dbo].[dolgjnost] ([name], [id_dolgj]) VALUES (N'Директор по развитию', 4)
INSERT [dbo].[dolgjnost] ([name], [id_dolgj]) VALUES (N'Технический департамент', 5)
INSERT [dbo].[dolgjnost] ([name], [id_dolgj]) VALUES (N'Бухгалтер', 6)
INSERT [dbo].[dolgjnost] ([name], [id_dolgj]) VALUES (N'Менеджер по работе с клиентами', 7)
GO
INSERT [dbo].[gender] ([name], [id_gender]) VALUES (N'Женщина', 1)
INSERT [dbo].[gender] ([name], [id_gender]) VALUES (N'Мужчина', 2)
GO
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Ставрополь', 1)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Пенза', 2)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Дербент', 3)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Махачкала', 4)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Люберцы', 5)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Волжский', 6)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Щёлково', 7)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Пятигорск', 8)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Владимир', 9)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Бийск', 10)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Каменск - Уральский', 11)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Ярославль', 12)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Новочеркасск', 13)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Вологда', 14)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Пушкино', 15)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Ноябрьск', 16)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Новокузнецк', 17)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Магнитогорск', 18)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Нальчик', 19)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Йошкар-Ола', 20)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Ногинск', 21)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Королёв', 22)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Екатеринбург', 23)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Кемерово', 24)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Орехово-Зуево', 25)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Новошахтинск', 26)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Ижевск', 27)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Новомосковск', 28)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Коломна', 29)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Грозный', 30)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Тюмень', 31)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Копейск', 32)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Подольск', 33)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Тверь', 34)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Хабаровск', 35)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Саратов', 36)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Каспийск', 37)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Петропавловск-Камчатский', 38)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Сыктывкар', 39)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Елец', 40)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Оренбург', 41)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Шахты', 42)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Улан-Удэ', 43)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Рубцовск', 44)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Реутов', 45)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Березники', 46)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Волгоград', 47)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Одинцово', 48)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Астрахань', 49)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Череповец', 50)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Рыбинск', 51)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Калуга', 52)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Раменское', 53)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Омск', 54)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Чита', 55)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Владикавказ', 56)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Абакан', 57)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Санкт-Петербург', 58)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Владивосток', 59)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Пермь', 60)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Кострома', 61)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Мурманск', 62)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Киров', 63)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Златоуст', 64)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Курган', 65)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Саранск', 66)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Прокопьевск', 67)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Стерлитамак', 68)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Альметьевск', 69)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Тула', 70)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Красногорск', 71)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Балашиха', 72)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Электросталь', 73)
INSERT [dbo].[gorod] ([name], [id_gorod]) VALUES (N' Братск', 74)
GO
INSERT [dbo].[info_admin] ([id_info], [id_dolgj], [info]) VALUES (1, 1, N'"27 августа, собрание акционеров 12.00')
INSERT [dbo].[info_admin] ([id_info], [id_dolgj], [info]) VALUES (2, 7, N'"27 августа, 10.00. Планерка менеджеров')
INSERT [dbo].[info_admin] ([id_info], [id_dolgj], [info]) VALUES (3, 3, N'27 августа, собрание акционеров 12.00')
INSERT [dbo].[info_admin] ([id_info], [id_dolgj], [info]) VALUES (4, 3, N'15.00 27 августа собрание техдепартамента')
INSERT [dbo].[info_admin] ([id_info], [id_dolgj], [info]) VALUES (5, 2, N'')
INSERT [dbo].[info_admin] ([id_info], [id_dolgj], [info]) VALUES (6, 6, N'27 августа, собрание акционеров 12.00')
INSERT [dbo].[info_admin] ([id_info], [id_dolgj], [info]) VALUES (7, 4, N'15.00 27 августа собрание техдепартамента')
GO
INSERT [dbo].[magistral] ([number_magistral], [name]) VALUES (N'М0123ТНС312', N'Транспондер TS-100E,')
INSERT [dbo].[magistral] ([number_magistral], [name]) VALUES (N'М234ТНС12', N'Агрегирующий транспондер MS-100E-Т10')
INSERT [dbo].[magistral] ([number_magistral], [name]) VALUES (N'М431ТНС7647', N'Оптические волоконные усилители')
INSERT [dbo].[magistral] ([number_magistral], [name]) VALUES (N'М43535ТНС2677', N'Транспондер TD-3F')
INSERT [dbo].[magistral] ([number_magistral], [name]) VALUES (N'М455ТНС567', N'Агрегирующий транспондер MS-40E-Q10')
INSERT [dbo].[magistral] ([number_magistral], [name]) VALUES (N'М535623ТНС8899', N'Агрегатор MD-D3FS')
INSERT [dbo].[magistral] ([number_magistral], [name]) VALUES (N'М567ТНС87', N'Транспондер ТS-40E')
INSERT [dbo].[magistral] ([number_magistral], [name]) VALUES (N'М634ТНС67', N'SW-2G-8')
INSERT [dbo].[magistral] ([number_magistral], [name]) VALUES (N'М654ТНС878', N'CM-S-2G-6')
INSERT [dbo].[magistral] ([number_magistral], [name]) VALUES (N'М67ТНС98008', N'Агрегатор MS-10FX')
INSERT [dbo].[magistral] ([number_magistral], [name]) VALUES (N'М877ТНС132', N'«ИРТЫШ»')
INSERT [dbo].[magistral] ([number_magistral], [name]) VALUES (N'М8888ТНС231', N'Транспондер TD-10E')
GO
INSERT [dbo].[rayoun] ([id_rayoun], [name], [plosdad], [naselenie], [kolvo_stancii], [id_type_zastroiki]) VALUES (1, N'Василеостровский', 16.64, 211048, 3, 1)
INSERT [dbo].[rayoun] ([id_rayoun], [name], [plosdad], [naselenie], [kolvo_stancii], [id_type_zastroiki]) VALUES (2, N'Петроградский', 24, 125731, 4, 2)
INSERT [dbo].[rayoun] ([id_rayoun], [name], [plosdad], [naselenie], [kolvo_stancii], [id_type_zastroiki]) VALUES (3, N'Адмиралтейский', 13.82, 156958, 6, 1)
GO
INSERT [dbo].[seti_dostupa] ([number_dostupa], [id_seti]) VALUES (N'СД12ТНС_01', 23)
INSERT [dbo].[seti_dostupa] ([number_dostupa], [id_seti]) VALUES (N'СД12ТНС_02', 21)
INSERT [dbo].[seti_dostupa] ([number_dostupa], [id_seti]) VALUES (N'СД12ТНС_03', 21)
INSERT [dbo].[seti_dostupa] ([number_dostupa], [id_seti]) VALUES (N'СД12ТНС_04', 22)
INSERT [dbo].[seti_dostupa] ([number_dostupa], [id_seti]) VALUES (N'СД12ТНС_05', 25)
INSERT [dbo].[seti_dostupa] ([number_dostupa], [id_seti]) VALUES (N'СД12ТНС_06', 21)
INSERT [dbo].[seti_dostupa] ([number_dostupa], [id_seti]) VALUES (N'СД12ТНС_07', 6)
INSERT [dbo].[seti_dostupa] ([number_dostupa], [id_seti]) VALUES (N'СД12ТНС_08', 21)
INSERT [dbo].[seti_dostupa] ([number_dostupa], [id_seti]) VALUES (N'СД12ТНС_09', 21)
INSERT [dbo].[seti_dostupa] ([number_dostupa], [id_seti]) VALUES (N'СД12ТНС_10', 19)
INSERT [dbo].[seti_dostupa] ([number_dostupa], [id_seti]) VALUES (N'СД12ТНС_11', 2)
INSERT [dbo].[seti_dostupa] ([number_dostupa], [id_seti]) VALUES (N'СД12ТНС_12', 4)
INSERT [dbo].[seti_dostupa] ([number_dostupa], [id_seti]) VALUES (N'СД12ТНС_13', 3)
INSERT [dbo].[seti_dostupa] ([number_dostupa], [id_seti]) VALUES (N'СД12ТНС_14', 7)
INSERT [dbo].[seti_dostupa] ([number_dostupa], [id_seti]) VALUES (N'СД12ТНС_15', 3)
INSERT [dbo].[seti_dostupa] ([number_dostupa], [id_seti]) VALUES (N'СД12ТНС_16', 20)
INSERT [dbo].[seti_dostupa] ([number_dostupa], [id_seti]) VALUES (N'СД12ТНС_17', 5)
INSERT [dbo].[seti_dostupa] ([number_dostupa], [id_seti]) VALUES (N'СД12ТНС_18', 8)
INSERT [dbo].[seti_dostupa] ([number_dostupa], [id_seti]) VALUES (N'СД12ТНС_19', 1)
INSERT [dbo].[seti_dostupa] ([number_dostupa], [id_seti]) VALUES (N'СД12ТНС_20', 9)
INSERT [dbo].[seti_dostupa] ([number_dostupa], [id_seti]) VALUES (N'СД12ТНС_21', 18)
INSERT [dbo].[seti_dostupa] ([number_dostupa], [id_seti]) VALUES (N'СД12ТНС_22', 10)
INSERT [dbo].[seti_dostupa] ([number_dostupa], [id_seti]) VALUES (N'СД12ТНС_23', 17)
INSERT [dbo].[seti_dostupa] ([number_dostupa], [id_seti]) VALUES (N'СД12ТНС_24', 24)
INSERT [dbo].[seti_dostupa] ([number_dostupa], [id_seti]) VALUES (N'СД12ТНС_25', 11)
INSERT [dbo].[seti_dostupa] ([number_dostupa], [id_seti]) VALUES (N'СД12ТНС_26', 12)
INSERT [dbo].[seti_dostupa] ([number_dostupa], [id_seti]) VALUES (N'СД12ТНС_27', 13)
INSERT [dbo].[seti_dostupa] ([number_dostupa], [id_seti]) VALUES (N'СД12ТНС_28', 16)
INSERT [dbo].[seti_dostupa] ([number_dostupa], [id_seti]) VALUES (N'СД12ТНС_29', 14)
INSERT [dbo].[seti_dostupa] ([number_dostupa], [id_seti]) VALUES (N'СД12ТНС_30', 15)
GO
INSERT [dbo].[seti_name] ([name], [id_seti]) VALUES (N'Интернет маршрутизатор D-Link DIR-645', 1)
INSERT [dbo].[seti_name] ([name], [id_seti]) VALUES (N'Интернет маршрутизатор D-Link DIR-815', 2)
INSERT [dbo].[seti_name] ([name], [id_seti]) VALUES (N'Интернет маршрутизатор D-Link DIR-825', 3)
INSERT [dbo].[seti_name] ([name], [id_seti]) VALUES (N'Интернет маршрутизатор D-Link DIR-842', 4)
INSERT [dbo].[seti_name] ([name], [id_seti]) VALUES (N'Интернет маршрутизатор D-link DWR-921', 5)
INSERT [dbo].[seti_name] ([name], [id_seti]) VALUES (N'Коммутатор Cisco', 6)
INSERT [dbo].[seti_name] ([name], [id_seti]) VALUES (N'Коммутатор D-Link DES-1008P', 7)
INSERT [dbo].[seti_name] ([name], [id_seti]) VALUES (N'Коммутатор D-Link DES-3200-28', 8)
INSERT [dbo].[seti_name] ([name], [id_seti]) VALUES (N'Коммутатор D-Link DGS-1210-28P', 9)
INSERT [dbo].[seti_name] ([name], [id_seti]) VALUES (N'Коммутатор Hewlett Packard Enterprise OfficeConnect 1405-8G v3', 10)
INSERT [dbo].[seti_name] ([name], [id_seti]) VALUES (N'Коммутатор HP 1420-24G-2SFP', 11)
INSERT [dbo].[seti_name] ([name], [id_seti]) VALUES (N'Коммутатор HP 3100-24 v2 EI', 12)
INSERT [dbo].[seti_name] ([name], [id_seti]) VALUES (N'Коммутатор HP 5500-24G EI #JD377A', 13)
INSERT [dbo].[seti_name] ([name], [id_seti]) VALUES (N'Коммутатор HP Aruba 2530-24-PoE+', 14)
INSERT [dbo].[seti_name] ([name], [id_seti]) VALUES (N'Коммутатор HP Aruba 2530-48-PoE+', 15)
INSERT [dbo].[seti_name] ([name], [id_seti]) VALUES (N'Коммутатор HP Enterprise 1950-24G-2SFP+-2XGT', 16)
INSERT [dbo].[seti_name] ([name], [id_seti]) VALUES (N'Коммутатор HP OfficeConnect 1420-8G', 17)
INSERT [dbo].[seti_name] ([name], [id_seti]) VALUES (N'Коммутатор Switch D-Link', 18)
INSERT [dbo].[seti_name] ([name], [id_seti]) VALUES (N'Коммутатор Switch D-Link DES-1008D', 19)
INSERT [dbo].[seti_name] ([name], [id_seti]) VALUES (N'Коммутатор Switch D-Link DGS-1008MP', 20)
INSERT [dbo].[seti_name] ([name], [id_seti]) VALUES (N'Точка доступа Cisco', 21)
INSERT [dbo].[seti_name] ([name], [id_seti]) VALUES (N'Точка доступа Cisco AIR-SAP2602E', 22)
INSERT [dbo].[seti_name] ([name], [id_seti]) VALUES (N'Точка доступа Cisco AIR-SAP702I', 23)
INSERT [dbo].[seti_name] ([name], [id_seti]) VALUES (N'Точка доступа HP ProCurve', 24)
INSERT [dbo].[seti_name] ([name], [id_seti]) VALUES (N'Трансивер X2-10GB-LX4 Cisco', 25)
GO
INSERT [dbo].[status] ([name], [id_status]) VALUES (N'новая', 1)
INSERT [dbo].[status] ([name], [id_status]) VALUES (N'Требует выезда', 2)
INSERT [dbo].[status] ([name], [id_status]) VALUES (N'Закрыта', 3)
GO
INSERT [dbo].[strana] ([name], [id_strana]) VALUES (N'Россия', 1)
GO
INSERT [dbo].[type_problem] ([name], [id_type_problem]) VALUES (N'ТО', 1)
INSERT [dbo].[type_problem] ([name], [id_type_problem]) VALUES (N'консультация', 2)
GO
INSERT [dbo].[type_uslugi] ([name], [id_type_uslugi]) VALUES (N'Подключение услуг на существующей инфраструктуре', 1)
INSERT [dbo].[type_uslugi] ([name], [id_type_uslugi]) VALUES (N'Нет доступа к услуге', 2)
INSERT [dbo].[type_uslugi] ([name], [id_type_uslugi]) VALUES (N'Низкая скорость соединения', 3)
INSERT [dbo].[type_uslugi] ([name], [id_type_uslugi]) VALUES (N'Подключение услуг на новой инфраструктуре', 4)
INSERT [dbo].[type_uslugi] ([name], [id_type_uslugi]) VALUES (N'Подключение на новой инфраструктуре', 5)
GO
INSERT [dbo].[type_zastroyki] ([name], [id_type_zastroiki]) VALUES (N'Плотная городская застройка', 1)
INSERT [dbo].[type_zastroyki] ([name], [id_type_zastroiki]) VALUES (N'Средняя городская застройка', 2)
GO
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' ЯнкиКупалы', 1)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Новый пер.', 2)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Речной пер.', 3)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Рабочая', 4)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Солнечная', 5)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Максима Горького', 6)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Новая', 7)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Дружбы', 8)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Вокзальная', 9)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Чапаева', 10)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Зеленая', 11)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Шоссейная', 12)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Первомайская', 13)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Речная', 14)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Радужная', 15)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Социалистическая', 16)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Гагарина', 17)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Сосновая', 18)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Центральная', 19)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Октябрьский пер.', 20)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Победы', 21)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Почтовая', 22)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Лесная', 23)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Строителей', 24)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Ленина В.И.ул.', 25)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Советская', 26)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Колхозная', 27)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Мира', 28)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Озерный пер.', 29)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Партизанская', 30)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Приозерная', 31)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Октябрьская', 32)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Ленина', 33)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Центральный пер.', 34)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Песчаная', 35)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Минская', 36)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Зеленый пер.', 37)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Мирная', 38)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Озерная', 39)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Совхозная', 40)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Цветочная', 41)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Севернаяул.', 42)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Луговая', 43)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Белорусская', 44)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Колхозный пер.', 45)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Заслонова', 46)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Луговой пер.', 47)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Первомайский пер.', 48)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Пионерская', 49)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Мичурина', 50)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Советский пер.', 51)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Набережная', 52)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Садовая', 53)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Кирова', 54)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Молодежный пер.', 55)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Спортивная', 56)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Парковая', 57)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Интернациональная', 58)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Полевой пер.', 59)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' 3 Марта', 60)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Хуторская', 61)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Пролетарская', 62)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Школьная', 63)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Дачная', 64)
INSERT [dbo].[ulitca] ([name], [id_ulitca]) VALUES (N' Красноармейская', 65)
GO
INSERT [dbo].[uslugaCRM] ([name], [id_usligaCRM]) VALUES (N'Видеонаблюдение', 1)
INSERT [dbo].[uslugaCRM] ([name], [id_usligaCRM]) VALUES (N'Интернет', 2)
INSERT [dbo].[uslugaCRM] ([name], [id_usligaCRM]) VALUES (N'ТВ', 3)
GO
INSERT [dbo].[uslugi] ([name], [id_uslugi]) VALUES (N'Интернет', 1)
INSERT [dbo].[uslugi] ([name], [id_uslugi]) VALUES (N'ТВ', 2)
INSERT [dbo].[uslugi] ([name], [id_uslugi]) VALUES (N'Видеонаблюдение', 3)
GO
INSERT [dbo].[vid_uslugi] ([name], [id_vid_uslugi]) VALUES (N'Подключение', 1)
INSERT [dbo].[vid_uslugi] ([name], [id_vid_uslugi]) VALUES (N'Диагностика и настройка оборудования/подключения', 2)
GO
INSERT [dbo].[zayavka_CRM] ([id_CRM], [id_uslugaCRM], [id_vid_uslugi], [id_type_uslugi], [id_status], [type_oborud], [opisanie_problem], [date_zakritie], [id_type_problem]) VALUES (N'0977', 1, 1, 1, 2, NULL, N'yruy', NULL, 1)
INSERT [dbo].[zayavka_CRM] ([id_CRM], [id_uslugaCRM], [id_vid_uslugi], [id_type_uslugi], [id_status], [type_oborud], [opisanie_problem], [date_zakritie], [id_type_problem]) VALUES (N'57843839', 1, 1, 2, 2, NULL, N'aaaaaaa', NULL, 2)
INSERT [dbo].[zayavka_CRM] ([id_CRM], [id_uslugaCRM], [id_vid_uslugi], [id_type_uslugi], [id_status], [type_oborud], [opisanie_problem], [date_zakritie], [id_type_problem]) VALUES (N'785493421', 1, 1, 1, 1, N'IP', N'Подключить услугу, разводка до двери есть, порт 12', NULL, 1)
INSERT [dbo].[zayavka_CRM] ([id_CRM], [id_uslugaCRM], [id_vid_uslugi], [id_type_uslugi], [id_status], [type_oborud], [opisanie_problem], [date_zakritie], [id_type_problem]) VALUES (N'785493424', 2, 2, 3, 2, N'IP', N'', CAST(N'2021-08-25' AS Date), 1)
INSERT [dbo].[zayavka_CRM] ([id_CRM], [id_uslugaCRM], [id_vid_uslugi], [id_type_uslugi], [id_status], [type_oborud], [opisanie_problem], [date_zakritie], [id_type_problem]) VALUES (N'785493427', 1, 2, 3, 2, N'IP', N'', NULL, 1)
INSERT [dbo].[zayavka_CRM] ([id_CRM], [id_uslugaCRM], [id_vid_uslugi], [id_type_uslugi], [id_status], [type_oborud], [opisanie_problem], [date_zakritie], [id_type_problem]) VALUES (N'785493428', 1, 2, 2, 2, N'IP', N'', NULL, 1)
INSERT [dbo].[zayavka_CRM] ([id_CRM], [id_uslugaCRM], [id_vid_uslugi], [id_type_uslugi], [id_status], [type_oborud], [opisanie_problem], [date_zakritie], [id_type_problem]) VALUES (N'785493429', 2, 2, 2, 2, N'IP', N'', NULL, 1)
INSERT [dbo].[zayavka_CRM] ([id_CRM], [id_uslugaCRM], [id_vid_uslugi], [id_type_uslugi], [id_status], [type_oborud], [opisanie_problem], [date_zakritie], [id_type_problem]) VALUES (N'785493431', 2, 2, 3, 2, N'IP', N'', NULL, 1)
INSERT [dbo].[zayavka_CRM] ([id_CRM], [id_uslugaCRM], [id_vid_uslugi], [id_type_uslugi], [id_status], [type_oborud], [opisanie_problem], [date_zakritie], [id_type_problem]) VALUES (N'785493434', 2, 2, 2, 2, N'IP', N'', NULL, 1)
INSERT [dbo].[zayavka_CRM] ([id_CRM], [id_uslugaCRM], [id_vid_uslugi], [id_type_uslugi], [id_status], [type_oborud], [opisanie_problem], [date_zakritie], [id_type_problem]) VALUES (N'785493453', 2, 2, 2, 2, N'IP', N'', NULL, 1)
INSERT [dbo].[zayavka_CRM] ([id_CRM], [id_uslugaCRM], [id_vid_uslugi], [id_type_uslugi], [id_status], [type_oborud], [opisanie_problem], [date_zakritie], [id_type_problem]) VALUES (N'785493457', 2, 2, 2, 2, N'IP', N'', NULL, 1)
INSERT [dbo].[zayavka_CRM] ([id_CRM], [id_uslugaCRM], [id_vid_uslugi], [id_type_uslugi], [id_status], [type_oborud], [opisanie_problem], [date_zakritie], [id_type_problem]) VALUES (N'785493464', 2, 2, 2, 2, N'IP', N'', NULL, 1)
INSERT [dbo].[zayavka_CRM] ([id_CRM], [id_uslugaCRM], [id_vid_uslugi], [id_type_uslugi], [id_status], [type_oborud], [opisanie_problem], [date_zakritie], [id_type_problem]) VALUES (N'785493469', 1, 1, 5, 2, N'IP', N'От распределительного шкафа в подвале', NULL, 1)
INSERT [dbo].[zayavka_CRM] ([id_CRM], [id_uslugaCRM], [id_vid_uslugi], [id_type_uslugi], [id_status], [type_oborud], [opisanie_problem], [date_zakritie], [id_type_problem]) VALUES (N'785493494', 1, 1, 5, 2, N'IP', N'От распределительного шкафа в подвале', NULL, 1)
INSERT [dbo].[zayavka_CRM] ([id_CRM], [id_uslugaCRM], [id_vid_uslugi], [id_type_uslugi], [id_status], [type_oborud], [opisanie_problem], [date_zakritie], [id_type_problem]) VALUES (N'785493495', 1, 2, 2, 2, N'IP', N'', NULL, 1)
INSERT [dbo].[zayavka_CRM] ([id_CRM], [id_uslugaCRM], [id_vid_uslugi], [id_type_uslugi], [id_status], [type_oborud], [opisanie_problem], [date_zakritie], [id_type_problem]) VALUES (N'785493496', 2, 2, 2, 2, N'IP', N'', NULL, 1)
INSERT [dbo].[zayavka_CRM] ([id_CRM], [id_uslugaCRM], [id_vid_uslugi], [id_type_uslugi], [id_status], [type_oborud], [opisanie_problem], [date_zakritie], [id_type_problem]) VALUES (N'785493497', 3, 2, 2, 2, N'IP', N'', NULL, 1)
INSERT [dbo].[zayavka_CRM] ([id_CRM], [id_uslugaCRM], [id_vid_uslugi], [id_type_uslugi], [id_status], [type_oborud], [opisanie_problem], [date_zakritie], [id_type_problem]) VALUES (N'785493498', 3, 1, 5, 2, N'IP', N'От распределительного шкафа в подвале', NULL, 1)
INSERT [dbo].[zayavka_CRM] ([id_CRM], [id_uslugaCRM], [id_vid_uslugi], [id_type_uslugi], [id_status], [type_oborud], [opisanie_problem], [date_zakritie], [id_type_problem]) VALUES (N'785493499', 2, 2, 2, 2, N'IP', N'', NULL, 1)
INSERT [dbo].[zayavka_CRM] ([id_CRM], [id_uslugaCRM], [id_vid_uslugi], [id_type_uslugi], [id_status], [type_oborud], [opisanie_problem], [date_zakritie], [id_type_problem]) VALUES (N'785493500', 2, 2, 2, 2, N'IP', N'', NULL, 1)
INSERT [dbo].[zayavka_CRM] ([id_CRM], [id_uslugaCRM], [id_vid_uslugi], [id_type_uslugi], [id_status], [type_oborud], [opisanie_problem], [date_zakritie], [id_type_problem]) VALUES (N'785493501', 3, 2, 2, 2, N'IP', N'', NULL, 1)
INSERT [dbo].[zayavka_CRM] ([id_CRM], [id_uslugaCRM], [id_vid_uslugi], [id_type_uslugi], [id_status], [type_oborud], [opisanie_problem], [date_zakritie], [id_type_problem]) VALUES (N'785493502', 3, 2, 2, 2, N'IP', N'', NULL, 1)
INSERT [dbo].[zayavka_CRM] ([id_CRM], [id_uslugaCRM], [id_vid_uslugi], [id_type_uslugi], [id_status], [type_oborud], [opisanie_problem], [date_zakritie], [id_type_problem]) VALUES (N'785493503', 2, 1, 5, 2, N'IP', N'От распределительного шкафа в подвале', NULL, 1)
INSERT [dbo].[zayavka_CRM] ([id_CRM], [id_uslugaCRM], [id_vid_uslugi], [id_type_uslugi], [id_status], [type_oborud], [opisanie_problem], [date_zakritie], [id_type_problem]) VALUES (N'785493504', 2, 2, 2, 2, N'IP', N'', NULL, 1)
INSERT [dbo].[zayavka_CRM] ([id_CRM], [id_uslugaCRM], [id_vid_uslugi], [id_type_uslugi], [id_status], [type_oborud], [opisanie_problem], [date_zakritie], [id_type_problem]) VALUES (N'785493505', 1, 1, 5, 2, N'IP', N'От распределительного шкафа в подвале', NULL, 1)
INSERT [dbo].[zayavka_CRM] ([id_CRM], [id_uslugaCRM], [id_vid_uslugi], [id_type_uslugi], [id_status], [type_oborud], [opisanie_problem], [date_zakritie], [id_type_problem]) VALUES (N'785493506', 2, 2, 2, 2, N'IP', N'', NULL, 1)
GO
ALTER TABLE [dbo].[admin]  WITH CHECK ADD  CONSTRAINT [FK_admin_dolgjnost] FOREIGN KEY([id_dolgj])
REFERENCES [dbo].[dolgjnost] ([id_dolgj])
GO
ALTER TABLE [dbo].[admin] CHECK CONSTRAINT [FK_admin_dolgjnost]
GO
ALTER TABLE [dbo].[adress_client]  WITH CHECK ADD  CONSTRAINT [FK_adress_client_gorod] FOREIGN KEY([id_gorod])
REFERENCES [dbo].[gorod] ([id_gorod])
GO
ALTER TABLE [dbo].[adress_client] CHECK CONSTRAINT [FK_adress_client_gorod]
GO
ALTER TABLE [dbo].[adress_client]  WITH CHECK ADD  CONSTRAINT [FK_adress_client_strana] FOREIGN KEY([id_strana])
REFERENCES [dbo].[strana] ([id_strana])
GO
ALTER TABLE [dbo].[adress_client] CHECK CONSTRAINT [FK_adress_client_strana]
GO
ALTER TABLE [dbo].[adress_client]  WITH CHECK ADD  CONSTRAINT [FK_adress_client_ulitca] FOREIGN KEY([id_ulicta])
REFERENCES [dbo].[ulitca] ([id_ulitca])
GO
ALTER TABLE [dbo].[adress_client] CHECK CONSTRAINT [FK_adress_client_ulitca]
GO
ALTER TABLE [dbo].[client]  WITH CHECK ADD  CONSTRAINT [FK_client_adress_client] FOREIGN KEY([id_adress_client])
REFERENCES [dbo].[adress_client] ([id_adress_client])
GO
ALTER TABLE [dbo].[client] CHECK CONSTRAINT [FK_client_adress_client]
GO
ALTER TABLE [dbo].[client]  WITH CHECK ADD  CONSTRAINT [FK_client_contract type] FOREIGN KEY([id_contract])
REFERENCES [dbo].[contract type] ([id_contract])
GO
ALTER TABLE [dbo].[client] CHECK CONSTRAINT [FK_client_contract type]
GO
ALTER TABLE [dbo].[client]  WITH CHECK ADD  CONSTRAINT [FK_client_gender] FOREIGN KEY([id_gender])
REFERENCES [dbo].[gender] ([id_gender])
GO
ALTER TABLE [dbo].[client] CHECK CONSTRAINT [FK_client_gender]
GO
ALTER TABLE [dbo].[client_uslugi]  WITH CHECK ADD  CONSTRAINT [FK_client_uslugi_client] FOREIGN KEY([id_client])
REFERENCES [dbo].[client] ([id_client])
GO
ALTER TABLE [dbo].[client_uslugi] CHECK CONSTRAINT [FK_client_uslugi_client]
GO
ALTER TABLE [dbo].[client_uslugi]  WITH CHECK ADD  CONSTRAINT [FK_client_uslugi_uslugi] FOREIGN KEY([id_uslugi])
REFERENCES [dbo].[uslugi] ([id_uslugi])
GO
ALTER TABLE [dbo].[client_uslugi] CHECK CONSTRAINT [FK_client_uslugi_uslugi]
GO
ALTER TABLE [dbo].[info_admin]  WITH CHECK ADD  CONSTRAINT [FK_info_admin_dolgjnost] FOREIGN KEY([id_dolgj])
REFERENCES [dbo].[dolgjnost] ([id_dolgj])
GO
ALTER TABLE [dbo].[info_admin] CHECK CONSTRAINT [FK_info_admin_dolgjnost]
GO
ALTER TABLE [dbo].[rayoun]  WITH CHECK ADD  CONSTRAINT [FK_rayoun_type_zastroyki] FOREIGN KEY([id_type_zastroiki])
REFERENCES [dbo].[type_zastroyki] ([id_type_zastroiki])
GO
ALTER TABLE [dbo].[rayoun] CHECK CONSTRAINT [FK_rayoun_type_zastroyki]
GO
ALTER TABLE [dbo].[seti_dostupa]  WITH CHECK ADD  CONSTRAINT [FK_seti_dostupa_seti_name] FOREIGN KEY([id_seti])
REFERENCES [dbo].[seti_name] ([id_seti])
GO
ALTER TABLE [dbo].[seti_dostupa] CHECK CONSTRAINT [FK_seti_dostupa_seti_name]
GO
ALTER TABLE [dbo].[zayavka_CRM]  WITH CHECK ADD  CONSTRAINT [FK_zayavka_CRM_status] FOREIGN KEY([id_status])
REFERENCES [dbo].[status] ([id_status])
GO
ALTER TABLE [dbo].[zayavka_CRM] CHECK CONSTRAINT [FK_zayavka_CRM_status]
GO
ALTER TABLE [dbo].[zayavka_CRM]  WITH CHECK ADD  CONSTRAINT [FK_zayavka_CRM_type_problem] FOREIGN KEY([id_type_problem])
REFERENCES [dbo].[type_problem] ([id_type_problem])
GO
ALTER TABLE [dbo].[zayavka_CRM] CHECK CONSTRAINT [FK_zayavka_CRM_type_problem]
GO
ALTER TABLE [dbo].[zayavka_CRM]  WITH CHECK ADD  CONSTRAINT [FK_zayavka_CRM_type_uslugi] FOREIGN KEY([id_type_uslugi])
REFERENCES [dbo].[type_uslugi] ([id_type_uslugi])
GO
ALTER TABLE [dbo].[zayavka_CRM] CHECK CONSTRAINT [FK_zayavka_CRM_type_uslugi]
GO
ALTER TABLE [dbo].[zayavka_CRM]  WITH CHECK ADD  CONSTRAINT [FK_zayavka_CRM_uslugaCRM] FOREIGN KEY([id_uslugaCRM])
REFERENCES [dbo].[uslugaCRM] ([id_usligaCRM])
GO
ALTER TABLE [dbo].[zayavka_CRM] CHECK CONSTRAINT [FK_zayavka_CRM_uslugaCRM]
GO
ALTER TABLE [dbo].[zayavka_CRM]  WITH CHECK ADD  CONSTRAINT [FK_zayavka_CRM_vid_uslugi] FOREIGN KEY([id_vid_uslugi])
REFERENCES [dbo].[vid_uslugi] ([id_vid_uslugi])
GO
ALTER TABLE [dbo].[zayavka_CRM] CHECK CONSTRAINT [FK_zayavka_CRM_vid_uslugi]
GO
USE [master]
GO
ALTER DATABASE [uchebka] SET  READ_WRITE 
GO
