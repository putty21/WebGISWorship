PGDMP      4        
    	        w            bkt_tourism    10.5    10.5    u           0    0    ENCODING    ENCODING     #   SET client_encoding = 'SQL_ASCII';
                       false            v           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            w           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            x           1262    118768    bkt_tourism    DATABASE     �   CREATE DATABASE bkt_tourism WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_Indonesia.1252' LC_CTYPE = 'English_Indonesia.1252';
    DROP DATABASE bkt_tourism;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            y           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    13                        2615    119107    tiger    SCHEMA        CREATE SCHEMA tiger;
    DROP SCHEMA tiger;
             postgres    false                        2615    119108 
   tiger_data    SCHEMA        CREATE SCHEMA tiger_data;
    DROP SCHEMA tiger_data;
             postgres    false                        2615    119109    topology    SCHEMA        CREATE SCHEMA topology;
    DROP SCHEMA topology;
             postgres    false            z           0    0    SCHEMA topology    COMMENT     9   COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';
                  postgres    false    17                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            {           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            	            3079    119110    address_standardizer 	   EXTENSION     H   CREATE EXTENSION IF NOT EXISTS address_standardizer WITH SCHEMA public;
 %   DROP EXTENSION address_standardizer;
                  false    13            |           0    0    EXTENSION address_standardizer    COMMENT     �   COMMENT ON EXTENSION address_standardizer IS 'Used to parse an address into constituent elements. Generally used to support geocoding address normalization step.';
                       false    9                        3079    119117    fuzzystrmatch 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;
    DROP EXTENSION fuzzystrmatch;
                  false    13            }           0    0    EXTENSION fuzzystrmatch    COMMENT     ]   COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';
                       false    8                        3079    119128    ogr_fdw 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS ogr_fdw WITH SCHEMA public;
    DROP EXTENSION ogr_fdw;
                  false    13            ~           0    0    EXTENSION ogr_fdw    COMMENT     L   COMMENT ON EXTENSION ogr_fdw IS 'foreign-data wrapper for GIS data access';
                       false    7                        3079    119132    postgis 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
    DROP EXTENSION postgis;
                  false    13                       0    0    EXTENSION postgis    COMMENT     g   COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';
                       false    6                        3079    120658 	   pgrouting 	   EXTENSION     =   CREATE EXTENSION IF NOT EXISTS pgrouting WITH SCHEMA public;
    DROP EXTENSION pgrouting;
                  false    13    6            �           0    0    EXTENSION pgrouting    COMMENT     9   COMMENT ON EXTENSION pgrouting IS 'pgRouting Extension';
                       false    5                        3079    120860 
   pointcloud 	   EXTENSION     >   CREATE EXTENSION IF NOT EXISTS pointcloud WITH SCHEMA public;
    DROP EXTENSION pointcloud;
                  false    13            �           0    0    EXTENSION pointcloud    COMMENT     G   COMMENT ON EXTENSION pointcloud IS 'data type for lidar point clouds';
                       false    4                        3079    120956    pointcloud_postgis 	   EXTENSION     F   CREATE EXTENSION IF NOT EXISTS pointcloud_postgis WITH SCHEMA public;
 #   DROP EXTENSION pointcloud_postgis;
                  false    6    13    4            �           0    0    EXTENSION pointcloud_postgis    COMMENT     n   COMMENT ON EXTENSION pointcloud_postgis IS 'integration for pointcloud LIDAR data and PostGIS geometry data';
                       false    3                        3079    120967    postgis_sfcgal 	   EXTENSION     B   CREATE EXTENSION IF NOT EXISTS postgis_sfcgal WITH SCHEMA public;
    DROP EXTENSION postgis_sfcgal;
                  false    6    13            �           0    0    EXTENSION postgis_sfcgal    COMMENT     C   COMMENT ON EXTENSION postgis_sfcgal IS 'PostGIS SFCGAL functions';
                       false    2            
            3079    120985    postgis_tiger_geocoder 	   EXTENSION     I   CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder WITH SCHEMA tiger;
 '   DROP EXTENSION postgis_tiger_geocoder;
                  false    15    6    8            �           0    0     EXTENSION postgis_tiger_geocoder    COMMENT     ^   COMMENT ON EXTENSION postgis_tiger_geocoder IS 'PostGIS tiger geocoder and reverse geocoder';
                       false    10                        3079    121412    postgis_topology 	   EXTENSION     F   CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;
 !   DROP EXTENSION postgis_topology;
                  false    6    17            �           0    0    EXTENSION postgis_topology    COMMENT     Y   COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';
                       false    11            �            1259    118769    admin_restaurant    TABLE     z   CREATE TABLE public.admin_restaurant (
    username character varying(15) NOT NULL,
    password character varying(35)
);
 $   DROP TABLE public.admin_restaurant;
       public         postgres    false    13            �            1259    118772    administrators    TABLE     }  CREATE TABLE public.administrators (
    stewardship_period character varying(9) NOT NULL,
    id_worship_place character(5) NOT NULL,
    name character varying(30),
    address character varying(50),
    hp character varying(12),
    role character varying(1),
    username character varying(15),
    password character varying(32),
    last_login timestamp without time zone
);
 "   DROP TABLE public.administrators;
       public         postgres    false    13            S           1259    121553    angkot    TABLE     !  CREATE TABLE public.angkot (
    id character varying(5) NOT NULL,
    destination character varying(20) NOT NULL,
    track character varying(50) NOT NULL,
    geom public.geometry,
    id_color integer,
    cost integer,
    number character(5),
    route_color character varying(10)
);
    DROP TABLE public.angkot;
       public         postgres    false    6    6    13    13    6    13    6    13    6    13    6    13    6    13    6    13    13            �            1259    118775    angkot_color    TABLE     W   CREATE TABLE public.angkot_color (
    id integer NOT NULL,
    color character(20)
);
     DROP TABLE public.angkot_color;
       public         postgres    false    13            �            1259    118778    angkot_gallery    TABLE     �   CREATE TABLE public.angkot_gallery (
    serial_number integer NOT NULL,
    id character varying(5) NOT NULL,
    gallery_angkot character varying(10) NOT NULL
);
 "   DROP TABLE public.angkot_gallery;
       public         postgres    false    13            �            1259    118781    category_worship_place    TABLE     h   CREATE TABLE public.category_worship_place (
    id integer NOT NULL,
    name character varying(10)
);
 *   DROP TABLE public.category_worship_place;
       public         postgres    false    13            �            1259    118784    culinary    TABLE     R   CREATE TABLE public.culinary (
    id integer NOT NULL,
    name character(20)
);
    DROP TABLE public.culinary;
       public         postgres    false    13            �            1259    118787    culinary_gallery    TABLE     �   CREATE TABLE public.culinary_gallery (
    serial_number integer NOT NULL,
    id character(5) NOT NULL,
    gallery_culinary character varying(10)
);
 $   DROP TABLE public.culinary_gallery;
       public         postgres    false    13            T           1259    121559    culinary_place    TABLE     ?  CREATE TABLE public.culinary_place (
    gid integer NOT NULL,
    name character(30),
    address character(50),
    cp character(12),
    capacity integer,
    geom public.geometry(MultiPolygon),
    open time without time zone,
    close time without time zone,
    employee integer,
    id character(5) NOT NULL
);
 "   DROP TABLE public.culinary_place;
       public         postgres    false    13    6    6    13    13    6    13    6    13    6    13    6    13    6    13    6    13            �            1259    118790    detail_culinary    TABLE     �   CREATE TABLE public.detail_culinary (
    id_culinary_place character(5) NOT NULL,
    id_culinary integer NOT NULL,
    price integer
);
 #   DROP TABLE public.detail_culinary;
       public         postgres    false    13            �            1259    118793    detail_culinary_place    TABLE     �   CREATE TABLE public.detail_culinary_place (
    id_culinary_place character(5) NOT NULL,
    id_angkot character(5) NOT NULL,
    lat character(15),
    lng character(15),
    description character(30)
);
 )   DROP TABLE public.detail_culinary_place;
       public         postgres    false    13            �            1259    118796    detail_event    TABLE     �   CREATE TABLE public.detail_event (
    date date NOT NULL,
    "time" time without time zone NOT NULL,
    id_ustad integer NOT NULL,
    id_event integer,
    id_worship_place character varying(5) NOT NULL,
    description text
);
     DROP TABLE public.detail_event;
       public         postgres    false    13            �            1259    118802    detail_facility    TABLE     �   CREATE TABLE public.detail_facility (
    id_facility integer NOT NULL,
    id_worship_place character varying(5) NOT NULL,
    id_facility_condition integer
);
 #   DROP TABLE public.detail_facility;
       public         postgres    false    13            �            1259    118805    detail_facility_culinary    TABLE     �   CREATE TABLE public.detail_facility_culinary (
    id_culinary_place character(5) NOT NULL,
    id_facility character(1) NOT NULL
);
 ,   DROP TABLE public.detail_facility_culinary;
       public         postgres    false    13            �            1259    118808    detail_facility_hotel    TABLE     t   CREATE TABLE public.detail_facility_hotel (
    id_hotel character(5) NOT NULL,
    id_facility integer NOT NULL
);
 )   DROP TABLE public.detail_facility_hotel;
       public         postgres    false    13            �            1259    118811    detail_facility_restaurant    TABLE     ~   CREATE TABLE public.detail_facility_restaurant (
    id_facility integer NOT NULL,
    id_restaurant character(5) NOT NULL
);
 .   DROP TABLE public.detail_facility_restaurant;
       public         postgres    false    13            �            1259    118814    detail_facility_tourism    TABLE     }   CREATE TABLE public.detail_facility_tourism (
    id_tourism character(5) NOT NULL,
    id_facility character(1) NOT NULL
);
 +   DROP TABLE public.detail_facility_tourism;
       public         postgres    false    13            �            1259    118817    detail_hotel    TABLE     �   CREATE TABLE public.detail_hotel (
    id_angkot character(5) NOT NULL,
    id_hotel character(5) NOT NULL,
    lat character(15),
    lng character(15),
    description character(30)
);
     DROP TABLE public.detail_hotel;
       public         postgres    false    13            �            1259    118820    detail_menu    TABLE     �   CREATE TABLE public.detail_menu (
    id_restaurant character(5) NOT NULL,
    id_special_menu integer NOT NULL,
    price integer
);
    DROP TABLE public.detail_menu;
       public         postgres    false    13            �            1259    118823    detail_product_small_industry    TABLE     �   CREATE TABLE public.detail_product_small_industry (
    id_product integer NOT NULL,
    id_small_industry character(5) NOT NULL,
    price integer
);
 1   DROP TABLE public.detail_product_small_industry;
       public         postgres    false    13            �            1259    118826    detail_product_souvenir    TABLE     �   CREATE TABLE public.detail_product_souvenir (
    id_product integer NOT NULL,
    id_souvenir character(5) NOT NULL,
    price integer
);
 +   DROP TABLE public.detail_product_souvenir;
       public         postgres    false    13            �            1259    118829    detail_restaurant    TABLE     �   CREATE TABLE public.detail_restaurant (
    id_angkot character varying(5) NOT NULL,
    id_restaurant character varying(5) NOT NULL,
    lat character varying(15),
    lng character varying(15),
    description character varying(30)
);
 %   DROP TABLE public.detail_restaurant;
       public         postgres    false    13            �            1259    118832    detail_room    TABLE     f   CREATE TABLE public.detail_room (
    id_room integer NOT NULL,
    id_hotel character(5) NOT NULL
);
    DROP TABLE public.detail_room;
       public         postgres    false    13            �            1259    118835    detail_small_industry    TABLE     �   CREATE TABLE public.detail_small_industry (
    id_small_industry character(5) NOT NULL,
    id_angkot character(5) NOT NULL,
    lat character(15),
    lng character(15),
    description character(30)
);
 )   DROP TABLE public.detail_small_industry;
       public         postgres    false    13            �            1259    118838    detail_souvenir    TABLE     �   CREATE TABLE public.detail_souvenir (
    id_souvenir character(5) NOT NULL,
    id_angkot character(5) NOT NULL,
    lat character(15),
    lng character(15),
    description character(30)
);
 #   DROP TABLE public.detail_souvenir;
       public         postgres    false    13            �            1259    118841    detail_tourism    TABLE     �   CREATE TABLE public.detail_tourism (
    id_angkot character(5) NOT NULL,
    id_tourism character(5) NOT NULL,
    lat character(15),
    lng character(15),
    description character(30)
);
 "   DROP TABLE public.detail_tourism;
       public         postgres    false    13            �            1259    118844    detail_worship_place    TABLE     �   CREATE TABLE public.detail_worship_place (
    id_angkot character(5) NOT NULL,
    id_worship_place character varying(5) NOT NULL,
    lat character varying(15),
    lng character varying(15),
    description character varying(30)
);
 (   DROP TABLE public.detail_worship_place;
       public         postgres    false    13            U           1259    121565    district    TABLE     �   CREATE TABLE public.district (
    geom public.geometry(MultiPolygonZM),
    id character varying(4) NOT NULL,
    name character varying(25)
);
    DROP TABLE public.district;
       public         postgres    false    6    6    13    13    6    13    6    13    6    13    6    13    6    13    6    13    13            �            1259    118847    event    TABLE     �   CREATE TABLE public.event (
    id integer NOT NULL,
    name character varying(30),
    description text,
    id_type_event integer
);
    DROP TABLE public.event;
       public         postgres    false    13            �            1259    118853    facility    TABLE     Z   CREATE TABLE public.facility (
    id integer NOT NULL,
    name character varying(20)
);
    DROP TABLE public.facility;
       public         postgres    false    13            �            1259    118856    facility_condition    TABLE     h   CREATE TABLE public.facility_condition (
    id integer NOT NULL,
    condition character varying(8)
);
 &   DROP TABLE public.facility_condition;
       public         postgres    false    13            �            1259    118859    facility_culinary    TABLE     d   CREATE TABLE public.facility_culinary (
    facility character(20),
    id character(1) NOT NULL
);
 %   DROP TABLE public.facility_culinary;
       public         postgres    false    13            �            1259    118862    facility_hotel    TABLE     X   CREATE TABLE public.facility_hotel (
    id integer NOT NULL,
    name character(20)
);
 "   DROP TABLE public.facility_hotel;
       public         postgres    false    13            �            1259    118865    facility_restaurant    TABLE     e   CREATE TABLE public.facility_restaurant (
    id integer NOT NULL,
    name character varying(20)
);
 '   DROP TABLE public.facility_restaurant;
       public         postgres    false    13            �            1259    118868    facility_tourism    TABLE     h   CREATE TABLE public.facility_tourism (
    name character(30) NOT NULL,
    id character(1) NOT NULL
);
 $   DROP TABLE public.facility_tourism;
       public         postgres    false    13            V           1259    121571    hotel    TABLE        CREATE TABLE public.hotel (
    id character(5) NOT NULL,
    name character(25),
    address character(50),
    cp character(12),
    geom public.geometry(MultiPolygon),
    ktp integer,
    marriage_book integer,
    mushalla integer,
    star character(2),
    id_type character(1)
);
    DROP TABLE public.hotel;
       public         postgres    false    6    6    13    13    6    13    6    13    6    13    6    13    6    13    6    13    13            �            1259    118871    hotel_gallery    TABLE     �   CREATE TABLE public.hotel_gallery (
    serial_number integer NOT NULL,
    id character(5),
    gallery_hotel character(10)
);
 !   DROP TABLE public.hotel_gallery;
       public         postgres    false    13            �            1259    118874 
   hotel_type    TABLE     b   CREATE TABLE public.hotel_type (
    name character(10) NOT NULL,
    id character(1) NOT NULL
);
    DROP TABLE public.hotel_type;
       public         postgres    false    13            �            1259    118877    industry_gallery    TABLE     �   CREATE TABLE public.industry_gallery (
    serial_number integer NOT NULL,
    id character(5) NOT NULL,
    gallery_industry character(10)
);
 $   DROP TABLE public.industry_gallery;
       public         postgres    false    13            �            1259    118880    industry_type    TABLE     \   CREATE TABLE public.industry_type (
    name character(20),
    id character(1) NOT NULL
);
 !   DROP TABLE public.industry_type;
       public         postgres    false    13            �            1259    118883    kuliner_region_gid_seq    SEQUENCE        CREATE SEQUENCE public.kuliner_region_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.kuliner_region_gid_seq;
       public       postgres    false    340    13            �           0    0    kuliner_region_gid_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.kuliner_region_gid_seq OWNED BY public.culinary_place.gid;
            public       postgres    false    245            �            1259    118885    login    TABLE     _   CREATE TABLE public.login (
    username character(20) NOT NULL,
    password character(35)
);
    DROP TABLE public.login;
       public         postgres    false    13            �            1259    118888    product_small_industry    TABLE     c   CREATE TABLE public.product_small_industry (
    id integer NOT NULL,
    product character(10)
);
 *   DROP TABLE public.product_small_industry;
       public         postgres    false    13            �            1259    118891    product_souvenir    TABLE     ]   CREATE TABLE public.product_souvenir (
    id integer NOT NULL,
    product character(10)
);
 $   DROP TABLE public.product_souvenir;
       public         postgres    false    13            W           1259    121577 
   restaurant    TABLE     �  CREATE TABLE public.restaurant (
    geom public.geometry(MultiPolygon),
    id character varying(5) NOT NULL,
    name character varying(25),
    address character varying(50),
    cp character varying(12),
    open time without time zone,
    close time without time zone,
    capacity integer,
    employee integer,
    mushalla integer,
    park_area integer,
    bathroom integer,
    id_category integer
);
    DROP TABLE public.restaurant;
       public         postgres    false    6    6    13    13    6    13    6    13    6    13    6    13    6    13    6    13    13            �            1259    118894    restaurant_category    TABLE     e   CREATE TABLE public.restaurant_category (
    id integer NOT NULL,
    name character varying(20)
);
 '   DROP TABLE public.restaurant_category;
       public         postgres    false    13            �            1259    118897    restaurant_gallery    TABLE     �   CREATE TABLE public.restaurant_gallery (
    serial_number integer NOT NULL,
    id character varying(5) NOT NULL,
    gallery_restaurant character varying(15)
);
 &   DROP TABLE public.restaurant_gallery;
       public         postgres    false    13            �            1259    118900    room    TABLE     a   CREATE TABLE public.room (
    id integer NOT NULL,
    name character(20),
    price integer
);
    DROP TABLE public.room;
       public         postgres    false    13            X           1259    121583    small_industry    TABLE       CREATE TABLE public.small_industry (
    name character(30),
    owner character(20),
    cp character(12),
    address character(50),
    employee integer,
    geom public.geometry(MultiPolygon),
    id character(5) NOT NULL,
    id_industry_type character(1)
);
 "   DROP TABLE public.small_industry;
       public         postgres    false    13    6    6    13    13    6    13    6    13    6    13    6    13    6    13    6    13            Y           1259    121589    souvenir    TABLE       CREATE TABLE public.souvenir (
    gid integer NOT NULL,
    name character(30),
    owner character(20),
    cp character(12),
    address character(50),
    employee integer,
    geom public.geometry(MultiPolygon),
    id character(5) NOT NULL,
    id_souvenir_type character(1)
);
    DROP TABLE public.souvenir;
       public         postgres    false    13    6    6    13    13    6    13    6    13    6    13    6    13    6    13    6    13            �            1259    118903    souvenir_gallery    TABLE     �   CREATE TABLE public.souvenir_gallery (
    serial_number integer NOT NULL,
    id character(5) NOT NULL,
    gallery_souvenir character(10)
);
 $   DROP TABLE public.souvenir_gallery;
       public         postgres    false    13            �            1259    118906    souvenir_type    TABLE     \   CREATE TABLE public.souvenir_type (
    name character(25),
    id character(1) NOT NULL
);
 !   DROP TABLE public.souvenir_type;
       public         postgres    false    13            �            1259    118909    special_menu    TABLE     ^   CREATE TABLE public.special_menu (
    id integer NOT NULL,
    name character varying(20)
);
     DROP TABLE public.special_menu;
       public         postgres    false    13            �            1259    118912    statistika2    TABLE     �   CREATE TABLE public.statistika2 (
    ip character varying(20) NOT NULL,
    tanggal date NOT NULL,
    hits integer NOT NULL,
    online character varying(255) NOT NULL
);
    DROP TABLE public.statistika2;
       public         postgres    false    13                        1259    118915    status    TABLE     R   CREATE TABLE public.status (
    id integer NOT NULL,
    status character(25)
);
    DROP TABLE public.status;
       public         postgres    false    13            Z           1259    121595    tourism    TABLE     �   CREATE TABLE public.tourism (
    id character(5) NOT NULL,
    name character(40),
    address character(50),
    open time without time zone,
    close time without time zone,
    geom public.geometry,
    ticket integer,
    id_type character(1)
);
    DROP TABLE public.tourism;
       public         postgres    false    6    6    13    13    6    13    6    13    6    13    6    13    6    13    6    13    13                       1259    118918    tourism_gallery    TABLE     �   CREATE TABLE public.tourism_gallery (
    serial_number integer NOT NULL,
    id character(5),
    gallery_tourism character(10)
);
 #   DROP TABLE public.tourism_gallery;
       public         postgres    false    13                       1259    118921    tourism_type    TABLE     d   CREATE TABLE public.tourism_type (
    name character(10) NOT NULL,
    id character(1) NOT NULL
);
     DROP TABLE public.tourism_type;
       public         postgres    false    13                       1259    118924 
   type_event    TABLE     \   CREATE TABLE public.type_event (
    id integer NOT NULL,
    name character varying(20)
);
    DROP TABLE public.type_event;
       public         postgres    false    13                       1259    118927    ustad    TABLE     �   CREATE TABLE public.ustad (
    id integer NOT NULL,
    name character varying(30),
    address character varying(50),
    cp character varying(12)
);
    DROP TABLE public.ustad;
       public         postgres    false    13            [           1259    121601    worship_place    TABLE     �  CREATE TABLE public.worship_place (
    geom public.geometry(MultiPolygon),
    id character varying(5) NOT NULL,
    name character varying(35),
    address character varying(80),
    land_size integer,
    park_area_size integer,
    building_size integer,
    capacity integer,
    est integer,
    last_renovation integer,
    jamaah integer,
    imam integer,
    teenager integer,
    id_category integer,
    image character varying(50)
);
 !   DROP TABLE public.worship_place;
       public         postgres    false    6    6    13    13    6    13    6    13    6    13    6    13    6    13    6    13    13                       1259    118930    worship_place_gallery    TABLE     �   CREATE TABLE public.worship_place_gallery (
    serial_number integer NOT NULL,
    id character varying(5) NOT NULL,
    gallery_worship_place character varying(50)
);
 )   DROP TABLE public.worship_place_gallery;
       public         postgres    false    13                       2604    121607    culinary_place gid    DEFAULT     x   ALTER TABLE ONLY public.culinary_place ALTER COLUMN gid SET DEFAULT nextval('public.kuliner_region_gid_seq'::regclass);
 A   ALTER TABLE public.culinary_place ALTER COLUMN gid DROP DEFAULT;
       public       postgres    false    245    340    340            5          0    118769    admin_restaurant 
   TABLE DATA               >   COPY public.admin_restaurant (username, password) FROM stdin;
    public       postgres    false    209   R      6          0    118772    administrators 
   TABLE DATA               �   COPY public.administrators (stewardship_period, id_worship_place, name, address, hp, role, username, password, last_login) FROM stdin;
    public       postgres    false    210   XR      j          0    121553    angkot 
   TABLE DATA               c   COPY public.angkot (id, destination, track, geom, id_color, cost, number, route_color) FROM stdin;
    public       postgres    false    339   4a      7          0    118775    angkot_color 
   TABLE DATA               1   COPY public.angkot_color (id, color) FROM stdin;
    public       postgres    false    211   C      8          0    118778    angkot_gallery 
   TABLE DATA               K   COPY public.angkot_gallery (serial_number, id, gallery_angkot) FROM stdin;
    public       postgres    false    212   �      9          0    118781    category_worship_place 
   TABLE DATA               :   COPY public.category_worship_place (id, name) FROM stdin;
    public       postgres    false    213         :          0    118784    culinary 
   TABLE DATA               ,   COPY public.culinary (id, name) FROM stdin;
    public       postgres    false    214   9      ;          0    118787    culinary_gallery 
   TABLE DATA               O   COPY public.culinary_gallery (serial_number, id, gallery_culinary) FROM stdin;
    public       postgres    false    215   c      k          0    121559    culinary_place 
   TABLE DATA               k   COPY public.culinary_place (gid, name, address, cp, capacity, geom, open, close, employee, id) FROM stdin;
    public       postgres    false    340   �      <          0    118790    detail_culinary 
   TABLE DATA               P   COPY public.detail_culinary (id_culinary_place, id_culinary, price) FROM stdin;
    public       postgres    false    216   4-      =          0    118793    detail_culinary_place 
   TABLE DATA               d   COPY public.detail_culinary_place (id_culinary_place, id_angkot, lat, lng, description) FROM stdin;
    public       postgres    false    217   �/      >          0    118796    detail_event 
   TABLE DATA               g   COPY public.detail_event (date, "time", id_ustad, id_event, id_worship_place, description) FROM stdin;
    public       postgres    false    218   �6      ?          0    118802    detail_facility 
   TABLE DATA               _   COPY public.detail_facility (id_facility, id_worship_place, id_facility_condition) FROM stdin;
    public       postgres    false    219   8      @          0    118805    detail_facility_culinary 
   TABLE DATA               R   COPY public.detail_facility_culinary (id_culinary_place, id_facility) FROM stdin;
    public       postgres    false    220   w<      A          0    118808    detail_facility_hotel 
   TABLE DATA               F   COPY public.detail_facility_hotel (id_hotel, id_facility) FROM stdin;
    public       postgres    false    221   ;>      B          0    118811    detail_facility_restaurant 
   TABLE DATA               P   COPY public.detail_facility_restaurant (id_facility, id_restaurant) FROM stdin;
    public       postgres    false    222   �A      C          0    118814    detail_facility_tourism 
   TABLE DATA               J   COPY public.detail_facility_tourism (id_tourism, id_facility) FROM stdin;
    public       postgres    false    223   �A      D          0    118817    detail_hotel 
   TABLE DATA               R   COPY public.detail_hotel (id_angkot, id_hotel, lat, lng, description) FROM stdin;
    public       postgres    false    224   /B      E          0    118820    detail_menu 
   TABLE DATA               L   COPY public.detail_menu (id_restaurant, id_special_menu, price) FROM stdin;
    public       postgres    false    225   �P      F          0    118823    detail_product_small_industry 
   TABLE DATA               ]   COPY public.detail_product_small_industry (id_product, id_small_industry, price) FROM stdin;
    public       postgres    false    226   �P      G          0    118826    detail_product_souvenir 
   TABLE DATA               Q   COPY public.detail_product_souvenir (id_product, id_souvenir, price) FROM stdin;
    public       postgres    false    227   �P      H          0    118829    detail_restaurant 
   TABLE DATA               \   COPY public.detail_restaurant (id_angkot, id_restaurant, lat, lng, description) FROM stdin;
    public       postgres    false    228   Q      I          0    118832    detail_room 
   TABLE DATA               8   COPY public.detail_room (id_room, id_hotel) FROM stdin;
    public       postgres    false    229   W      J          0    118835    detail_small_industry 
   TABLE DATA               d   COPY public.detail_small_industry (id_small_industry, id_angkot, lat, lng, description) FROM stdin;
    public       postgres    false    230   3Y      K          0    118838    detail_souvenir 
   TABLE DATA               X   COPY public.detail_souvenir (id_souvenir, id_angkot, lat, lng, description) FROM stdin;
    public       postgres    false    231   �_      L          0    118841    detail_tourism 
   TABLE DATA               V   COPY public.detail_tourism (id_angkot, id_tourism, lat, lng, description) FROM stdin;
    public       postgres    false    232   �e      M          0    118844    detail_worship_place 
   TABLE DATA               b   COPY public.detail_worship_place (id_angkot, id_worship_place, lat, lng, description) FROM stdin;
    public       postgres    false    233   �h      l          0    121565    district 
   TABLE DATA               2   COPY public.district (geom, id, name) FROM stdin;
    public       postgres    false    341   �k      N          0    118847    event 
   TABLE DATA               E   COPY public.event (id, name, description, id_type_event) FROM stdin;
    public       postgres    false    234   �      O          0    118853    facility 
   TABLE DATA               ,   COPY public.facility (id, name) FROM stdin;
    public       postgres    false    235   ��      P          0    118856    facility_condition 
   TABLE DATA               ;   COPY public.facility_condition (id, condition) FROM stdin;
    public       postgres    false    236   ��      Q          0    118859    facility_culinary 
   TABLE DATA               9   COPY public.facility_culinary (facility, id) FROM stdin;
    public       postgres    false    237   ��      R          0    118862    facility_hotel 
   TABLE DATA               2   COPY public.facility_hotel (id, name) FROM stdin;
    public       postgres    false    238   q�      S          0    118865    facility_restaurant 
   TABLE DATA               7   COPY public.facility_restaurant (id, name) FROM stdin;
    public       postgres    false    239   ��      T          0    118868    facility_tourism 
   TABLE DATA               4   COPY public.facility_tourism (name, id) FROM stdin;
    public       postgres    false    240   �      m          0    121571    hotel 
   TABLE DATA               i   COPY public.hotel (id, name, address, cp, geom, ktp, marriage_book, mushalla, star, id_type) FROM stdin;
    public       postgres    false    342   ��      U          0    118871    hotel_gallery 
   TABLE DATA               I   COPY public.hotel_gallery (serial_number, id, gallery_hotel) FROM stdin;
    public       postgres    false    241   ~�      V          0    118874 
   hotel_type 
   TABLE DATA               .   COPY public.hotel_type (name, id) FROM stdin;
    public       postgres    false    242   ��      W          0    118877    industry_gallery 
   TABLE DATA               O   COPY public.industry_gallery (serial_number, id, gallery_industry) FROM stdin;
    public       postgres    false    243   �      X          0    118880    industry_type 
   TABLE DATA               1   COPY public.industry_type (name, id) FROM stdin;
    public       postgres    false    244   �      Z          0    118885    login 
   TABLE DATA               3   COPY public.login (username, password) FROM stdin;
    public       postgres    false    246   p�      �          0    120862    pointcloud_formats 
   TABLE DATA               @   COPY public.pointcloud_formats (pcid, srid, schema) FROM stdin;
    public       postgres    false    281   ��      [          0    118888    product_small_industry 
   TABLE DATA               =   COPY public.product_small_industry (id, product) FROM stdin;
    public       postgres    false    247   ��      \          0    118891    product_souvenir 
   TABLE DATA               7   COPY public.product_souvenir (id, product) FROM stdin;
    public       postgres    false    248   ��      n          0    121577 
   restaurant 
   TABLE DATA               �   COPY public.restaurant (geom, id, name, address, cp, open, close, capacity, employee, mushalla, park_area, bathroom, id_category) FROM stdin;
    public       postgres    false    343   $�      ]          0    118894    restaurant_category 
   TABLE DATA               7   COPY public.restaurant_category (id, name) FROM stdin;
    public       postgres    false    249   �      ^          0    118897    restaurant_gallery 
   TABLE DATA               S   COPY public.restaurant_gallery (serial_number, id, gallery_restaurant) FROM stdin;
    public       postgres    false    250   l      _          0    118900    room 
   TABLE DATA               /   COPY public.room (id, name, price) FROM stdin;
    public       postgres    false    251   �      o          0    121583    small_industry 
   TABLE DATA               h   COPY public.small_industry (name, owner, cp, address, employee, geom, id, id_industry_type) FROM stdin;
    public       postgres    false    344   �      p          0    121589    souvenir 
   TABLE DATA               g   COPY public.souvenir (gid, name, owner, cp, address, employee, geom, id, id_souvenir_type) FROM stdin;
    public       postgres    false    345   �(      `          0    118903    souvenir_gallery 
   TABLE DATA               O   COPY public.souvenir_gallery (serial_number, id, gallery_souvenir) FROM stdin;
    public       postgres    false    252   M:      a          0    118906    souvenir_type 
   TABLE DATA               1   COPY public.souvenir_type (name, id) FROM stdin;
    public       postgres    false    253   j:      �          0    119441    spatial_ref_sys 
   TABLE DATA               X   COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
    public       postgres    false    264   �:      b          0    118909    special_menu 
   TABLE DATA               0   COPY public.special_menu (id, name) FROM stdin;
    public       postgres    false    254   �:      c          0    118912    statistika2 
   TABLE DATA               @   COPY public.statistika2 (ip, tanggal, hits, online) FROM stdin;
    public       postgres    false    255   �<      d          0    118915    status 
   TABLE DATA               ,   COPY public.status (id, status) FROM stdin;
    public       postgres    false    256   G@      q          0    121595    tourism 
   TABLE DATA               X   COPY public.tourism (id, name, address, open, close, geom, ticket, id_type) FROM stdin;
    public       postgres    false    346   �@      e          0    118918    tourism_gallery 
   TABLE DATA               M   COPY public.tourism_gallery (serial_number, id, gallery_tourism) FROM stdin;
    public       postgres    false    257   �F      f          0    118921    tourism_type 
   TABLE DATA               0   COPY public.tourism_type (name, id) FROM stdin;
    public       postgres    false    258   G      g          0    118924 
   type_event 
   TABLE DATA               .   COPY public.type_event (id, name) FROM stdin;
    public       postgres    false    259   _G      h          0    118927    ustad 
   TABLE DATA               6   COPY public.ustad (id, name, address, cp) FROM stdin;
    public       postgres    false    260   �G      r          0    121601    worship_place 
   TABLE DATA               �   COPY public.worship_place (geom, id, name, address, land_size, park_area_size, building_size, capacity, est, last_renovation, jamaah, imam, teenager, id_category, image) FROM stdin;
    public       postgres    false    347   �H      i          0    118930    worship_place_gallery 
   TABLE DATA               Y   COPY public.worship_place_gallery (serial_number, id, gallery_worship_place) FROM stdin;
    public       postgres    false    261   �l      �          0    120991    geocode_settings 
   TABLE DATA               T   COPY tiger.geocode_settings (name, setting, unit, category, short_desc) FROM stdin;
    tiger       postgres    false    284   �q      �          0    121345    pagc_gaz 
   TABLE DATA               K   COPY tiger.pagc_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
    tiger       postgres    false    328   r      �          0    121357    pagc_lex 
   TABLE DATA               K   COPY tiger.pagc_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
    tiger       postgres    false    330   /r      �          0    121369 
   pagc_rules 
   TABLE DATA               8   COPY tiger.pagc_rules (id, rule, is_custom) FROM stdin;
    tiger       postgres    false    332   Lr      �          0    121415    topology 
   TABLE DATA               G   COPY topology.topology (id, name, srid, "precision", hasz) FROM stdin;
    topology       postgres    false    334   ir      �          0    121428    layer 
   TABLE DATA               �   COPY topology.layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
    topology       postgres    false    335   �r      �           0    0    kuliner_region_gid_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.kuliner_region_gid_seq', 122, true);
            public       postgres    false    245            "           2606    118934 2   detail_facility_tourism PK Detail Facility Tourism 
   CONSTRAINT     �   ALTER TABLE ONLY public.detail_facility_tourism
    ADD CONSTRAINT "PK Detail Facility Tourism" PRIMARY KEY (id_tourism, id_facility);
 ^   ALTER TABLE ONLY public.detail_facility_tourism DROP CONSTRAINT "PK Detail Facility Tourism";
       public         postgres    false    223    223            D           2606    118936 $   facility_tourism PK Facility Tourism 
   CONSTRAINT     d   ALTER TABLE ONLY public.facility_tourism
    ADD CONSTRAINT "PK Facility Tourism" PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.facility_tourism DROP CONSTRAINT "PK Facility Tourism";
       public         postgres    false    240                       2606    118938     angkot_gallery PK Gallery Angkot 
   CONSTRAINT     o   ALTER TABLE ONLY public.angkot_gallery
    ADD CONSTRAINT "PK Gallery Angkot" PRIMARY KEY (serial_number, id);
 L   ALTER TABLE ONLY public.angkot_gallery DROP CONSTRAINT "PK Gallery Angkot";
       public         postgres    false    212    212            H           2606    118940    hotel_type PK TIPE HOTEL 
   CONSTRAINT     X   ALTER TABLE ONLY public.hotel_type
    ADD CONSTRAINT "PK TIPE HOTEL" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.hotel_type DROP CONSTRAINT "PK TIPE HOTEL";
       public         postgres    false    242            d           2606    118942    tourism_type PK Tourism Tipe 
   CONSTRAINT     \   ALTER TABLE ONLY public.tourism_type
    ADD CONSTRAINT "PK Tourism Tipe" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.tourism_type DROP CONSTRAINT "PK Tourism Tipe";
       public         postgres    false    258            $           2606    118944    detail_hotel PK ah 
   CONSTRAINT     c   ALTER TABLE ONLY public.detail_hotel
    ADD CONSTRAINT "PK ah" PRIMARY KEY (id_angkot, id_hotel);
 >   ALTER TABLE ONLY public.detail_hotel DROP CONSTRAINT "PK ah";
       public         postgres    false    224    224            4           2606    118946    detail_tourism PK atw 
   CONSTRAINT     h   ALTER TABLE ONLY public.detail_tourism
    ADD CONSTRAINT "PK atw" PRIMARY KEY (id_angkot, id_tourism);
 A   ALTER TABLE ONLY public.detail_tourism DROP CONSTRAINT "PK atw";
       public         postgres    false    232    232            b           2606    118948 "   tourism_gallery PK tourism gallery 
   CONSTRAINT     m   ALTER TABLE ONLY public.tourism_gallery
    ADD CONSTRAINT "PK tourism gallery" PRIMARY KEY (serial_number);
 N   ALTER TABLE ONLY public.tourism_gallery DROP CONSTRAINT "PK tourism gallery";
       public         postgres    false    257                       2606    118950 &   admin_restaurant admin_restaurant_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.admin_restaurant
    ADD CONSTRAINT admin_restaurant_pkey PRIMARY KEY (username);
 P   ALTER TABLE ONLY public.admin_restaurant DROP CONSTRAINT admin_restaurant_pkey;
       public         postgres    false    209            
           2606    118952    angkot_color angkot_color_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.angkot_color
    ADD CONSTRAINT angkot_color_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.angkot_color DROP CONSTRAINT angkot_color_pkey;
       public         postgres    false    211            l           2606    121624    angkot angkot_pk 
   CONSTRAINT     N   ALTER TABLE ONLY public.angkot
    ADD CONSTRAINT angkot_pk PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.angkot DROP CONSTRAINT angkot_pk;
       public         postgres    false    339                       2606    118954 0   detail_facility_hotel detail_facility_hotel_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.detail_facility_hotel
    ADD CONSTRAINT detail_facility_hotel_pkey PRIMARY KEY (id_hotel, id_facility);
 Z   ALTER TABLE ONLY public.detail_facility_hotel DROP CONSTRAINT detail_facility_hotel_pkey;
       public         postgres    false    221    221                       2606    118956 $   detail_facility detail_facility_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.detail_facility
    ADD CONSTRAINT detail_facility_pkey PRIMARY KEY (id_facility, id_worship_place);
 N   ALTER TABLE ONLY public.detail_facility DROP CONSTRAINT detail_facility_pkey;
       public         postgres    false    219    219                        2606    118958 :   detail_facility_restaurant detail_facility_restaurant_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.detail_facility_restaurant
    ADD CONSTRAINT detail_facility_restaurant_pkey PRIMARY KEY (id_facility, id_restaurant);
 d   ALTER TABLE ONLY public.detail_facility_restaurant DROP CONSTRAINT detail_facility_restaurant_pkey;
       public         postgres    false    222    222            @           2606    118960 "   facility_hotel facility_hotel_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.facility_hotel
    ADD CONSTRAINT facility_hotel_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.facility_hotel DROP CONSTRAINT facility_hotel_pkey;
       public         postgres    false    238            B           2606    118962 ,   facility_restaurant facility_restaurant_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.facility_restaurant
    ADD CONSTRAINT facility_restaurant_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.facility_restaurant DROP CONSTRAINT facility_restaurant_pkey;
       public         postgres    false    239            F           2606    118964     hotel_gallery hotel_gallery_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.hotel_gallery
    ADD CONSTRAINT hotel_gallery_pkey PRIMARY KEY (serial_number);
 J   ALTER TABLE ONLY public.hotel_gallery DROP CONSTRAINT hotel_gallery_pkey;
       public         postgres    false    241            �           2606    121626    worship_place id 
   CONSTRAINT     N   ALTER TABLE ONLY public.worship_place
    ADD CONSTRAINT id PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.worship_place DROP CONSTRAINT id;
       public         postgres    false    347                       2606    118966     administrators id_administrators 
   CONSTRAINT     �   ALTER TABLE ONLY public.administrators
    ADD CONSTRAINT id_administrators PRIMARY KEY (stewardship_period, id_worship_place);
 J   ALTER TABLE ONLY public.administrators DROP CONSTRAINT id_administrators;
       public         postgres    false    210    210                       2606    118968 "   category_worship_place id_category 
   CONSTRAINT     `   ALTER TABLE ONLY public.category_worship_place
    ADD CONSTRAINT id_category PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.category_worship_place DROP CONSTRAINT id_category;
       public         postgres    false    213                       2606    118970 $   culinary_gallery id_culinary_gallery 
   CONSTRAINT     q   ALTER TABLE ONLY public.culinary_gallery
    ADD CONSTRAINT id_culinary_gallery PRIMARY KEY (serial_number, id);
 N   ALTER TABLE ONLY public.culinary_gallery DROP CONSTRAINT id_culinary_gallery;
       public         postgres    false    215    215            n           2606    121628     culinary_place id_culinary_place 
   CONSTRAINT     ^   ALTER TABLE ONLY public.culinary_place
    ADD CONSTRAINT id_culinary_place PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.culinary_place DROP CONSTRAINT id_culinary_place;
       public         postgres    false    340                       2606    118972 "   detail_culinary id_detail_culinary 
   CONSTRAINT     |   ALTER TABLE ONLY public.detail_culinary
    ADD CONSTRAINT id_detail_culinary PRIMARY KEY (id_culinary_place, id_culinary);
 L   ALTER TABLE ONLY public.detail_culinary DROP CONSTRAINT id_detail_culinary;
       public         postgres    false    216    216                       2606    118974 .   detail_culinary_place id_detail_culinary_place 
   CONSTRAINT     �   ALTER TABLE ONLY public.detail_culinary_place
    ADD CONSTRAINT id_detail_culinary_place PRIMARY KEY (id_culinary_place, id_angkot);
 X   ALTER TABLE ONLY public.detail_culinary_place DROP CONSTRAINT id_detail_culinary_place;
       public         postgres    false    217    217                       2606    118976    detail_event id_detail_event 
   CONSTRAINT     v   ALTER TABLE ONLY public.detail_event
    ADD CONSTRAINT id_detail_event PRIMARY KEY (date, "time", id_worship_place);
 F   ALTER TABLE ONLY public.detail_event DROP CONSTRAINT id_detail_event;
       public         postgres    false    218    218    218                       2606    118978 +   detail_facility_culinary id_detail_facility 
   CONSTRAINT     �   ALTER TABLE ONLY public.detail_facility_culinary
    ADD CONSTRAINT id_detail_facility PRIMARY KEY (id_culinary_place, id_facility);
 U   ALTER TABLE ONLY public.detail_facility_culinary DROP CONSTRAINT id_detail_facility;
       public         postgres    false    220    220            &           2606    118980    detail_menu id_detail_menu 
   CONSTRAINT     t   ALTER TABLE ONLY public.detail_menu
    ADD CONSTRAINT id_detail_menu PRIMARY KEY (id_restaurant, id_special_menu);
 D   ALTER TABLE ONLY public.detail_menu DROP CONSTRAINT id_detail_menu;
       public         postgres    false    225    225            (           2606    118982 8   detail_product_small_industry id_detail_product_industry 
   CONSTRAINT     �   ALTER TABLE ONLY public.detail_product_small_industry
    ADD CONSTRAINT id_detail_product_industry PRIMARY KEY (id_product, id_small_industry);
 b   ALTER TABLE ONLY public.detail_product_small_industry DROP CONSTRAINT id_detail_product_industry;
       public         postgres    false    226    226            *           2606    118984 2   detail_product_souvenir id_detail_product_souvenir 
   CONSTRAINT     �   ALTER TABLE ONLY public.detail_product_souvenir
    ADD CONSTRAINT id_detail_product_souvenir PRIMARY KEY (id_product, id_souvenir);
 \   ALTER TABLE ONLY public.detail_product_souvenir DROP CONSTRAINT id_detail_product_souvenir;
       public         postgres    false    227    227            ,           2606    118986 &   detail_restaurant id_detail_restaurant 
   CONSTRAINT     z   ALTER TABLE ONLY public.detail_restaurant
    ADD CONSTRAINT id_detail_restaurant PRIMARY KEY (id_angkot, id_restaurant);
 P   ALTER TABLE ONLY public.detail_restaurant DROP CONSTRAINT id_detail_restaurant;
       public         postgres    false    228    228            0           2606    118988 .   detail_small_industry id_detail_small_industry 
   CONSTRAINT     �   ALTER TABLE ONLY public.detail_small_industry
    ADD CONSTRAINT id_detail_small_industry PRIMARY KEY (id_angkot, id_small_industry);
 X   ALTER TABLE ONLY public.detail_small_industry DROP CONSTRAINT id_detail_small_industry;
       public         postgres    false    230    230            2           2606    118990 "   detail_souvenir id_detail_souvenir 
   CONSTRAINT     t   ALTER TABLE ONLY public.detail_souvenir
    ADD CONSTRAINT id_detail_souvenir PRIMARY KEY (id_souvenir, id_angkot);
 L   ALTER TABLE ONLY public.detail_souvenir DROP CONSTRAINT id_detail_souvenir;
       public         postgres    false    231    231            6           2606    118992 ,   detail_worship_place id_detail_worship_place 
   CONSTRAINT     �   ALTER TABLE ONLY public.detail_worship_place
    ADD CONSTRAINT id_detail_worship_place PRIMARY KEY (id_angkot, id_worship_place);
 V   ALTER TABLE ONLY public.detail_worship_place DROP CONSTRAINT id_detail_worship_place;
       public         postgres    false    233    233            q           2606    121630    district id_district 
   CONSTRAINT     R   ALTER TABLE ONLY public.district
    ADD CONSTRAINT id_district PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.district DROP CONSTRAINT id_district;
       public         postgres    false    341            8           2606    118994    event id_event 
   CONSTRAINT     L   ALTER TABLE ONLY public.event
    ADD CONSTRAINT id_event PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.event DROP CONSTRAINT id_event;
       public         postgres    false    234            >           2606    118996    facility_culinary id_facility 
   CONSTRAINT     [   ALTER TABLE ONLY public.facility_culinary
    ADD CONSTRAINT id_facility PRIMARY KEY (id);
 G   ALTER TABLE ONLY public.facility_culinary DROP CONSTRAINT id_facility;
       public         postgres    false    237            <           2606    118998 (   facility_condition id_facility_condition 
   CONSTRAINT     f   ALTER TABLE ONLY public.facility_condition
    ADD CONSTRAINT id_facility_condition PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.facility_condition DROP CONSTRAINT id_facility_condition;
       public         postgres    false    236            :           2606    119000 "   facility id_facility_worship_place 
   CONSTRAINT     `   ALTER TABLE ONLY public.facility
    ADD CONSTRAINT id_facility_worship_place PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.facility DROP CONSTRAINT id_facility_worship_place;
       public         postgres    false    235            J           2606    119002 $   industry_gallery id_industry_gallery 
   CONSTRAINT     q   ALTER TABLE ONLY public.industry_gallery
    ADD CONSTRAINT id_industry_gallery PRIMARY KEY (serial_number, id);
 N   ALTER TABLE ONLY public.industry_gallery DROP CONSTRAINT id_industry_gallery;
       public         postgres    false    243    243            L           2606    119004    industry_type id_jenis_industry 
   CONSTRAINT     ]   ALTER TABLE ONLY public.industry_type
    ADD CONSTRAINT id_jenis_industry PRIMARY KEY (id);
 I   ALTER TABLE ONLY public.industry_type DROP CONSTRAINT id_jenis_industry;
       public         postgres    false    244            \           2606    119006    souvenir_type id_jenis_oleh 
   CONSTRAINT     Y   ALTER TABLE ONLY public.souvenir_type
    ADD CONSTRAINT id_jenis_oleh PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.souvenir_type DROP CONSTRAINT id_jenis_oleh;
       public         postgres    false    253                       2606    119008    culinary id_kuliner 
   CONSTRAINT     Q   ALTER TABLE ONLY public.culinary
    ADD CONSTRAINT id_kuliner PRIMARY KEY (id);
 =   ALTER TABLE ONLY public.culinary DROP CONSTRAINT id_kuliner;
       public         postgres    false    214            P           2606    119010 0   product_small_industry id_product_small_industry 
   CONSTRAINT     n   ALTER TABLE ONLY public.product_small_industry
    ADD CONSTRAINT id_product_small_industry PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.product_small_industry DROP CONSTRAINT id_product_small_industry;
       public         postgres    false    247            T           2606    119012 *   restaurant_category id_restaurant_category 
   CONSTRAINT     h   ALTER TABLE ONLY public.restaurant_category
    ADD CONSTRAINT id_restaurant_category PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.restaurant_category DROP CONSTRAINT id_restaurant_category;
       public         postgres    false    249            V           2606    119014 (   restaurant_gallery id_restaurant_gallery 
   CONSTRAINT     u   ALTER TABLE ONLY public.restaurant_gallery
    ADD CONSTRAINT id_restaurant_gallery PRIMARY KEY (serial_number, id);
 R   ALTER TABLE ONLY public.restaurant_gallery DROP CONSTRAINT id_restaurant_gallery;
       public         postgres    false    250    250            z           2606    121632     small_industry id_small_industry 
   CONSTRAINT     ^   ALTER TABLE ONLY public.small_industry
    ADD CONSTRAINT id_small_industry PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.small_industry DROP CONSTRAINT id_small_industry;
       public         postgres    false    344            }           2606    121634    souvenir id_souvenir 
   CONSTRAINT     R   ALTER TABLE ONLY public.souvenir
    ADD CONSTRAINT id_souvenir PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.souvenir DROP CONSTRAINT id_souvenir;
       public         postgres    false    345            Z           2606    119016 $   souvenir_gallery id_souvenir_gallery 
   CONSTRAINT     q   ALTER TABLE ONLY public.souvenir_gallery
    ADD CONSTRAINT id_souvenir_gallery PRIMARY KEY (serial_number, id);
 N   ALTER TABLE ONLY public.souvenir_gallery DROP CONSTRAINT id_souvenir_gallery;
       public         postgres    false    252    252            R           2606    119018 $   product_souvenir id_souvenir_product 
   CONSTRAINT     b   ALTER TABLE ONLY public.product_souvenir
    ADD CONSTRAINT id_souvenir_product PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.product_souvenir DROP CONSTRAINT id_souvenir_product;
       public         postgres    false    248            ^           2606    119020    special_menu id_special_menu 
   CONSTRAINT     Z   ALTER TABLE ONLY public.special_menu
    ADD CONSTRAINT id_special_menu PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.special_menu DROP CONSTRAINT id_special_menu;
       public         postgres    false    254            `           2606    119022    status id_status 
   CONSTRAINT     N   ALTER TABLE ONLY public.status
    ADD CONSTRAINT id_status PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.status DROP CONSTRAINT id_status;
       public         postgres    false    256            f           2606    119024    type_event id_type_event 
   CONSTRAINT     V   ALTER TABLE ONLY public.type_event
    ADD CONSTRAINT id_type_event PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.type_event DROP CONSTRAINT id_type_event;
       public         postgres    false    259            h           2606    119026    ustad id_ustad 
   CONSTRAINT     L   ALTER TABLE ONLY public.ustad
    ADD CONSTRAINT id_ustad PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.ustad DROP CONSTRAINT id_ustad;
       public         postgres    false    260            j           2606    119028 .   worship_place_gallery id_worship_place_gallery 
   CONSTRAINT     {   ALTER TABLE ONLY public.worship_place_gallery
    ADD CONSTRAINT id_worship_place_gallery PRIMARY KEY (serial_number, id);
 X   ALTER TABLE ONLY public.worship_place_gallery DROP CONSTRAINT id_worship_place_gallery;
       public         postgres    false    261    261            X           2606    119030    room pk 
   CONSTRAINT     E   ALTER TABLE ONLY public.room
    ADD CONSTRAINT pk PRIMARY KEY (id);
 1   ALTER TABLE ONLY public.room DROP CONSTRAINT pk;
       public         postgres    false    251            .           2606    119032    detail_room pk detail room 
   CONSTRAINT     i   ALTER TABLE ONLY public.detail_room
    ADD CONSTRAINT "pk detail room" PRIMARY KEY (id_room, id_hotel);
 F   ALTER TABLE ONLY public.detail_room DROP CONSTRAINT "pk detail room";
       public         postgres    false    229    229            u           2606    121636    hotel pk hotel 
   CONSTRAINT     N   ALTER TABLE ONLY public.hotel
    ADD CONSTRAINT "pk hotel" PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.hotel DROP CONSTRAINT "pk hotel";
       public         postgres    false    342                       2606    121638    tourism pk tourism 
   CONSTRAINT     R   ALTER TABLE ONLY public.tourism
    ADD CONSTRAINT "pk tourism" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.tourism DROP CONSTRAINT "pk tourism";
       public         postgres    false    346            x           2606    121640    restaurant pk_restaurant 
   CONSTRAINT     V   ALTER TABLE ONLY public.restaurant
    ADD CONSTRAINT pk_restaurant PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.restaurant DROP CONSTRAINT pk_restaurant;
       public         postgres    false    343            N           2606    119034    login username 
   CONSTRAINT     R   ALTER TABLE ONLY public.login
    ADD CONSTRAINT username PRIMARY KEY (username);
 8   ALTER TABLE ONLY public.login DROP CONSTRAINT username;
       public         postgres    false    246            v           1259    121641    agen1_region_region_geom_gist    INDEX     S   CREATE INDEX agen1_region_region_geom_gist ON public.restaurant USING gist (geom);
 1   DROP INDEX public.agen1_region_region_geom_gist;
       public         postgres    false    343    6    6    6    13    6    13    13    6    6    13    13    6    13    6    13    6    13    6    13    6    13    6    13    6    13    13            s           1259    121642    hotel_region_geom_idx    INDEX     F   CREATE INDEX hotel_region_geom_idx ON public.hotel USING gist (geom);
 )   DROP INDEX public.hotel_region_geom_idx;
       public         postgres    false    6    6    6    13    6    13    13    6    6    13    13    6    13    6    13    6    13    6    13    6    13    6    13    6    13    13    342            {           1259    121643    industri_kecil_region_geom_idx    INDEX     X   CREATE INDEX industri_kecil_region_geom_idx ON public.small_industry USING gist (geom);
 2   DROP INDEX public.industri_kecil_region_geom_idx;
       public         postgres    false    344    6    6    6    13    6    13    13    6    6    13    13    6    13    6    13    6    13    6    13    6    13    6    13    6    13    13            r           1259    121644    kecamatan_region_geom_gist    INDEX     N   CREATE INDEX kecamatan_region_geom_gist ON public.district USING gist (geom);
 .   DROP INDEX public.kecamatan_region_geom_gist;
       public         postgres    false    6    6    6    13    6    13    13    6    6    13    13    6    13    6    13    6    13    6    13    6    13    6    13    6    13    13    341            o           1259    121645    kuliner_region_geom_idx    INDEX     Q   CREATE INDEX kuliner_region_geom_idx ON public.culinary_place USING gist (geom);
 +   DROP INDEX public.kuliner_region_geom_idx;
       public         postgres    false    340    6    6    6    13    6    13    13    6    6    13    13    6    13    6    13    6    13    6    13    6    13    6    13    6    13    13            �           1259    121646    mesjid_region_geom_idx    INDEX     O   CREATE INDEX mesjid_region_geom_idx ON public.worship_place USING gist (geom);
 *   DROP INDEX public.mesjid_region_geom_idx;
       public         postgres    false    6    6    6    13    6    13    13    6    6    13    13    6    13    6    13    6    13    6    13    6    13    6    13    6    13    13    347            �           2606    121647    tourism FK Tipe Tourism    FK CONSTRAINT        ALTER TABLE ONLY public.tourism
    ADD CONSTRAINT "FK Tipe Tourism" FOREIGN KEY (id_type) REFERENCES public.tourism_type(id);
 C   ALTER TABLE ONLY public.tourism DROP CONSTRAINT "FK Tipe Tourism";
       public       postgres    false    346    258    5220            �           2606    121652    detail_hotel FK angkot    FK CONSTRAINT     z   ALTER TABLE ONLY public.detail_hotel
    ADD CONSTRAINT "FK angkot" FOREIGN KEY (id_angkot) REFERENCES public.angkot(id);
 B   ALTER TABLE ONLY public.detail_hotel DROP CONSTRAINT "FK angkot";
       public       postgres    false    339    224    5228            �           2606    121657    detail_tourism FK angkot    FK CONSTRAINT     |   ALTER TABLE ONLY public.detail_tourism
    ADD CONSTRAINT "FK angkot" FOREIGN KEY (id_angkot) REFERENCES public.angkot(id);
 D   ALTER TABLE ONLY public.detail_tourism DROP CONSTRAINT "FK angkot";
       public       postgres    false    5228    339    232            �           2606    119035 #   detail_facility_tourism FK facility    FK CONSTRAINT     �   ALTER TABLE ONLY public.detail_facility_tourism
    ADD CONSTRAINT "FK facility" FOREIGN KEY (id_facility) REFERENCES public.facility_tourism(id);
 O   ALTER TABLE ONLY public.detail_facility_tourism DROP CONSTRAINT "FK facility";
       public       postgres    false    223    5188    240            �           2606    121662    detail_hotel FK hotel    FK CONSTRAINT     w   ALTER TABLE ONLY public.detail_hotel
    ADD CONSTRAINT "FK hotel" FOREIGN KEY (id_hotel) REFERENCES public.hotel(id);
 A   ALTER TABLE ONLY public.detail_hotel DROP CONSTRAINT "FK hotel";
       public       postgres    false    224    5237    342            �           2606    121667    angkot_gallery FK id Gallery    FK CONSTRAINT     y   ALTER TABLE ONLY public.angkot_gallery
    ADD CONSTRAINT "FK id Gallery" FOREIGN KEY (id) REFERENCES public.angkot(id);
 H   ALTER TABLE ONLY public.angkot_gallery DROP CONSTRAINT "FK id Gallery";
       public       postgres    false    5228    339    212            �           2606    121672    tourism_gallery FK id tourism    FK CONSTRAINT     {   ALTER TABLE ONLY public.tourism_gallery
    ADD CONSTRAINT "FK id tourism" FOREIGN KEY (id) REFERENCES public.tourism(id);
 I   ALTER TABLE ONLY public.tourism_gallery DROP CONSTRAINT "FK id tourism";
       public       postgres    false    257    5247    346            �           2606    121677 %   detail_facility_tourism FK id tourism    FK CONSTRAINT     �   ALTER TABLE ONLY public.detail_facility_tourism
    ADD CONSTRAINT "FK id tourism" FOREIGN KEY (id_tourism) REFERENCES public.tourism(id);
 Q   ALTER TABLE ONLY public.detail_facility_tourism DROP CONSTRAINT "FK id tourism";
       public       postgres    false    5247    346    223            �           2606    121682    detail_tourism FK tw    FK CONSTRAINT     z   ALTER TABLE ONLY public.detail_tourism
    ADD CONSTRAINT "FK tw" FOREIGN KEY (id_tourism) REFERENCES public.tourism(id);
 @   ALTER TABLE ONLY public.detail_tourism DROP CONSTRAINT "FK tw";
       public       postgres    false    5247    346    232            �           2606    121687    hotel FK type hotel    FK CONSTRAINT     y   ALTER TABLE ONLY public.hotel
    ADD CONSTRAINT "FK type hotel" FOREIGN KEY (id_type) REFERENCES public.hotel_type(id);
 ?   ALTER TABLE ONLY public.hotel DROP CONSTRAINT "FK type hotel";
       public       postgres    false    5192    242    342            �           2606    121692    angkot angkot_color    FK CONSTRAINT     z   ALTER TABLE ONLY public.angkot
    ADD CONSTRAINT angkot_color FOREIGN KEY (id_color) REFERENCES public.angkot_color(id);
 =   ALTER TABLE ONLY public.angkot DROP CONSTRAINT angkot_color;
       public       postgres    false    5130    211    339            �           2606    119040 F   detail_facility_restaurant detail_facility_restaurant_id_facility_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detail_facility_restaurant
    ADD CONSTRAINT detail_facility_restaurant_id_facility_fkey FOREIGN KEY (id_facility) REFERENCES public.facility_restaurant(id);
 p   ALTER TABLE ONLY public.detail_facility_restaurant DROP CONSTRAINT detail_facility_restaurant_id_facility_fkey;
       public       postgres    false    5186    222    239            �           2606    121697    detail_room fk id_hotel    FK CONSTRAINT     y   ALTER TABLE ONLY public.detail_room
    ADD CONSTRAINT "fk id_hotel" FOREIGN KEY (id_hotel) REFERENCES public.hotel(id);
 C   ALTER TABLE ONLY public.detail_room DROP CONSTRAINT "fk id_hotel";
       public       postgres    false    5237    342    229            �           2606    119045    detail_room fk id_room    FK CONSTRAINT     v   ALTER TABLE ONLY public.detail_room
    ADD CONSTRAINT "fk id_room" FOREIGN KEY (id_room) REFERENCES public.room(id);
 B   ALTER TABLE ONLY public.detail_room DROP CONSTRAINT "fk id_room";
       public       postgres    false    5208    251    229            �           2606    119050    detail_facility fk_facility    FK CONSTRAINT     �   ALTER TABLE ONLY public.detail_facility
    ADD CONSTRAINT fk_facility FOREIGN KEY (id_facility) REFERENCES public.facility(id);
 E   ALTER TABLE ONLY public.detail_facility DROP CONSTRAINT fk_facility;
       public       postgres    false    5178    219    235            �           2606    121702 !   detail_restaurant fk_restaurantye    FK CONSTRAINT     �   ALTER TABLE ONLY public.detail_restaurant
    ADD CONSTRAINT fk_restaurantye FOREIGN KEY (id_restaurant) REFERENCES public.restaurant(id);
 K   ALTER TABLE ONLY public.detail_restaurant DROP CONSTRAINT fk_restaurantye;
       public       postgres    false    228    343    5240            �           2606    121707    administrators id    FK CONSTRAINT     �   ALTER TABLE ONLY public.administrators
    ADD CONSTRAINT id FOREIGN KEY (id_worship_place) REFERENCES public.worship_place(id);
 ;   ALTER TABLE ONLY public.administrators DROP CONSTRAINT id;
       public       postgres    false    5249    347    210            �           2606    121712    worship_place_gallery id    FK CONSTRAINT     z   ALTER TABLE ONLY public.worship_place_gallery
    ADD CONSTRAINT id FOREIGN KEY (id) REFERENCES public.worship_place(id);
 B   ALTER TABLE ONLY public.worship_place_gallery DROP CONSTRAINT id;
       public       postgres    false    5249    261    347            �           2606    121717    detail_worship_place id_angkot    FK CONSTRAINT     �   ALTER TABLE ONLY public.detail_worship_place
    ADD CONSTRAINT id_angkot FOREIGN KEY (id_angkot) REFERENCES public.angkot(id);
 H   ALTER TABLE ONLY public.detail_worship_place DROP CONSTRAINT id_angkot;
       public       postgres    false    233    339    5228            �           2606    121722    detail_restaurant id_angkot    FK CONSTRAINT     }   ALTER TABLE ONLY public.detail_restaurant
    ADD CONSTRAINT id_angkot FOREIGN KEY (id_angkot) REFERENCES public.angkot(id);
 E   ALTER TABLE ONLY public.detail_restaurant DROP CONSTRAINT id_angkot;
       public       postgres    false    5228    228    339            �           2606    121727    detail_culinary_place id_angkot    FK CONSTRAINT     �   ALTER TABLE ONLY public.detail_culinary_place
    ADD CONSTRAINT id_angkot FOREIGN KEY (id_angkot) REFERENCES public.angkot(id);
 I   ALTER TABLE ONLY public.detail_culinary_place DROP CONSTRAINT id_angkot;
       public       postgres    false    339    5228    217            �           2606    121732    detail_small_industry id_angkot    FK CONSTRAINT     �   ALTER TABLE ONLY public.detail_small_industry
    ADD CONSTRAINT id_angkot FOREIGN KEY (id_angkot) REFERENCES public.angkot(id);
 I   ALTER TABLE ONLY public.detail_small_industry DROP CONSTRAINT id_angkot;
       public       postgres    false    5228    230    339            �           2606    121737    detail_souvenir id_angkot    FK CONSTRAINT     {   ALTER TABLE ONLY public.detail_souvenir
    ADD CONSTRAINT id_angkot FOREIGN KEY (id_angkot) REFERENCES public.angkot(id);
 C   ALTER TABLE ONLY public.detail_souvenir DROP CONSTRAINT id_angkot;
       public       postgres    false    5228    339    231            �           2606    121742    worship_place id_category    FK CONSTRAINT     �   ALTER TABLE ONLY public.worship_place
    ADD CONSTRAINT id_category FOREIGN KEY (id_category) REFERENCES public.category_worship_place(id);
 C   ALTER TABLE ONLY public.worship_place DROP CONSTRAINT id_category;
       public       postgres    false    213    347    5134            �           2606    119055    detail_culinary id_culinary    FK CONSTRAINT     �   ALTER TABLE ONLY public.detail_culinary
    ADD CONSTRAINT id_culinary FOREIGN KEY (id_culinary) REFERENCES public.culinary(id);
 E   ALTER TABLE ONLY public.detail_culinary DROP CONSTRAINT id_culinary;
       public       postgres    false    216    5136    214            �           2606    119060    detail_event id_event    FK CONSTRAINT     u   ALTER TABLE ONLY public.detail_event
    ADD CONSTRAINT id_event FOREIGN KEY (id_event) REFERENCES public.event(id);
 ?   ALTER TABLE ONLY public.detail_event DROP CONSTRAINT id_event;
       public       postgres    false    5176    234    218            �           2606    119065 !   detail_facility_hotel id_facility    FK CONSTRAINT     �   ALTER TABLE ONLY public.detail_facility_hotel
    ADD CONSTRAINT id_facility FOREIGN KEY (id_facility) REFERENCES public.facility_hotel(id);
 K   ALTER TABLE ONLY public.detail_facility_hotel DROP CONSTRAINT id_facility;
       public       postgres    false    221    5184    238            �           2606    119070 $   detail_facility_culinary id_facility    FK CONSTRAINT     �   ALTER TABLE ONLY public.detail_facility_culinary
    ADD CONSTRAINT id_facility FOREIGN KEY (id_facility) REFERENCES public.facility_culinary(id);
 N   ALTER TABLE ONLY public.detail_facility_culinary DROP CONSTRAINT id_facility;
       public       postgres    false    220    237    5182            �           2606    119075 %   detail_facility id_facility_condition    FK CONSTRAINT     �   ALTER TABLE ONLY public.detail_facility
    ADD CONSTRAINT id_facility_condition FOREIGN KEY (id_facility_condition) REFERENCES public.facility_condition(id);
 O   ALTER TABLE ONLY public.detail_facility DROP CONSTRAINT id_facility_condition;
       public       postgres    false    5180    219    236            �           2606    121747    detail_facility_hotel id_hotel    FK CONSTRAINT     ~   ALTER TABLE ONLY public.detail_facility_hotel
    ADD CONSTRAINT id_hotel FOREIGN KEY (id_hotel) REFERENCES public.hotel(id);
 H   ALTER TABLE ONLY public.detail_facility_hotel DROP CONSTRAINT id_hotel;
       public       postgres    false    5237    342    221            �           2606    121752    small_industry id_industry_type    FK CONSTRAINT     �   ALTER TABLE ONLY public.small_industry
    ADD CONSTRAINT id_industry_type FOREIGN KEY (id_industry_type) REFERENCES public.industry_type(id);
 I   ALTER TABLE ONLY public.small_industry DROP CONSTRAINT id_industry_type;
       public       postgres    false    344    5196    244            �           2606    119080 (   detail_product_small_industry id_product    FK CONSTRAINT     �   ALTER TABLE ONLY public.detail_product_small_industry
    ADD CONSTRAINT id_product FOREIGN KEY (id_product) REFERENCES public.product_small_industry(id);
 R   ALTER TABLE ONLY public.detail_product_small_industry DROP CONSTRAINT id_product;
       public       postgres    false    5200    247    226            �           2606    119085 "   detail_product_souvenir id_product    FK CONSTRAINT     �   ALTER TABLE ONLY public.detail_product_souvenir
    ADD CONSTRAINT id_product FOREIGN KEY (id_product) REFERENCES public.product_souvenir(id);
 L   ALTER TABLE ONLY public.detail_product_souvenir DROP CONSTRAINT id_product;
       public       postgres    false    248    5202    227            �           2606    121757    detail_menu id_restaurant_    FK CONSTRAINT     �   ALTER TABLE ONLY public.detail_menu
    ADD CONSTRAINT id_restaurant_ FOREIGN KEY (id_restaurant) REFERENCES public.restaurant(id);
 D   ALTER TABLE ONLY public.detail_menu DROP CONSTRAINT id_restaurant_;
       public       postgres    false    225    5240    343            �           2606    121762 )   detail_facility_restaurant id_restaurant_    FK CONSTRAINT     �   ALTER TABLE ONLY public.detail_facility_restaurant
    ADD CONSTRAINT id_restaurant_ FOREIGN KEY (id_restaurant) REFERENCES public.restaurant(id);
 S   ALTER TABLE ONLY public.detail_facility_restaurant DROP CONSTRAINT id_restaurant_;
       public       postgres    false    343    5240    222            �           2606    121767 !   restaurant_gallery id_restaurant_    FK CONSTRAINT     �   ALTER TABLE ONLY public.restaurant_gallery
    ADD CONSTRAINT id_restaurant_ FOREIGN KEY (id) REFERENCES public.restaurant(id);
 K   ALTER TABLE ONLY public.restaurant_gallery DROP CONSTRAINT id_restaurant_;
       public       postgres    false    343    5240    250            �           2606    121772 "   industry_gallery id_small_industry    FK CONSTRAINT     �   ALTER TABLE ONLY public.industry_gallery
    ADD CONSTRAINT id_small_industry FOREIGN KEY (id) REFERENCES public.small_industry(id);
 L   ALTER TABLE ONLY public.industry_gallery DROP CONSTRAINT id_small_industry;
       public       postgres    false    243    344    5242            �           2606    121777 /   detail_product_small_industry id_small_industry    FK CONSTRAINT     �   ALTER TABLE ONLY public.detail_product_small_industry
    ADD CONSTRAINT id_small_industry FOREIGN KEY (id_small_industry) REFERENCES public.small_industry(id);
 Y   ALTER TABLE ONLY public.detail_product_small_industry DROP CONSTRAINT id_small_industry;
       public       postgres    false    5242    226    344            �           2606    121782 '   detail_small_industry id_small_industry    FK CONSTRAINT     �   ALTER TABLE ONLY public.detail_small_industry
    ADD CONSTRAINT id_small_industry FOREIGN KEY (id_small_industry) REFERENCES public.small_industry(id);
 Q   ALTER TABLE ONLY public.detail_small_industry DROP CONSTRAINT id_small_industry;
       public       postgres    false    5242    344    230            �           2606    121787    souvenir_gallery id_souvenir    FK CONSTRAINT     y   ALTER TABLE ONLY public.souvenir_gallery
    ADD CONSTRAINT id_souvenir FOREIGN KEY (id) REFERENCES public.souvenir(id);
 F   ALTER TABLE ONLY public.souvenir_gallery DROP CONSTRAINT id_souvenir;
       public       postgres    false    345    5245    252            �           2606    121792 #   detail_product_souvenir id_souvenir    FK CONSTRAINT     �   ALTER TABLE ONLY public.detail_product_souvenir
    ADD CONSTRAINT id_souvenir FOREIGN KEY (id_souvenir) REFERENCES public.souvenir(id);
 M   ALTER TABLE ONLY public.detail_product_souvenir DROP CONSTRAINT id_souvenir;
       public       postgres    false    5245    345    227            �           2606    121797    detail_souvenir id_souvenir    FK CONSTRAINT     �   ALTER TABLE ONLY public.detail_souvenir
    ADD CONSTRAINT id_souvenir FOREIGN KEY (id_souvenir) REFERENCES public.souvenir(id);
 E   ALTER TABLE ONLY public.detail_souvenir DROP CONSTRAINT id_souvenir;
       public       postgres    false    5245    345    231            �           2606    121802    souvenir id_souvenir_type    FK CONSTRAINT     �   ALTER TABLE ONLY public.souvenir
    ADD CONSTRAINT id_souvenir_type FOREIGN KEY (id_souvenir_type) REFERENCES public.souvenir_type(id);
 C   ALTER TABLE ONLY public.souvenir DROP CONSTRAINT id_souvenir_type;
       public       postgres    false    253    345    5212            �           2606    119090    detail_menu id_special_menu_    FK CONSTRAINT     �   ALTER TABLE ONLY public.detail_menu
    ADD CONSTRAINT id_special_menu_ FOREIGN KEY (id_special_menu) REFERENCES public.special_menu(id);
 F   ALTER TABLE ONLY public.detail_menu DROP CONSTRAINT id_special_menu_;
       public       postgres    false    5214    254    225            �           2606    119095    event id_type_event    FK CONSTRAINT     }   ALTER TABLE ONLY public.event
    ADD CONSTRAINT id_type_event FOREIGN KEY (id_type_event) REFERENCES public.type_event(id);
 =   ALTER TABLE ONLY public.event DROP CONSTRAINT id_type_event;
       public       postgres    false    259    5222    234            �           2606    119100    detail_event id_ustad    FK CONSTRAINT     u   ALTER TABLE ONLY public.detail_event
    ADD CONSTRAINT id_ustad FOREIGN KEY (id_ustad) REFERENCES public.ustad(id);
 ?   ALTER TABLE ONLY public.detail_event DROP CONSTRAINT id_ustad;
       public       postgres    false    260    218    5224            �           2606    121807    detail_event id_worship    FK CONSTRAINT     �   ALTER TABLE ONLY public.detail_event
    ADD CONSTRAINT id_worship FOREIGN KEY (id_worship_place) REFERENCES public.worship_place(id);
 A   ALTER TABLE ONLY public.detail_event DROP CONSTRAINT id_worship;
       public       postgres    false    218    347    5249            �           2606    121812     detail_facility id_worship_place    FK CONSTRAINT     �   ALTER TABLE ONLY public.detail_facility
    ADD CONSTRAINT id_worship_place FOREIGN KEY (id_worship_place) REFERENCES public.worship_place(id);
 J   ALTER TABLE ONLY public.detail_facility DROP CONSTRAINT id_worship_place;
       public       postgres    false    5249    219    347            �           2606    121817 %   detail_worship_place id_worship_place    FK CONSTRAINT     �   ALTER TABLE ONLY public.detail_worship_place
    ADD CONSTRAINT id_worship_place FOREIGN KEY (id_worship_place) REFERENCES public.worship_place(id);
 O   ALTER TABLE ONLY public.detail_worship_place DROP CONSTRAINT id_worship_place;
       public       postgres    false    347    233    5249            5   4   xKL����L66�0I1H�4130KI5LK1JL347JLJ44MJ3����� !g�      6   �  x}Y�r��}���z_�mۑdK��rɕ���Mq�_�ӍI�JH>PBsn���s������3&L���e<�o;:v�����_�tۿ~�����9-,WJK���:j��D&i悖*'�R�,:�/LE��j����f��F��q/��G��`�_���N��鲣�x�ǯy�oO���o�aCik��َs"���2�(D��L�f�Y��f6�B�¼�)�o�De�^O���~<�ގW����3��'�7�B1<�9\��_R�
��hX������������p�)�Ǵ;w��~�C��ti��TZica���d�
aΔDB�);�D0���h�F�o8C�o�bͲ�Y75�Jv�f�=�\����c}n��^�q�G%X�dѤe�B�f9��랱�t�k�ab���	UV]�<�M�i���K��8}�LYex�K�9�M�Y�B�<���Iփ�|i�H��]��4�4��w��E�k���y��sa,(5� �w]0^ْd�St�q�5"1!y���"Wr�� qKߵ��PCC���o=B��_�-7��xL�uη���t�]3J�,e�>�I�(�(��"5�7�pٽ=��	���.��_$�-������.��s0�;E%=%�Sp)G.iYzf#���"�v���a��ߦˉ���c��h�9}A�?f��!n��wL�x�MϸV�E���R:c�"(}�Q`�9_��g�<�����Q����K��t�_������%E�Ax<�Y.:�P!�t�h�R�����qD`��`�qV.o�T�f���R�GO�o>���̄�}�+�w�2��k$�d�+�?�t<[��O�hz�5�����}w��tw�+� {%���&�'���)k�՞�B$�Ԛ��M4
����b��0�n���r���w�&:�'�_��_��=Z�	������b�D��,�����fY%/�����ar0��u�Qӟϧ��g���:a���;ْ%�.�4P/������Y�u�RW�xh���; �N��*�q*�q�j�H2P�9#^�!4Q"&UE��fu�/�Y�WV��ކ�*�T���MǮ0�ɪ��6VGƉ�d�g	�}��z�F��I�������w��x�_o�O��7�ve��u�n���Nw�Y�+&g����D6;Ţz��\�r����b�p��{����k�ձZ#>�6��x+E´#�dC���0k6
���j��+�Ey��y¼��
�3S	��p�L�(��J��]v�5,)x�.�f���+Vx�y��
]����n銤Yh+x����b6��,)b��R��H�x�%>y�Ze����YP�U�m���C��<�n·sel�~��x�5�x�y�-�#�P��^Q�ϽEr���(���M]��M�L��Z]0Ln��EKK�"Т�Nw�̇����1�^y��Y�X���(5p��oU�����a��h����|����yG��:�ϐ�� �\D�0E�^��z���I0�\<�}�`.5ӫ�!������q�X9���kZ[�]�xn��f�%��(h,F�R.[��,�[	��A�8��,�5�o+S���Պ�4���t&��R��y��������()F:�����.��ĘC���� ���u�V� X/�Pc�VC�Q��oG@$yt��	����@h@�fރ-G����f�,����R��FX������2h�:���p���E�KW0\�$�)�N�6�������?Oi7"���/�Ǝ�}�K_ǹ���uӁy,x�SR&�Ͻ͒��pPG�	�;
@�c��أV�W�F�A�ތ��~y�}�܁B��ד� c���U���8�.�l�,��Wn$J�0^��r>��-ڮBk{��縃qĝ� �̂�lTLA�u�5r��9S�`veJ7������u-�?��^�+a��u~�
����"|&�Q�~  �8߀-�I����}{�c[O/����bK�� ����q1�ϰ�{p�A�@N���M(Z�,��5[�4���������ܐ���}l';�Zr���"q�NmC�=s���n�,��V��}_� t�t��b?�hE�ky��"�� � ��Z����̂C=��W�p\q�Z��͂�m�p�/*�5L�,��tVW�|`��)i���X���6�؊8�^��Lv��R����N��d��n!�8�p=Q�Ì�&xR�JS�E93�3�bt#�Bl���lr	d�w?��0��?�L���Z_�^ۀR;�e�P��0)3
�&Ud�
ѳ��b�`YH�]c�d�ϴ�]MB��޻�b@P�F�N�@���K��V`PĀ��6����ΰ����v�b��Ni��!�<�2��9d��|��A��J��c�j� 9 �u���Os\��o��[%��K���x�+�?vSA֛�����F���R�u����P�Q���K�s�1�r)����q��o�mH��@���A�XŽ��*��"��OX�5��랉��y �m@N����=���e�}���W,�����alB��o�*zU����k���u��A���2k��!{P�F��7,G`�Zz��:���0�O&����<��,W����r�h#FvBpl�`�`� 5ʼ���-�u��u�J_~:^�~{�b+�F���C��,� �c�EJpilkN`7u_�V3V�r�*�����׶����6�f�p�����L*��cu��3���.e�\�׵_1&şd��_ӡ��q�+|G�䁼��C=�1��z��3�=V&@�Ӧ�vV������|�e�)��v�k��}�]m�aU\g^'�Aw�P>84mJ>c_)BfJH���YPt0�W�Q�@���H��B>о����1Y��I�c��ad�,�~!=���U��B. 	�c��zO�Z���T�y�̠�oϠ�o���Wcpu��و%'�Qb�E�8�O����������oWI���
�M������6�'��M��8W�?� �F�At4"��PMx����*��������?c����TY�]}�������T�y ��A���o�h����u��/s���o�����b�4��ٽ੎Q[7�!�V�L<���Ò�T�M��#�J��X�)W�2�.�N��������R�6��4�����A����������6h�ؠ^�y�ڢ���;|ә�-)uCB��f#\M{��(lϓ�.��,8Dn����*�FA�7L�E�^���t����<LH�w��P�M��N��$�����M� Y��b�T�J�*�_9�۷�D�����d����9�>��������F�}zЗ���� o |�۠�h��G|jZ!jT�AH���Q=�E2�w�:�5^�a��Y4�|�A�إ����\��Z��y}2ܔ�����b�w+`B9����q��3&����������VIc��*R�ȗd�`8	�4�G��+4-���Ꝁt]�@� ��_	\j�~C
W�l������9�Y�a�&D$I����f�[H�ZI�Z���(\{+:����+hM#��|W�m�G�+*�$$� �:�FUl�2__�2��Pց\9��_�=ރy�/b��h7�� ��W��=�K*e�.�m,�'��(Uc<��U���x�Z5O�g�n�;zr��aݞ��������T�o��AA��Q��t�=Ǔ��6H�Ofk^�kx����ϼ      j      x���ҬGn����Ȯy�Y��r�DH7�[fH��&t���ϳ �U߮�`�
67vf�XX@�W����O��ˏ����������������������_^����o?�÷_���?��w�����V��~���_����:�߇��ڝ�����?�V���v<�����t�^��c��ۡ����tޜ��������_χ�����q}��.��a/��9o���y����p��F������~{��|{�oO��}s<l#?lv���^��᰻�������|�v��"_o�GgsYj|���z9<�K��<?����v]Wi��m���������6�ñ~s�=�����2?+�>���uI��񶾭�ۮ����d<~����l^Ϸ���i��y�?����|�D~>�N���q}�|��������<�"_�J_��[~�?.���q:�����im�f�,���\�V�S��a���w�������9�v���L���{�v�q�7�����۩��r����������Y=o���T�w٭�'3|���>�����8�E�6��u�/�Oǝ�zV�s��}��>���{</���y8�η��r���]ƿ�o�����^j~.���z]���n��<��a�^k~W����l�Z�����n-��Z��ֻ��r���3?w#_�w�ͭ�g�?>'�b��;<�G{��g|����]_��Y?���v���Q������4��67����?���,��v������x\�ܻu8��g�������g�����f}خ�n�x�7���z�li���\<������r��w��:���q_�ouX�j?v������ȭ��l��O-��}����)��v���N�������n�a·{�;�w۞�G�V�q<���-���xX��~�~wޝ.�n�=���\Z~�-����yk�qu�O׵a���������3�;�汝����p�O�?������ݴ?>֏��rn���q�5���|mq�>v������v�8m����+������a����4Ƕ�����;9���~��z����n��﷛���t~�w'�����ݬ��������z��{�ז���y��ϳK`w���_����~�<���/+C�lv�g����}�H���uz�p�ǡ��8�z��BC��E�0ܷG��pB�7����>��mp7��������H6-?^���i}��E���Vo�-^�O����}u�������m�����q~>Χ{���|�\��h�7���l��5~�r�	���/��ʹ�].�Z��~c/ߎ�e�?-��v<�[~<����y�߷=n����Z�f���|^=�b���x�n�j{��q>7������}�y}>n}P�S�����?�T���<\���=q<W����/����Ǫ�v?�)������W�c����\�W�v��k��������?���r���+?�B����ga���̰�u��������Je��rsw�<6R�/G�j�6�Ǯ��y�l/���9����lWW>KA����;���U��Y]�;����}ߟ���1���w�n��Z?������u?l�N�nu8�׵W7w��r����d����������}���O��n��~�~N�3#e�\���z�&)���f>�^���X���|q���u_��$/��x?�j�{��Y�3�xex=LP�>Eu�u���gZo���hʍ�avW���(�����/��ޝ��e����rd!f��O[��>�����6�˥�͑�<��Yߝ�E���5?���qs�g~�e���Kݯ��i�t{��A3ݏ��ww�>N����ݞ-x�1P�>�*w����4�s~�6׫+�\�ہ�D�N����?m�u�L��{K��Mb�w>�����%��,f�:�f�^.�3-p���Qn��i��r��,˷j��t��o6�2���i3�P�����t�Ǿ:��k���̆��g}C����lAj��j��;�76�ٸ������/��y��{=.��(�\K��}��Xk��}�z�3��wz���y��|ݞ7�~�-����#��η������|������D�����]1���rӛ�~��}ta��0��y�3H� ��̏�B�SQ����Ӎ�h���z>�:uKl���}��pqrm��ۧ[[q����yCG2�j}����ƿ�����S����4�>9��<�����ļ���l���_,�'��²K�'W��>��i2�}2�����6t���=ol������n�oa�Z�?EI��w����)l�������W�ͱ�����;�c�?���~|�j�X�
�f�7��D���e��֫�澿/�i�b��3���?�OX��Y���r|���ӿ��Ͽ��w�8���?~�����?~������W��~����럿���y\�Ýi�4��(c�Po�]�ȝ!�[��v��ƕ��b�kl�^n����{p�\	��o#<�i�ۜw�:,��jux���F���^}�w���U�X�Fz�l�Z�ǖ��gFύ�|�J�CVai\����~����{Nw�[��+W8]c��$w{m<9C�#.,/y[��;y���[��0�+��wu���<Q<���t�=gGo.[��f����X���E��Y��)�ڝ��I���Kߗ����z?����>� ���`��㧻V7��8w�[f4��}�a��y?m/��������t���(�]~�qk38y�̌�o��g.�c�����Y�w��{�EA�xWL����2u�Y�{�W���nc��|s�p_�(���w�=Vs�?�<ǋ_?Q��
�pzΉ�۝9t�����.���ƪ�����r���-�r:,�-go�k�����1\��,���n��3D��r�ڰ���b����P��������'��O�_��1��37p�lV��K��;΀x���.GF.#�f�|�t� /LRͯΘ�*�F�lÓ���r���W��ȏ�a���k9[���g.0�h�Ǯ����;���&����4,�O��<n�j�+y��?<\��wa��{{}�w��f:�ǚ��Kf����O��n<n�O��3�-k|o"��1(wn��؇���B;ҏ����������pGk0Ѫ�K��a� VK���iѿ�˕{�^G?��u�]��}.n�[+��ΈvE���\�6����w�Q��c��#�(����� ~w��������	2>�ʿy҉%w^7nu>�Hλa�Eَ��?g��x:�h��j� ���.���w<���7���^ك�����ؼ���b<�9�u����?Qv�@�����;���}8�����ϴ����v���倂�������ݿ,����rlz��'��c�.��F��Yg�����O7�Ţ<���Z���,��ii{lm�\fۚ��~�~����y�<�o+ܡ�/9��p>�.P͚��6����ās�b������輖���ri��.�!̬�owo4�Y����VA�[~=Nxl,�|���̜f�Yt��us�EW��iK���f�������`A�������p��@j|Н/�rD���C�����]�n�Ӝx���h߭����i��!����yb�B�z�X��U���/��������r���@��6n^x����a>¾h�Y��*�{/��(���Z�V�]V���:r��⧖_������Ng7=��!g����1���N;C"�� З�D���'F��!�d�p��}vc��o,�՞��rH%*DSr�wܸ���ך1�����i`����s�a�ܰ:?4����us���|�(�e����ng��i~�l�w��eocHnnԖ;���@��W��hl\� �:n+�?����{ݥ��i��V���q<���F������9�8��Q�C`�,���R��5���d��]�|g����0⚟������E��yL�]���	0��|�P�g�����6ǁ>�P����w�DҌc������?�,f!O���۞o9,
Өwڟ�=5��.���bI��;i�%bb_��|h��7�;�/���֊��<�z�6��38����l1�!���.�T    "���?��B+�S�w[�̡$�c�H�d��6��>�@�\�������_���v��2�#�Oq�g�N���c���s`.3��Mtg���4/�$��z���f~o��ʁ�D���K���7�m-��i���s:���M�1��TT�/����;��kL3�`�-�Ž{n���_���_Ȱ�_S�_Y�|C���>��[��b?��3>�b��s��߿/$'J)Hɲ!�J 9���̩ӓ{�O��1���8���q I ��o���\y3?���a�{+��˃�Z��#����F��������� q��[?���t������lV���7�7�s2���������u���Х'������K�j�����]�<���]\������@���W����%[(�1�M���M��7R�5�#�*��O �a�N{��3t���?�=������!g}���LD��w�|$�[�w[�v������G�5���'xE�R��/�s������f˻���E�c���Cp6ztz�=�o��t7h��_tyi�7�Aj~�9+p�z����ϭ��i������;��|{�bD��}�#����`8Rُ��^�!�������m��o´���ǿ���?��ǟ��������������~�_���w�/̌�c���_�KM���n"?�^5S����FhgsZ]�ȝ3X�w���=
�sɠ���Ъ�;V�fo��N��(__�$�v�gb����#Ŝ�3�-Gۀ#�"ô��X-g��DE���8��q�9�ؙ�?����g{D����|~�4�dG��\�_��2�5aX���S�d�u�����w�bp80	 X$��?	����q{�����c�ڕȯ�ś�AkF�ޜmk�`��(D���H&/�4�5#x��'�|���٘�����_�*�����,3��宭�u��:����d��-ź⭸8:�!��`W����b�W���ߑ�1�3�~�c��So�7տ�>l���y�.Kj���+o�X]yO��[�a���S`����Z.�V4p��cݹ�b�������3��S�C�ی-��`��w��޷n����+6u��I��o��j�xZ�R���C`ԋ�N���>0+h�g��2���:3~W 
�i��?3k��5~N'$��/I{<��@��o0.;r}m��]x/��!9)�,g	S��[S�2���/�k��)�W�*��]8�G���珍�x�i�aV��&r��>3uj���i��9���cwry�N���K�����J��v��1̆�rqA7����k|wzЂ���v�(�f��Ck��������{5������nhf��b�x��W��F	]��=D@x�X����n�˪>JB����ـ+aĸf��g���'���v۪�V����Z�3�c#�s�%�|� v��z��[n�i����6Wa�Enz������s3�ݻ�A@p+�w������cf}^(��ב&��X��2��|͆J�l�AZN�N$�I���ɩX#�U{�w��V�A%���`)f���&��(Lv"����j��?{��L���'	b� �=�:D����u��ȃ^ߘ��YvPhWT0�v~���Hn�:��?���1���(6��r��y����'(&rg��n7FM��".��n9��E��"�"ݡ���FuҙL��_�0~|��2�,";{��l�cg�}#����y�	l�#Z.�ƆxjN��`"�FZέ~Ƹ���� �j�|�� �����	h|�e�	n��>_T������O��`.�t��*�,�E|{�Qr�swa@�%s������=�3r�	b�ʜ��	E�u�f��p �����
¶���?�	�����:�";��Q�����e������S`�O��;�F�p����>�O�K0-�I}�U�?�l	p�F���?��oH5���8䮣���sGs5]���V�cߺ���s��:lP�
rA�y����U�}t�b�������k�[;��b8���fa�\����[��3C<�n��g�[���$ s?�qف���n�������N���Bo���)K{ap�&�6� ����ݞv�R2�04�����RA�
���X��_�����#���k:��)��/ ��%��?�Dp�>8�;��kO3�I�9~&��[
$�ῐs�}_l�C��(������u�;��Ⱶ�B�v[����m4�5<9䔙z{j�9�Y������z����s�����j���;k�a ��������������� �5s�s}��d��j~V��O���ykLK�NV1�H�o�J<��9nᆻ;�W�H�w4�D^����pkqPJ���>��qO��� �k�h4���o���V�m��15
5����Ҁ���SĔ��dFľ`c,�Ѿ�Z+~��_��I�*:�f�c��w�g|��u��#۸��gjnL���!(D�׌
���m��%��ض8_5>Q;(:���7��+�/.M�L��*l9E��("{����e
�v�n�1]n6r�1g�� kƳ`T"[�'�&(��L�(��MS��e�Ь�9�q=��k� 3����q�����c�z푡P0�Ŀ-��v�3��C�p�L�#���H?�âQ���DZ�@!��4΄�=�]��g>��yENigW���K,��)vտ�C��o�F^�F��+8'�컣tǎN�����0��'�3��)w�h��o��+�&s�L\rVld{lŕ��ɽ���4
��ho�:²oh�(a�8�(�����<j��h�t �#�X�b�����#;:n��^\�ӂ��.'�˯�}��7T�����|/����U�D����cf�Qn႞���eҹ�Uܙ]����˘�kYa�^��=X�5�7���D�A0�{�g?��}
>۟8�L]��f�I��,�����w�h�Z�]�
��Z�)c+b���0�i�O[΁r�#t�����</�W�~� �T��7}[2"�3b�q�[.����9��"�*kE	t��+h���,�߿����l�9�F�S�cƿh��2��k�%,� ~C�o���^`�Ur`�u��jv9(����o��q�:���
��"�����x�iV��a��5d�Y"�^�Kt�j,-���S:Q��g���K+97�������3�c2��$��͍��c�����S�Lc���\t�L�o�f��qu��L���"c|%0u�13�K����.�Ȳ�>��� J�mn��k��<��kYez��E�~��r�ƚ���з?���3>���������M���J�����-�[k/�W�D}�؈g����}"K�2�㢆.@s���p�wKg��t@P73�q�Si�F�"ݞ�Z�'�E��!�Np��|�Y|�k��w�n�?@[Bta�Ǖ�=KP��xi��ȗPMf�5�́Nab#gg�����@y`E��=�����ޟ�,>A/[�\��;u�z�V��f!G��_&�e��B~�����pz�R%_��1e*~�$a�I[s-��ܧ;X )u~�00�'G�
������~����JR��rh�Z�C������1m��i/Um�u��(9��↶g��R���Y%g.�3�C[�����N���p�����k�w7��e��p�,�a��s���l����lp��L���%��Zx��BЌ?��%fwW�`L��P�/LM{�ߑ=)�h��4f�d��qtr	�mP��O�m�s���u� p� v�<`�pkIk�8"��m��vڻ.�w��Y�K���\��NQ��⋀%���B����=���ѭJ���~K����sd49�����f�|��{E`���w�OO줎o��03m��?q.0�ř���B9����f��}4Yd�e��m�-_��'|q�LC���o��Lksa0�g�� av�����X�κ�|�ʟJ�C��d�\nG��6C�r��R�ĥ^��[pO:�%3�w�E�K@��E0|�5?��7;��    `!q��Ŵ���)g�/�Xٱ><r[��*�q�Z�U[��]�Ŏf��3o��,}����u����*'�U���xf�^3>�h5�P�3��}�7��7�)_1��i�ƭJn��x8A�Y���艴s���2<�
E����:=�|ڻ8Ad���}��@%0!r��� r�֢[.���ϗQ@.�����Z�L6 ��4���"Sז3V�r�E���qQP"Xe��s��9w�����.c�3)��>˦w�������"JHX�u�h��,ջ)���T�b3��|J��AM��ѱiW�����|1a����{!"�$�S� \�:&c��6)$��nk8;�W</r�y����À���gF���#��I/KB@X��H���g�� �H��XS�Z�lBh|�
Z�N��H���e`�_��K��K{ڔY���=����Si���/<�e��g0TD��푃��W����2����X����\��VA+�����������LW��_�����+=[����9�h|��۵Ν�ȡe@t�_��ّ-wW �t,7��'����bh���5k����.��Z^d�ə�\�c#�L����#������_(����b�
g��?��F��L4a��E�=ゆw'�~��<����#��S7��S��$E~�Σ?$w3�e r��to��#����R�}��t@J7�e鯅{�:�e0n�)�~bm�r�#Ǔ<@&.`�jo0���(�%r��ȓE>�)�o�ֆ�"d��B'����������=����)Z.S���c��T�3)3H��6��Z�N��_ݿ��u��`��?Y�
Qy��_zP��}�'g��6��r�?5~�l� �=/�ʐ33��>�((~���'�>��A}=`5%?�\����?nk�j���I���.���o`/�E������G�IxX���$^'�79��_��֜�b��Ų��r���X"�Ep����ӭ"J ���'zn6���F�(�mۯ�a�h~�?:�892V$�wLT��߳��:1��{���?8�}���nhSX�ǛSJ��S����ϒG�"Á��6P�_��僠a��~���:��	�֡����1�=���_0Z�����t��9���ކ�)�s-r(�������;�pEJ?Y�oN`�?�+�C�,��n��Ȏo�#W	\	�����Ş���"���$v=~ #���T�²��ڿ搀}�3�� �5���_��5W���4Dn��={���/��KΌ��fSJ̑�?��5%Ϙ�k;M�|2�"�s�l������(���S��v���V���^(46|j^��l9hL\����q-]R��Y�N�!S L���<���.������~	"���[,��_�̉)��9��7�Gk�ʛKx�U8QQP��d����%���E�-[{n�7QrGv�&��Gv��Q�V�?�<�_�}|/��w{\?���0:r�XO����Ͻ��LVa��k9W�qް���"���s��P�X��S��7u{�~��n"WA|8�oߝ�(���ܶ����Y�8�d�DJ�����<��8��VuxT}W@(S�	VSڿ�
-��Y�O�O����l+�L{�me�B%��s8;�nE�����a���D]�߇�`L��?7�_1pKn!P'��Z�jJf�Yi���.)f�r��Ǉ9�qM����c��f�j���}��GW=��?ǏE9F��G����m��zVK�Ӂ)�2�ۇ����������$�u���ha�xu�>���=fg�/�u���<�k�p�lD7��[��v&-%�'�G�|�X?����[?�� �v���>8vi���޲� �Q�҅�����Ƴq#,��+�'!��:P����5�⠑w�\���Ղ����[D6�M5��$`�jٮ��#���8����u��%�A)�K/�*K1��*ˈ#��ɞ ���p<���t}J�\f��_��x{ю�S�=�oѭ=�V�J�f������q�����A��Uj�,G�Yý��c����()��O��ܱFf~^ًSQ 6�@�f~���()=ʗr<����a4�#��o<��Ȳ�r5r`�I:��s�:F��ϩm��w?�|ϱ��޿o���n�k�O|�%\��w- !�������>X��+�Щ��]c�E-QN�,Uk����+j��F�>^2�
���o._J���}4;>jW<�?�Y�E�Ӆ��f�Z�	��/��JhYB~� ���K��Ž#ې�U����$0��O�ċ�����pU\���!
�15��WH.\�*B����RP����χ0�'�N@^���U��Т���;!�3��OU
����~S��!�&�����O� ��ǥ�;�8��'�}��~��O���_~�l���o����?��Y+����_���������KU�����/�x����o��h>7�2�ؾ�?b�hnTz���u�咈)4�X%/+��@nQ- �8�.4�Ni�eɏ�8:ʒU���U�j&5�I�x�����,U�Y�P
�t�p7�y�뜠7�#L��fn�GU�d�����ـ�1X��_ R�+��p'���`\��l��sF�$�%x>r��De��� �";�4�����D0����a��1,��������<{tg���A.���0g���84���BL狛a��;�+rN]8˰ՙTȡ]�%r-�+i��?��V�K`����~
�n9ZU�NC�~�����j9wV��0����a-����fM������A�?f���"��;	�,�oJ�a�0�~����]�jF�
�R�e�mWKPbK�ٯ����.r-Ҥ}R��P��M���J��]9o9��[�����ۛ(�ý�R=T\��Ե(�ć�KW�.`�w�� ����i���OcwJvTz�}��l�j�#?�>��KU��V)åv��-�$^�ʜ�[$�w�!�?�d]4���B@�Jص9���I�����d�Py(���\L���0�\���
���r��PW��ML{�2�+}>���u ���-��<Bӿ+[����ЫA�,�����C�F��<d~a����e����0D��a%Gk�����hX"בC��5��8Y��I�ðrm��G��ζ��Z*iD�ξi9hτ��	[�:�)�s-w�-t,0r�2�(i����O���ۚ<4-v��5>�^M骶��%�L��O�8|U���!`���:�S�j��R��fE�Â���kCL�pǪ��*춒�J���l���� ��~�}��� w&����^�e����"�C>��e�6w��̇�B�~��h�{����{��<,�#��
R[�I|p���$A�RAau>�6����\�!�����>w+����̏�(�'��V���\��U�����!�C��Aݵ�7vu�6�7�W�,��oR�.� ��A@:�3?\HA3V��b��l|��}ar�N1i"O���R��%g�>Tt-r�����P�*����l��>ާkz��%��f�K�@��k֡M��l4�U����D��w�~��yJp��[g��X��o'�4p���F��52�|�+�'��F�wUY�C�PDG�u��fYta �P��?��띸����gPv�n��׸"�D��CjTY��-��r�3��#�����'*h�U�4r�ة����S����ض\a�O��]��\Px�b��F�?���ڲi/���/�W��j=F�D.6;�H��T�������i�
I ?��ƴ矲�R���)J���6u �5�\��(���W��R�C̀�a���0]�4�.rؘ㭬�d+�Ƣ��:,\�r�]iN�|?VEըL�J���n��X��
$C(���h�:���m@�p6��i���e}��I�:�XD.T����
3�S�����\����ߗ ��kE�щ���i98Ө3�#��HCF.�~�؃8i�fJ��M7�G�?Ur�w6m�y�����U1k�v/��0��}�u��mq�߷�w6����B��}��u�ȹ��jj��̍\,D�o6Sr��:R��U��b?����sd��    ط�38���tٔ?e�3I^����29ełc���¸c�Oh,q$`�}��Ȓo����;]��?�g3/K~_N/�>�j�a�߾;*�g�>���Eu��,�Y����Sup1
��"!m�Gƹ�K87�eW���"j���j�\K n��ÑV�~�������l�ǈ�M>��Ƅj����t�.r�o��9���%	�z����Z�I�j��B��Rՠ֟a���$�M܆տ��ʤ����d'�l�(��{�(�f��s����\�EeAY�u~d�ry�+п?54��e�����u�<;��q��`��B��̵܏��)��SsA�=���\����~ j�,�(�?�K`c=G�6AL���f����
V�`�/��;���W�����������ŷo9��,Ǆ�l���$������o��-Mq8��R�S�Mj�H�X;�������.�>������*}H����ȰbF���\*j��KMUK��g�5z� �w9�*֠\�pG���X1`�K���ξ�-S���Z�I�&5X���	��/c����@�/o�2���WG��~S�\�[G�����s�*G��,m��k�4�ʳ+���@���|<T�X�]�'bhg�<��"ˍ��Q��f���zp/��3*��I�O�mQk~ԇB�Y9P��hJ�N��m��}ʯjȲC�>��9X��E?����T{�C�*�m��P�L�i9{2Eу��X��v5tA���Xr��:5YN���{����-d@���+�2�ZNoC{�dSմ-A��O|||�ç�PT�D���>Y�r����d߁�!D�?�� Y��<io:�9���iq\b���H���?���v�PK�%���P�����d��\�=�x�2��cA���sj�?$`�;���v�+��M����e�cdާ1��l�%�R�B#��*,��e/;6bё'¾
���`�����Ɔ�6|a�7�C>L�GJ{��t(�6�g7�r��ǖ'�^ 8��HY"�{a��?��H4��K�9�Y�?�~k�O����k~���p�屋V��/7�|9,S����!�;p��=�Z"���2?�M����~�-I��k�`�G�?&/��ű���A!�1�>�\xQ�E��uTE�^������6~��}�n/������~�ςЌ\I�ԥ��������-�\~�%}�=�;}:�˄�ð�ݑ��P
U�_ӌ��F�D�/1�e}a��U���_�WPɘgK9��4��Ab�9�Z�12�J�������
z�8/^}�YT<u֏�$+�kG���g�^�'B�_C_�|]Tj
:��[q9#�������0K��S����ٙ��"M�B��/��$�3g��=�´�N{���<�ֿj�p�!���"O<�y.-��M?�ô�4�i�r�IԪ�7�;�E�?ED��TKA8HF�C���ٙ�V�IN�X�*@4�9vʓ0����9�D��}V��'�5����sM�����^�sٿ�(a���C�Yd�,�}U�n�&�vw�*�����k�ኂT{!CaÖ��d����j�����-=�X�{�ދکa�r�kK�x�~a(-�>c ���@�￪��
�_�$��9Ʋ�>��`��%���m����߄V��1�?�G�&�u���k�G���d���rM�˟�G��jb9MT���B�y|�979\��D�G9� ��OP\�,������L�#��#U㺶���]X�u��$�b�؏ x��j���~V-���`�S՜}%��5�i��=n�6�&��s���� ��{<C:�?%d9$ ���~��D.�P������CD���'��Ү�u��_���?~��O�[�$��������.����)����?�����Zh�MU��
�Iɭ�W��K ���*�y��Ou�ǘO�Z(�'�y�r*�0����'2%H�c�$�^9+%���j�|QOK����TÚR��=+��C�n��8�K7��,N��"��^��w�(���Ǧ���GatL�!�1���ii���S�Y �b��1C��Y_�*O�9o���z��Sc,��:���%Q�����-	�����S�1�t����̾$.6�@�4P&,}!2X�c�o]������w�����.1[ֽ��D�Օ�j�͕�F��D-ʀ�)���ED���w	�N>�����0a��h�] ��W��.�b��:\�Gɡ�/jpɓ���&��䦙��*Wf*�e�.*!)K�) ^WbS:�Ue�%:i/^�C��/j����������f\����$@Q����|��1	�&F�� uT*8���d���>�+�Ǽ��.���H�u"P3��t1	�����zc8,n�*]QNE�|�ǥH�;���Tnk�*e�z��-i?J��������a�}˳O�i֕JW�2����T=�yH�Uַ����E�9�-�cmqa#��B^U����Hz�E���豭�J��&@���������!\㾲����SZ�ð쏯�H��$�8�}�ň�x(�T#���K���2�!��t�rժ����OnK�; @��Ls6U>�~�AI��=�I�L��E�蕀��%
c@��-WI/%9���^��.��Sp����Ɂ���<4�r��^&d���5rw�(�̏}�<�P�����]v:�E7A����;HH���<�6�Lz���WR�R ����̌oL͚��c/�#�-�[��r���P�R�D�\*S%���7��%!���l���JB��{�8����͜EA5��{eU�Җ׼�{�;��O�_q��P��3Fa��\�tl�D-[n��!м&���ɀ� �h8��:�] λV>VPs�W<¥�B}�D/7�n��O�:��7��+ZQi�����J��3�Cb��啶�Z���$ydT���/e�Sn>r�I��o�?b��Ψ���"T"l�@3��w�B����A��?u�p9�G�_�)7����I��b�����\�q�k�[II)�^_�vx*�/��d��az}��$�n2�Wȋ>�"��>U��S���us���«�Q!�^����m�r�m���~=��O˽�㌟/�T�2���������ҧ�U���o����[�:�6a�F�t6 �8��2[JE���X�-�bZ����?I���7k����	�}q	�W���W[�K�:)7�{%.�e��qIS��崫J46l�/��6��M��@�(�C� �� [��\�����)�P���@h��,%�1�eB(�"���;_�E��8a�x���������R�3~�!7�S8����hp��yX������t"�<��_�H��Aa�b 5 ddx��?]�;��0;�N�7�\�Y7� ��ri����v�ș�I�L�q�a�̏�I��V�x�I���	���jMtg�K*�Y�����њ��Mt7(��_WB��dM�	�ۋ�������}@��unG1�Yֲt��2��g}qe��g�������:�T}�
�R����:��˳7th��Rs)�,�t�A@eiyFad)P��:b�MY�g��0G�Y��7�?0r�����i9V2͘� MT�+Ԟn���B��yO{v���9�ؓ��p�����D���>�Iw_21r�	��}Z�]"��ao�+�F����0�D��K������AVm���9.Z��Fu�K�aEyK?�]{ؙ�?��-S�&�D}�$���|�	b�0�[�6��$����s�\�yJ����)�'���`�'�m�7t�<x���(|�~�r]�9���bE�[Ĳ�8��[M���8�p��<L#%�k���B�r�I��A��> �y���B�Y+G�!7��Lȇn��X]�A�I�a$ܖC"P��c��m� jynL���i|�a.F��}
k�)w#r��(A�n�.o֐#�gr���}�zHP߯*�������E��j\(����¢ZM�����g6P��SH����Pצۣ����g 5~i�|ND˓��g ']���=K�    �l��Ҟ�rOF�^o�C����J_�r5�O���a�b"�_��ؗ�*��p*(ˌ?|�%�2�Y��^c�;�!/t��N!�T@My���Ԕ�{��c�i�Y�L��Uj���Q(�]в��|��Œ\�*1����y*��0��Gܮ�~u�l~�'H@V�H�i���e��֏�E��PA��)�������r���߅uz��{HPhVRV^Ԟ�Ys�=$����(�����$�W~���������Η�]� 	I|	���Sߖ�tAs�D�χ�=B��{��B�T�<��_͸��q)��ܥ�)@�k�'���r�%��e�N��5�`5�S�B-BwU��k�x���0����m��/��#�s8����Omw"��h��2{�����S\��b���y�]HN�>����#�QN{��������uƗ�� �J˿���ѿ5�F�7�3'��K*�P�t��F�T��9jR.�������l	�{���� �2�Wvj9�?>��(�r!H�)�����#�j|p�z�0��Ҟ�c�HR��R�IM��#'��*&:�P�$RS�2�����O.r��"�4�V��C�t�/H"۲�\� k,�7Kq,ek�iJ.��b����$����N�_�k�'|���)�0������"M.N��H�/�_��}a���t�Lo$P���_W�%�Vny�+�"s�b�W��{�h��#��ޏ���������h6�H�m%�'���S5~�~�����Q�ּ�o6t �E�.�czi/�y�e��0!�)B����!�a���v{L���5��';��rP���B���}�Tw�@c��/�wQi����!��
ѐ��;�Sd�O	��%"��]ױ�J[�^�W�;���a��%����n/.r���gf�BuZ�8��=*��u���k?�[t��M(�Q?�o1��M{���չ�?��)|4!�)�$*~��avI�8R�I̱�xH�E���Z}�?k��M����P%���f��
��ȟ�o�~ ��F�\oy	�/�9���������a��Iu�Pr�{���e=ʵ|_q{�,u�_��$+�����Mf���,�� ��{�R���}!\�iK��c�����@'rJ^ºGl��Mo�$sQ;�j����s�Z�5��OZ�&�r�{���"�{Z.���R��K�}��k~�χt9����_��3��.��2�̱�V|���6���K��!q��ɉOI�Z1-�L�#�Ţ�D*�Q*5bp�<�W�`'���gDя}W` .�@�.EJ Q�$�������Y���S�FX�֍|)���8e&��	���W-%Q�ٱ��w�?8wt���iI��GxO�q��5��^W�������O���������~��O?�����?�q�ڽ�巯�g�y��
?K*�⍧���ܗ2���F��%�Gc��/��;��Ȍ���'����ޛ��۸�	�̒���:k���w�è> ��g[.]��4���l(lNi��q��$8�o��<%(��yn���)��b���nc�T�j�u6�N2�#�oތS�r11�Z��BU�%��g��,l�]�+�To&�z~U�ȃ0�C��B��M{����W8��s�� ��0�����wu���YK�����`C��U;6�}7��[��^/�E��B�|���3�_�*r�γ�q>Z���뗹#�e����r�����W�%{p	�*+��%� �+9j�p:�����Q���R�}��>̞N@b�ļ���G�宁z{E5�Z?(��}ޅ !�L�}�j�C�O����������G-���Tͯ��"F �Q�_/�͠��-ʪ]��fħL|��>�g-;L���~��^����1��U<��H�r=JN����3��$�֖+�Po�c�2�r�U��S_�j�q�������'S�~����ᫎr�+@Z�ǜ�<�����{����Դ��0�+����K�uT�'Ij�Í������/�#p�����È���da�������������﫧�
=��3��~?ӟ�ya�=�n�s�e����%��k�(79�H������g\8t��Q=����]�/���o6�|ሹ���
s�e%7
#��n����弬d� U�	��xx�-�/x�_�D͘/L[Z�k,��؎�"����r���#u+�P�y��[�wņ�:�T���^k�QT�0�i����9�x� �������ܴ�b���3|��)��{���,#�20��3`OO@
֤�y*�ֱ������)���r	_�U'.�t� yP>��q`2Q�ҏ�y��ӗ�������=��r
��#b��}P�S��S<�� �Bp5��������k��0�s܁'�����
�V�W��K�/���<M� \�%#����<マ�*�i���+uRG�	�(����Y�j��?c�O�y&s�rz�\�P�;X��W]�n/ߓ��ڵ��P��<��0.3�O�_@���r�����i�A��N�h8�-��0n�5���o��.���R�ve��#h
�r�C��P]��b��H�¸_���{'׮Ə��;�ǧBj���W��(���o���F���ȁ�n��r���/��d4H�/b����1Z8��������)�?�e�O[�l��_CE�D�ឫ����H��1��G��	9lg^����u�U���+$��y-מCI��G�r�,�T�o��Z�F���bC,a6��K%>U�#���azs��=k��4���)J�Hȝ�c`�} %���G"y�m���
	R��UD[ +/L�����p��:��L�m(��ޣU�B��OS���rd���j�H�Y��������:�7���2�X��@-O	��ȩ����N�L8�����u�"��#��/�:�x�[�FɼIN	��F�}����E����3�lDх�D��װ؇U��$Ʉ�\b����9�pE��3(R��_���9��M�n�>�ϕ�55���U}Rd���ŝM{�8J;,��������&�'�~��Y�8�M�M{N7�1�/hْ�yb��\pTjʙ���f�����KP����w�lܯ�5#�%ze������!-7l�v���_�)\�r�}w��̏�'=�B��4���� �]�-��|񋺢�𾪬�#���HM�	L�DE��C�?��t�` �}l�9�����<Fg�!Oa@���<0�Љİ+x�(b0��>VqQY'�}��w�؛/;ƻ���y
9�����8�ܓ;R˄;��ᖿ�*-���a�f�>���E�q�����\GY!��h�P5�_Y���x���o�M�r�ݍ��	x��~�׿ �|�;7�`�
蠽���N]
��}���
��=O��0F�Î�u�W]g�T[��R�Ra4�r���luֽ��v��(U�s��H<?k��w >����a��P�T�>���'��^��a�7=�8�1rq+���Ќ_r�4��3>+��=_������?ـ	I��B��Q �2�@ ����Z4������^W�gl���X���ȭ��9�4xef������gJ�b���-�����߯�ẇ���uM�1���R��a�tՂ���$7�ߟtrR�#X_�_*|��5%Zӿ�}ބ �6�Xv̼���d:������+>�ڦ-_B��J����!|�7���Mg����f��Ĩ�e`��W����"M*���՞�1�E6�����6�+b�!�p��0���_��F��i����C���c[nS��ki�ۃ_��[~d���k\i/�?�ê��r/�,��1�cl��K_\����s�]e SW{��k{|��3�m�07���-_�$!߂_�kɊ�A�آ@cD"Gkg������g:0i[�&ku���Ѽ+~'��+��Ğl|(��� �h�gJ������2�y�s�Oac��A��bE�`��	�}Ֆ���ȗ7�|�*�$@ /=r�%�<���7|��y�Y�DBUO9���A�s�TyJ�5�y��z��WX    j
��L{��$��[q-5�C	9�BQ�=�Q����|���fԉj�x�;��~��_~����w������x�������Q�I�L�#1��CՇW}���6��W$��7��C.U�~�[!�Z�WYE �����Ll�6>ph&�y�E�A9Ź�mO�:B��^�K����K���1�[.�g_��ȕ����B�-��I訔�M����Klq�m�>� u���E��Ź�C��UB��A�!�U9��\e�r��<�h첮-g�%�{<�jQN�5>���D��7�0���ͦR�y�L,25�j|ή'����|��겸i/��u��/-2P�3T�6����IuD���rJro\0�Ǟ˃K�A���ZskE�%���/允[y
&�O�3u#_R��~����^�vΆu�wZnً�j��9y�'hy��b�ߗ�t��r�_ςG��\nw Ӭ�����Z����'^��6��\,�R��d��>�qY.	{7Oh;���O�Q��GW	V�ʏ�x�S��{��-��C�i�/���1^���`��'շI����G�����R+�,�W�=r��m��H��w��r�:��`�\n`ګ��k�3�+�>!2í��*WW,��I��[���d�u�Ӄ�v-3�8/�	Q���h.��N���9��-i�y�rQL<;r�<<�k����/b��
�`��堌��E�������sy�c</���#9[���wo�������c������/W�"?��q ���K�D�b;E���=��=�F�_�X��������j��ҿs�����!�[p�(r�R\Ev�|?ؑ��'sAD5��Q��{şMf���O���n;������S%	x����(o�r�Ϣ	�?�1�S��lo������x|s	i"r<��
����)�_�c?�L���:��������{W>�f�'�.�%��6(��z�۳���,�]D�uu�����r0?o���P�_�����V(�!��f�K�Hǜ?F�I��#�W�<I���	����Lv�+4��,l?�VZ�sZX����V
*Hc(��������˹�6pƝw��^�)�Ř������]��%x ��*���Χ��9�!C��wv�8��a�/j�.����S �埏  B(�f��>����}��-VAMN�S����z��լ�刺[���Zޅ~���O9�3��/`rP�X��nH"����u{,�$�*��rL���yO-g;�D7�'ӿ<@�*�t�g�"���5=>��na&Lpa������n$�`����7rH)��������F��Z��L����[��ʖv�Y(
����LR!���A�������ȸٿ|{�S'��ك��}ٞ������'�N���|�f)�u�ߴGs�g~��2O�6�u�8����Z��sʑzt1�3���u�GPT�Ƣv{��Р��H�}q,��)i�rN�ŝG"����ל��R�� ��C�}�̅����:���C��s����'�m�{�%2�Ay�Ծ��6�/6{��<�����׍V�Ol����@�S� ���4Lє_����)���6<�@}�/��b�XY��g�9.�pJ`p���]���`�?[�̲���1�V!����S$ߺJ>�=u%x�"O�>�Z��.G��R9=�\-�~��G�1�l/�-��R��^��G�L�߲���5�����G�K���#�xa�}#�c�l|E0���̮~�����f6`U��K"�Q���(�����@0Z��X��	q� V5>�-�l����0 �Oj��-���ڿry6�x���\f����|�;��
�P�:��<� [f�r��d�`��?T��բ���Q'?���`�&���?�.��z7u��bQ������L�}��5����V��G��(�W�g<�wS��a`ӿ@!t�.��E�;�ï�����=0Cb`���-3��G{����~�xC\�.���|/gq��u͓K��u�)E�"�o�_K�o䵦=KW8(~��,Z�1]#��h𢢶�3��I�QU
�н��R:k�'�C�O���\�Q�>ݿ	���	�B�P�e���u#���z@������*��q�����s&��v�Kr���g�O���w?���ϟ���������z���KH���?����C�A1������i��O�v�:*\�*�/L�W���5��Sѽ���T�]�,��ږ������/.��B���!b�}�\N=_^�9O|f)�᧪��sT�m0�%$���T��~I��Lf��9j�z�ZuA<X�E��+���*���b*��Pz�s�����Ĉ����}���v�Nn�j'׿��vdj�+͑'�݉��~^��)S]P�i���_�!�p�	O{O��$��+�壘��٦��5ī7sU��R۔c��e8㓔��H��y�剘��=���/I�DͿ�{)���WG�L��%�Mt�������qY�* kB�^<�����y����y�ψ�[�C�x:�QEG^[�{�	"��$B�U).!@�o4F��}����4���ҲE�T�N��x$��R4�{�c��Z��ľ��x��(H��&o�
^���Y
13y�����^IDͣue��IT��������Y\Q����:��?�%rF�w�A>�z�}*^vڍ�6��������)�lFn{9�tɬ�O\�C��R������?��lG�&��Jg3;<����ƒ�rX��)����zʵ>�Yx�ƕ��td���~�y�@"�h��7(����3�_�(������A,H%Wy����&-��	�d]Gn~n�[�۸l*����)��e�ȿ^U����~�`�5�s.)I��ፂs����K���*�B�\������˿�wF�w�`
����ĐU��F��4%y���Z������)���s:jw��
3Q��'KU�&;��8˄�w7��j�M�P�k}�p�^/'a�"}�����/a�3�8�Q����ԍ)(��RGˏ�8�%bX�C �tH�W����`u�q�#�J/'Ѯ��]�ʆ�L;����$߀s���l���w�7K��*G�\�Eږ���ͭ�O�~X�����>@?��ʁ
�D� N`�O{�Ni������|,P7O��(y+rFR���'l�p	#��&�vJ����E mn��;�������3~$�r�Oa�_P"�0�;��D��:��o���'Q-��i�&ӊ7�f��(���2o����>��p��	rP׬i�$r�A����/��,<����T����=�����9?�r^�`������MR��|I���,F+g��0�G���ˊ"�����@%A�fڗ��>�<���q~�i�*!����8���� �r���#Qb���Ɵ�Rz|\�׋̹������+Z��Dðq�~�xOq	s �T�J���`M��n�s?�ą�y/<\@�(}�RM��ۺ�+Iqnzy�.9����+O⊧QS.W{e�$ٹ�����jڮ�k�;`�����=�K��y�ܯ������=H۴�z���kw��c.Hj�O*�c�U�� 9���rz6�k�I�w|�p���7v���،��p2~���'��i8lΆ!b���|���⛢�K�����z��)C���:j������`�ڗ�}>��+)������?P)+�[��ő7�IE´�㔹i(�ͫj��HX<�3>�y�N�~s��<��'U�TeI���(���,�X ޮ�Pb�z2�p?J|�����᢬x��~əX�����8�XP����+i�@��N\A���~����\�^R(�5��].8�o�cX��"�}
�:̥!�Sѵc4��5u"re��P�v�9f�E��+�O�ϗє`1j׷����<�//��~Ld����*09���n��g]��*+�r<�ݒ)S�|b�T��{��jy�U��~_�ގ����so7��K���D;�7��z�ƃ�-�v�P���"�T�	�Y�zk�3IL��߆
aSb�v�y2N��k�@~@��i9��m�>{    ��w]R)|P���Kh�0�|�z����޻�芺���	~�T��@oC��F�0uџ�~&w$��\�yN������ d%W`M�=:mˁZ8m�p^�K m�υQ�J�ɣׇrfp$��ۃ�(@�奡@���[5-���y����1�j.��B<ț��}�wi��k����?�:��c��j�q�AG������t��~�)�?�%�q����H�xk3���N9��c���fY����ᤦ�����r�`-S)�8C�����+���+9���{2�Gߜ@����o{x�'.���wA2Q�^P���҈��T%����)r�~�?;C��9��#2� 0����t���9O<P��d�f|����Z^�ؼ�D�zޚ��_y��!�8�X��i���������WU�?\��T������_ץ��G0^
���O�XS�r,��i:��Ϧ��+������z�pg���jk�BD��wY�"F��zNM3�Ť��ga"�v6�[d�$~�<���l�g7��2���FS��7%1rJR����lc�P �2��=�YG��ǹ�t�XQG�9,y��r*=�DY�=�1�H/-�/� r"���7�� 󜚂y�HB�;���r��JЌe��Æ���G�#��j��(��6���?����g˥�{��r�{���s�{�h}�;���\I�|��j-�~��.���O��V#䙩j�Wf�+B8�z@���س�M6+u9�j���d�:��۲3B��x���%:f& U]9��_wR�7�rOio��0bHc�|��ʈ�h�w�n�� %���ዅ����(	m����T����Ab%����Ĵљ'`�|(o�'���_��5�o��c}���SF~�(�)c}�����}�c����#OL>O�����!�#���^�[���pZ� �g)g�SK��}�����^��,�����k �/3�����yU5�T�]�Td�t��R�b1��lG_ _�W(0q��=X��Y�\B����r�qa<5�*r;ɋ�y���T��Y
����ηB2-���bK(6k�!��I�������S ����-R��C�r�4�����8t�I��ꢃ���4�<��yáWj9�9�Q��$�xhT�L�%��\�uSՎ@|��W�Z.��HБ�9�1�m���5���܆�yI	�f[Μ�i�v�e'D�\�'h!�9ʆ���/�WL��iV+��9�/�y�qn���1b�,݁i��'���@տ�0|0����#���&�s9Eg|���o�r
�'��K��rV�ɳR*N�ũr>��a�k����_���F8���j�2_B�E������K���n��{�F����9�y��X�zn����}�<P�3����xѵ����ϩ���1���w6m���ſo��:9�}N/Fy�G@��G@>���x�AN��:���Jç9'���T���Ϡc�>�i�hFS�����/�N������P��i�9��=�VzHx+#���32>��]����3weAR�I�A��>��{|j�.;����+	�Y�����'#���u��ӑ�	a0o`.���c�;�$��8�>��n��@�1���٨�yˁR8q]�2�<D�H�h�~.C���!�8�o�_�7*�L�F�OU�1�su{��Ɩz9i��D����@�e�#��s2-O�a	\E��m�r�L�M����Z�S��s?��p]}���i�����?��L�������;�D}���˥>V�g�K��*��{3�],�}la+%%�ۃs��P��{V>��2�??-��F%�a�T�u����~p����������b_���^���ÑS]6	̜υ�&�Rr�Ĭ���K�v�O�߫6rˣ�\�'a�
sӕꅻ1����A��)�V�e�St{�~�����\����p��`�T��?��3����0%}10%5,n~�k$��-��\�}K9gU`In3n>��NF4���#
c�n�3�T�/y��H-�v�?���{!�t9 Zx,�n��a��3�����c�����(#�bz%r�w���8���s�PE.DzK}�ſb�:�*��������U:Y��+���HXN��?eP=��n���=��1�����t��q�[����&eg�\���I��v�"=i��)^�k��%��3Ÿz}�8D?���_�|�c?��9�.��?�o7�o�惎�s�?����H�<yº�'q�W�Ô�mˡ�l-~<<0��,���_�s���-��(���^%O��aV�3.;�o싷=��s�+����)V�4����~� �� ��OP������?^�_�����������o?��[�y�.��'UG��GQ{v�5��\�J����ܰ��.�ʴ��ڌ��o��Sk��B�/)�:ADw��ׯ��=tL6�y	�b�	t� b�.�D�L޷� �0<g�����n9_�]ԕ9�-��<� ���k�	"T��2pb4��\�[x-g��!����?u?/bD
�Sl�@��{��j�
,6�+rY��GpA'C�%Ld.�J�_*�U{u�l�LX��m9�s'_q�Ÿ��v�/&_�m����Jvv/y��V��<x9�7/���X���*T��#W�٫M�W-ϫ?��o{�G� �hy苢(�~L�O��O\�̵ٙ<����?Zg:'��X
���t2~�ob���5>�c7<�5��;[���k���E,5������%��Je�<1�w���KI���Y������
È��n�����e��N��/����L[ٙHP��_�G����e�R�oal� φj9@�
y`U��$�m���-C�6��!۹~à��~C�4鵿Xg s��e*��k�~�H�}���� l���P�\J�]Հ� )r���{?�K]G8����~���b�8-��j)�������%'��w�����p��󎥃�Ls>��e|\3���jo.u�����K>[�݋rDܰ�x��Dj�=��!���^Ԧ��b
��_X�<S#П�_ő���D^n[ԑ�1���~7!����bg��2�{�'�L��7ݝ��Q�<ׁа̿qwq&�8�o_�_@�����[v��\�<p�7,˺��04y�I�k8��W��j�����K0{��ɇ�'�n*j�����č~R�/���9h�RA�'��uI���$�jv�Vm�~�x�n���RbȬ?$&��[�\BHt��3
�L��ރK���W.��"j��+�]H�%�)*m�(}�R�X ��r�aDA7KGV{�@��������~տ�����j9������B����-w4�.�R�ۙ�*gn�_%
JL�e��T�)N{�&��X�-w�r1g��J@"��Ji6��d�n�\�.9��ȷ6\��%�<����_j9O�5����o�HS��b��;���Z�$�2CA��[K�[
�GI9�5>���{�3>�����9*pZ�K��U�YCr}լ/��ݜ
����|��L�֋�J��ￃ��?�$�]�F?���U�ZHZ2]o\��xS�f��������^�!��Vm�Q�m����<�y�M���ꪺ%d	F�S�䳿~�'��Dj����v����*�\��� v�dwᒔ��ƃ焻=�b��CҾ_����{�W��x�d��b���l�E�@  ��z�G�P�.���r�$�!G�b>q'g��9������o}O_l�������N�X}���f���p
�E�٨RR>��+�AaߠV���Ϲn�B�u�5Pj|���ڲZ~PD������������O�՞��bF�_�*�H������*�_��y�@��j�h�R� D�\й^߰t�D��^���#ݞ��7E�����m���bt�E�V��ő#xz�T�E�}-�I��lgo%�Za�/E��Ȃ����>�U̼`6�)�������d0Gh�-�
���w-�\5�.�r
8����xj���)�\���Ag���ȹ�N�b�Sу��=����9���rB�a]`|m�J��m�v���ό/
�RlLT3�Q1    �Eɕ�<�D����`(�^y@����E.�������U��7/������?�X���A�T��gPǁѿi��A�p��e1�@b�&Oh��3(t���1r��2y���Z�?b�I�j���b�Y�W��}��7��?���$��0DSѨ�=�V����L���U6yڃ�1С���w>9����%z�L��X����l,�ֻ��9!�ҩ�(>���ǣ�E�N�/�����ߔ�n�_|[wn��w�����U�����������ߑ���]"0������}ny�b'CqڛN7^��e�����|A���N�|#:@��O�$O�����LB�׌�Z�E��I�T�����]~_BE�K�%��+5��Sv�3�����2h2�z����y����,��Y�U��%�Dߐ��ܭ��ԇ�=�mb K�ar�;��%-����o8��'~v�Ӹ[�CK���i9��o���Lc��j�g[Tly!�~�S�;���V���S)����r��a���h��r����W�f��������u~xn�d���Q	P)f\�I!L�'�3��� VJl�}18Q�ɣ�D��ĸ���!�e����Ţ���K�;ߧ
�����u,}�[|��г���
��Iɯ����Bz�rj~�b0->[��W��i ��S�l	覽ŀ>�E�����[����y}\#qnJ�k�o1�%"�
���|��ꂏZ�S�9.8�:���͐�����&й��m�o��:��Q�_=��[�f�
3��ϩڠ{���za����O��<ђ�!�quY���]ߧ�?���N���,�����If�8�"s4��͢�L
4@;Œ�A̷�G���� S0�|_'��53~l�D3��`�8�������$)r��!z[�<�^K���P�Oܷ������'�� )~��tLҞ����G���H������漮ei,�ˎ�-�e�T��zZ20����fג�H��)�UU��~Z�� .�)��A�-pD|{}��q��S��]E̠��"OfdF�������F�/����{�C�TP8`���@�3�~QX+�m?)2��0x{R,�dm�S�(I';P|:59�^?�����vO�{~_������	{���8�DR��RA� ?�4���"�
cn���#/��_2Sʭ���s��,��-{��D��b��e�%;��?��/���Ǘ~H3����߿�M��?�������?��;��w��O_�{�A�����Qw���l�I���''O�x���>S.�)*��i�ŷ�u�?�H7�� �?��Eǯͷ�e�7<����C��S����xrF�� 볥P��mh���}�^�Ы��c��G1Jǋ� N�W"���$!���aJ(�Ӄ���[2ϟ*$e	c�X1��i?�Ǻ%RJ�3nzx���s0ϑ�ሤ$�a���"��߽�UO��!<�|� 3GCd�u�| �I��%�&�v~ƃ Z��]2��[�v�W�b��V| h��V�՞B��v�Z/2������"9ĩ=�w��Zw0ÆI�����[�/:��@��`��3���s�A$�!N�DFH�c��b	��O�8�r���FR)[�*!� �r�{$�Xa��.�4�5�O�aD���m��i��|ǥ�Pc��Y�#�ͽ	O�D��J���s5Φ��K.�t�5
7��5SQ�eBϑw�C/���-�u���6����	�drj��?B�P������A&MT_B��*@Z����ml!զ_i�B��V;|Y��i�޿d��Ƴ��V�s�;s��F�y�S�d����V��ӑ��C�P�ۛH����!���	���L�ﲕm��OO�&���]��k�#HE��Rw�͠���%��O���.\��-��b�]?�;aA;��� �~��>�a�_)�^C���v%v�:T8��v����)�\�ϫ�>����	��֭�����f�~��~��eg�鎗; �"lH-Ǯ�dT�g}H�d��qi���]8.�p�&�3׷������������/8��Q�Bƙ^��}	���|������?�TA0�����}?pְ:v~q����� ��ױ����	)[]Y	���/A����� mG@�Tɣ��ԅ��%�����'Q�ο��ՠM�s}��?k���	����+_�S�v)z`
GUK팧�K�[̹���
qୄ�s���qXg�8DW�D>f߃���"��iŜ�O�0V�6�w���:W�U����/-��/�x掾}��Q�{����PŪ��_�gx��cV�����:��A�>I:����$��M�rpD�bO��b���d;e,�
��]���j��ϰ�2��9���p6�Cc�~8�w/�!%����E�ﾥd�{�ސ6����V��^)\�u_��I�ѩ��e}��[ES�o���sÐ
NH��͗Hm� ���������h�f�(P5Y�ȵ�R�~�,W|��+z����L!��3$�*(p��@�앶��쎔L�|Jk��	����g`{����z``��7��<��x��� nM�y��C! J
}�s��j�k�@��EFع�*o+BJ��^�݂�@9J����r}������v��M�.�K2����"Y�)���ۍK�4Ip�5�{�~PԨ�b��
�N; rT�˰n�ˎ���~Yd|2�C���$4#4�%�%�r���[��v"�YU����k_������J)b����8�| �q����ށ�cG�R��i�I�W����L;�������|vY���7H�N�SS��1"R��E:����g���۽w�ɷI�"���oO�� ����H��SE$O2׿"l}���yw�#Z<���B�'�T`��q�b'T��d;;^@*��4T��}�Zў�7�h��L�lӘr�J���F��/*"v�N8}b�=bAVde���vh|P  �P2�}��$�~W�UtƧg� ˅���h����Әό�VI8aj�.DL���Z��	��{d	獨	��)2Q��=�G	���.�0Ӑ�c�nS���O
�S�֊��	k'�7<�|��gg��{ӈd���D����]Zs�Uē�>b?�g��7a��5������{��x�g�$D����N��+*���#���}��#�Ye�^_����_;P���|VDT��6v�3Ҋ�Ӿ_���Ffג敬���H���y�b팷Q{�8%�~����HP�~��3��J�kƧEIXGZ����q�Me.���߯���h�g��� Y��6M�d=��:N�V>y9ӣ%#�EK��j����C��߿i_ծ ��5%�����X��-��c�IO:�v���~���JE�z���9���ڡ[>zU6r��!��b����$Y��@�b��T�#�
O-
��\�L������6��v���Z��/� 9ݑ_���?��/Q4��=��w��z���n�fj}�G�N�B�_;���DLn�TM��	(:�N��E�%�Ξ-��e+U��$�S�S�7��֐�/tk$#[�/fO�Om�y�5I�y�D�Ў�C�Tbƫ�ϥ�S�NWiN����8壟R�%���wg|*��!{�;�9L��BD��ӓ�b��r~_Z��SF���+�Ǐ��w(��c
bG;F4��p�����6���{k�;w:��Wf��DV!ukɝ��RZ�I��~QU��'u�\x��ԟw�V�i����Gt5����k�Ů�R��Sf�%��b�'o�H%�W���I+�q��!ƣ�Au���y�I���p��L��N�\��y��y�_���Ӎr�m�u;��\C��<��F�|R��F*��?,h�Gا�ٷ��g� E�}~?E����*0�_(r��>U�b�o��3/�����0㭞�R�O�a�ZQ�dq��n������3�L\�ɝ_���Q����t<^ ���f�aZ���j�ep�cV@Y dn+ �v�3��~w(�h�eR��*�g��J�� �, ��^?�2e\��/s�{�o��nb+�x(O�"d3^��+}j    ob�E�{��lQc�Wb��7੊�kw~�f��ف��<���>�.��I7`�K=="fb�h������p�.�1~�ܿz3�L�'���C���Ej��!u��`�#<mj�v��Zdv�@t��2�}�75��α[gc�NuR�_,�ҹ��?M{�A�����0}�b���'��I�1�o��z�3��O�����!D�r2�Y�'�����fO�2�F&�ܿ׉Y�z< L����d]�v����f� ����[R��a^���i�^��?�������i�b���q}e(��3%��蓣��W���%v۸��V����m����4g�k3���A��"�_�v�.Δ�s�7�M=o�M���=�Q�KY������DyF￺eF,Jqu�j�<@Z�:{؄��И�P�s}�BX�jOK7'���Z���>��9�H)�W��8d���s?�؛�V�h1�KN-��R���i���z=H*�E�9�;75�"��;Ya
wp�c�����K����{#o�N���;��g���VN���j>P�>s�?b`���w��%��A�A(����d|�z��g��t!��k�f�l�པ���tǿE{tfSS�����+I@�r��'}5!J���B��гU���PEpI�w|(-Eѷ�ޞ\?дvP�_�Ϲ*�l�OF���z���P�������&�o���	\�5�p�?]$ 9A:��	�uEŜ_@e!!c�.�@9�ǉ����S������"M3^-�wSa*J���;5be��w~�p���a����\mߗ���}0IT�T�
��6<�9��vBi ��8'��h���$��62�����؜�����]}��jHg|P����U��8;�����(���.�|ڄٝ���lqz9H'k�����V�����Y9�����½�G��e��p��u�:���?��M���#,a*��;� m�E�=��K�W��;D̴�8
l��j��p�T
x�*;$C)��χ�+c%��<��`�-�]����|��\�	�e�ɤ<����19D5�:�;�Q�<�Ѯ��2���|R2���Z��qA�y#P�0�����Y�	��W//&������1�~s�)i$U=���_����ϯ�ĭu�\�^��f'T��u�m�`�5Q���Z������z(�ڟ H~�C��q��_�_(;��/E���HtK�P�	�Y���p���5<9<Y[�_�2UVH�C`W�=�(�qS�����93��xTÓ|S����Y����Y[Vm��QO��^)��v9�����CWb"*�.
�c�9�d����ڮ��1��9��?�>=MX �����_,շB�bw���������/b�4�]Z+�^γ���;;͚?���T��T�Cz������i��M�.`�0�D;�u�'�{�WX �J6K�쌷k��ȩ���l�i������s�_��%�t�)�@��
�u��J� �vy�\�5l�[��I�����|҂�=Sߛ"5�R���B�(	����ʈ��C2�wp�,�{>�	#�-/�� �E���o���ZY9d�9�ܐ=_��a�K���f�xS1Uj�:?��/��!��}�@� 1�������ȭj���A��Way��nv����\]���)�9l@t�0~c�/-���=[�Z�k�[bW�Em�t�"p�0���y�[#��~�ɷOf��V�P�]��f�Z��7	�գ���/�"2���Tdج�=�/N��ݗ��������l��ڟ���NK߆�i�?�=07��Yߏ�ۺ���p�'!ݲ�P�y+�����c��KVp��+8h ,�^�5��h��}Ѷ��ql�h�G�KDl��w+bvC�s�cY���מ}�qh�g�/�z��O�C*��VOC�Iq�^�kn��"}짨��Oo
4��>l����������	��^���� ����]����r���>m}ly�;�&L"�Ԁ bk�-��<X�V
 ���� {'�#Ɂ���~	]Y�ٷjo�N��ݾ�SWڳ�Wd��u���ء%d���6�hv�i��97�_��;�?Q]�;"�3��Լ�>0JY��c��p�x�ߤ�VB�����^N� Mv8�c��ɨ��O�y`���;��.�b�ۤ��6�3�N�f݉ߡY^�O
&��go������/�|i�)A��R��*�I�Ȳٗ3��P�%��F͸bO�G���+1Ӎ�}�c�4&������do����H��3�'>��!?�E�6��+�lj;ɽ��S��Ɖ�����o���g�� ��{}�7'>�<D~�m="i �aI���d�}�� ^�}�0^����i�I�^l�O���$�I��2�>��{7p��WR�݁H.��h�z/./~�.EBA�\���E�ZP����,!���3�}-��1�P�A�/P�����tV�5��هS*��թ�}A�e��[OkWp��b�N%���ծ )Gy��]�}:�E�(��#��L��S����vh��AL�y2>bWyLܙ��]�C!��`Ǯ�U@��v�x�D)7!�����+�"���|.�r��3���}�K���ۯQ�IR����L^zi�?��6��[���v�Ӝ$n�\?OD:��׾e-*Kp�?�&w���}ݞK�G���Ow]���Ru���ǿ����~�K�a�4��mY�ޟ�2e�`��/o�V�}?��+#�S�����a/I��e���r�WuRy�ߢ�r"�/_#�o-��Z�ܲZr���d������=~��3"#X��~Z��j���?َځ�Ӧ6=b��mh������n��&������"/�������Gr<�����}i���� #m��5��Sg��I��z�fF��I�`vuyn$H��skD���Ռ�B-�!��=N�͌�u��O��9����p0QZ��̉��a����Bb�q�Ď<qM�����H�m̂Vr,�`��]��=B$�Ʈ�)� ���g�k�s8Ǭq�?���r���_� /�� ��7��T����_�����a�C)ۯ���`��L]k�rh>>QH����jZ%���7I��j5�xվ�pn�IǞZM�}λ�O��B��(̒�z5�b�7�\.ú�rs�p�$�it����[��='�V;D���o�@d����_Av[�2�z]P�O�w�`��J粽��X�����@B��_�^ @�ފ�Rk<,E�'�u���-D<J��lӮ�_E [)_����!�U���x��K  9�  N��.�9U\�kNa�h�V���/$��j�����)#I�7��	�B�;�w��H-�V����$c�­����E�/�����C��O�p�a6����d��j	����V��> �]�X�Գ�� h�H�����Rϩ��گB��߇�a�b�y�<S�2�B������Is�O�����d��a�Ǡ����Zر�DP�m���Gޢ�E!a~�~��o���� ���]B� n��qN���>�����?(��cJ`>����R���ptRǺ���N�@
#\��%�LV��ر
_�@{�j��M��%�@ފ��Vo�oW�f|�r�S�?���G���zT���`k�1��玪$����A��U��`�}���rC��sƃ�y�Hǣ�I�5ME����ն���� 9��`���;��I��4�(�.�2\^�Q{�Z�RcBr}2�/�'�����ثS�����&�NZ�$�<N͆��Q��y�A*������.~H�����.;����@�G�$���ɮ�����Bb��/a� .vRT��
@t��D�cIh�y%�����ȑF�;h2��3eg�vN��HK�O�rc���[�7���Nt>��/�x\-[5�RMk���NӨ�}�����kGH��Z.f��L|Fs�FS�)#B՞��{�2?�������3�״"DD�|��c�(����q:��b��3b�-��������H��pnЄLi_�{u��J��O�����G��OFݸ��K�x����{ohu �8���9<�}��    `$2��8:RD�	*]����T��H�)�A����2�`��Z����!��%z�s�F�Y�0���!T�}��}bw�]Ȳ@��rB�����Q��J�'Km���;:��4&��!�V ���P6� 9a�ܿ�/-��۩�|��A�bwXZ��,&!3�VPܡX<j��_��h1d�2�O;�#���t!o�sCt�ۂz������>2^x�o
������Ce/v��ͩ�חڳ�r�K��W���o7���u�%���PI刚�9Z5B��AN�!���l��[-���8؜��G�$��fhj�-��ǡ� ��nޝx�^C�S��o럚��Y@��M��,�` ����;���>f<Wt�	;��?�p�"��s��'Z��ß8�fy�X�ި��r����<�+��J!~�gYCP�}~��~K,���q%3��va#�d}�OA���Iq�r��dZ��AMCǃ���@����1
#O
�J�Q>�4����]e"t�����������00��M���}��
K�M�g�W�����g}h�Pս^�BޖP�)T�U��~�%P �<cT
�S����<�t?�P������?�F�Q�9)Th�({`����;y�i��Ic��4�#��;���|�l�>���xޯ��oE&-d�̿K἟�%�f�Ki��z�s ؕ���y>�~%H��h�<< 2��B���V�'�z�p.J����	G	_B����b�%�~R�����F���C�%_�V�T|}��/����p[�];���$���ZAN�˩�׿��%�����('��,�2�w�~���"��,R`�2>�'��?ZO�bO����9�ou*eF�G.�
+k�''%hUʞf�T:�X���f�X/���`M�^W��,�!�Gu�b��L4Q;t�� M����\�?N?�/��KfN��}�OZؔ��^	�f���~�}����I�,b�>?^ǧˍ��*���I(��6~������x�N�nZ3�C.* H
��/�W_��\Z�T��t �^��g���lsց�g
{���Y�Z-B�7��e���Y���G���������������Rд��C/��H�;�ᑤ�I��N�YJJ���n���~R��}�9x�R����s�O�3�y�$L����~O:yܥ(f��<?���O�PE��bחe�� ����%/	M*8>�э`#�f��^r"���B��L%5�.��`6����Q�e��󣢘П�B՚2���?��I�в��j>y�i�6��h��UZ�T��-9��Ǵ!�����`Ba�������}n��p���DK
�z6���;�e���+ʑ�g�v_D�zVP���
#U�́�v�1��t�+��C�SBa����S,q��)vюoQ�ξ	@��7���oa�^��L�p�b� 8oGb��ځۜ�,�?� \#KJ]b�rM����R��a�����/A�������gv�!����z ��	��׿�����_S������������/E@<�������ѩz��?�� O���f�sFK�J���l��?���QWu�Ob����)v�i���4j���T>��ʧ������i;>ItjS�xN�k+����AF K#���E6i�)����n%�9�{"�&{�{0qx��.�ҡԆ���'�&���ǎ�O�?��>_d>�����8����t���Ty(:6��=�!���]�� ��Q֞ܿ�!�L}kjo��+L}�K� C�@�ݱɽ�)�m��(��%(8����� ����T�6��I�(?��->��k�OI��T���$���'xƧ���ݣ5˹q �8�������9׷���=�;��}�~v �_-5��$ͥ5;��Zo�S��t(d)B��&�o�}��=e{�~]���f1��Y8������y���:,ޡ�{�еTԲ�C�Q�T����Sqb�tLb
�3D�{2�!��1��!�f�~���q�r�W_4Q̛\|R?d�X�\����#��}@��"�=,�o�)|N O>śR��\k߆�)��H/E�kf�D�{���ݣ}D���A�ʾN��7�bI<V�ϧ�&���?�(�w�����2��~_�hN�3��$�N�:N˹���A1�_~���o_)�槒�j����8�aX(��B����3|��ki �]��?+���4?��.R���u����V�Rh/��9�%��������S���(���$_�|��L�C�.S-�Ex��x�"6Y�3��f�Έ����d�?v؏�4��6���@_{��p�o�X�>��:vǵ���UX@�}���&a.�z������m�u�Ϸ~i�+�s>Y{�y�r>�|>�p�lמ���.׏f&e�[�������O�r�������`�"�^�����ge�G��?u��!_�Y�~;�RsHe||_�|�}����Զ��[w���%9����d�]4q8���[�T�?E�D1Z�ƫ����K��6������ؑ�9R��񘋷�S������" �2��9����a8(MX|2#Hc����/��2�y�RN�%���(^л���©��s������O�c`H��,�}�fW��8�;�~����-�@4vO�?�6��x<�P^� �Dk��J�����C��ŅG����U��=��&���
����?x�y牸�������ۿ�JՒ�I������ʤ$U~|))��D�R �'b�@���&!pV%�Q@�G�/nވT���^��ʘJ����M���F�|?-o$}oީ��7��%f�	��ɐټ�B��Dj��oFP1,��aw,X� 4D��)zq�~�/|�V���N�bsT�����GS�Y�2|W;�kW���f/���7�^;m�,�C���}A�X�"�ɨ�Aڏa��crB�W�b�7=����������c���M$ԝ#�#�1�:�cq%.�k˹�����Z.(�P;{�!�z�i�%	%-����l�;�(?H�/5��d�+��L��{��շ,b��At AX�"����.|���3^z�&��v<d	���B�I�v�&7���!�RB�=���\O��cD�$c�~�X33��O
�1!��qD����L�� kǁ�H@�-���/�I��t�ɱ ��s;����sw�5A�������6�;�Ӻ�fۨG��a�	�l�n�x	<[�w7w��#���JD �����V�O{�W���бd�Y��zGvl<oJ����s3r7���A�\i�L;G��#��ݿ�`��QK~궳ۃ�>0���Ẃ���:6&�����;�}M�/��3��/x�J�w��9z�pU曣g��n��;{�ˌ9��([&k�^Y�>"�#�"���Ҕ�p�Ӭ����u�5�_�e��R���O�?��{�h�27�Z�#�!���m�K��-jV���	�u�<U�×Hq0���6㟛��9>B����#I?-Li���c��;~q���$����)b���V���o��+*\�<Vg�R� ����_K�i���Ӽ'=e�B�6W|}a�x�+/���(��z���e�t�_�#��/���|4�(����� ����<�sw|���=�����Ĺ�K�?����G��:b0^Y�}ޣ3E	���o}�[�w��Y9��^i_$�>���������;���w�Q���-��;qg�U�$�&�B��(_F�T\;�xp�:���H�L��];�yE��ܑd0>Z
!��v�8�-�y���h�����Ql�c�<�c,i1p��N�r�c�*9L��QtP���U6�����I���������"ٓ^Q�	 S�P� �+nYӅk�q�O�Y�3�Xi�Ly"�_��R��?J�P��b�#�F��	pu��f��)�ʟ�H����wt����(͊B�>OL�4�H�>��-� ����p���������wF.��3�R/�����]��s>̺�x���S�Ρ�9F�vz�r� u��    �7��F5�$�9~n���xW.�������E����rW�l��[��w��N�^������@}ˢ����w�/^��d�2�)i�`R�+�g��/������W5���¿E*�v��L����![���@S�����{�CAQ¬�\ke6ؕsXJ��S�B���E��:(�K�2�2Γ�Fz[��J2�-���t}�
��0��X2�7��V0�%;:��Rߘ�A���޿4� (����O$z~�Qr�8�[%۷��&ذ��'�U����7FI�K��a�*�iؒ��%��t7��\"��2CƧ6�Dp����"�Dm�$��� B"p�SfP>�}J��W�v�?����S�4����_ؒ��V̵�^���]BB$�ѝє� �F����ѵ�S��S�����V�Dʃ@�)��x؍�&GkOϫF��u+-�y��@&x�S_%Y�"�E��))��8��*����� <�l�O��a����ZL��i.�r���Ō���v�lwW��!w�B�&vj9����Fώ�9�M����뿴��y4C�H��G�;��^�� ��C�4acd��;��>ᑤhzF�}�1"���+�络/��R?�ŢZ�"z���/�1'�~�vO�$�FB/�[1w��x}�����������BC2J�4�;qQ`�'���GT��|vEh,�Ȩ��^o��ł�]����ũ�X_TV\{���Z-��Q�;�'���^�2��_b���R~�@^���kECåQ�Q��-F�"Hxe<��_�<�}�Q��Ș�C�*�'�/�/3*G?�.Ĩ��A���ޤ�j��Q� }��rƧ��6��W);ǉ��7~����7f;���m�3�"��s3g�S����θ��gȉ�$�vA�_sm;^�\�4�t�_�Ek�Z�V13��fK�t_�ɤ=�J�����$ۧ�F��SJz������ҸS���>��O�m8�}��L�Ȣ��	;�������g�N~ab���n��S� L���oL竮�g�dz<Y�E�G�#�Q
@3㸋��uR�Uv2�${ڠ#+����?M� ��_���i;���)����N�ˤ�ʻm˨�)��]��9ؓC�s�&��(�?�#�������K��\�@g��v���ܖ�r�pCŬ�����*������Y���v���R�Rt�����3R������o�)I�+�h��p}���@ٮ�K| !w�?,�Ͼ7D[�sk7.��^����C'���_rf�_\y�v�'������*?�\�>���F��a5O
�y��q�x#Ǘj��Ƽ�����SH�#�dE
V&˥s�<_�]�7P�=�<�VNq�߽��q�hA�z� ؙ߷P��>V~Y�H��˻��tx`�I���Hz�'%�˄a��ly�2���R�;����v5�7A����`#1��K�D�@3O���
��y�ޡ5��������-/�+�"�fN2��z�o�7���Ics~M܎8���劎{��~q�q�d6+Z����f��u|���k�B���\ɖ�#���s�c;_4P����ό!���f+�77IT[�{}��i�L�o��F���Ӳ
�䣉��I����2�j���������l_��ݩ���I5I��7�k禈�-��̪l�����N"?G9vq�g|�P��~�/*�3޵ z1��"�q�O;�9-�l���Y$����L�N��t��>�����T�.v�4�B䡻���|h��).����e��e��!��r>>S%%�c	�/���i�!���_�XA!ؕ�(}���]����Zbn�Y��H�q�Y��r��c�Uo̊���9v�R�G��im��1e�hv����|����5�������}ѩ�

���x�y��-[A�O��_���_~�Ï�ҫe�"����(�����;��A�����.�?�n����W�Q�;tpt(.����F "ώ�!�E
�D|9��V6E*�KW� �vU�k�ɮ� ���Q;��T��й/70�2�8���0��#b�3m�=�r��Ǟ�Pte�S[9��t	����3,Z=�����$�k?��

����b�����	�fDH�������q隗>U�����֩�w���x��d�Ƶv -]�����������N�b�S�M$�ɷt�d 
6� 9��&�/t������C/g|1�f�<y�n��H�]9��8�|a4g<:d�ؗ�(��	���B�C�W$6^��O2��})�YϚ�I��_ɹ����] �!���{�i[��{}���6Ԝ֎[.�����GJ�%�{�Q��EW)t��#���vY{;�Ϟ`C4�:��|�+K���"�z�)��y����0^?���i��H��Z0_;O��N�n?D�~�7��f�=X5����� �˽ t�zbwۑ_�k0��룼��>sM�~�\#=
p�|�#��[)��x��!O�1��|"���^���6���I��8��v1
,]���n�Yǫ%��q�[�s�qCO�vڊ?9І2�+�C����/� ��J�';��/�fz��C�ל"o<;:[M�mkǮR<�%:�fVRH��?����\Ͼ2zy���_9S�N��>���%���!���81)g`Ww	�pyf�h�^�TC����B���9!�#s�bwx��e�:�"�\�2U;K�{�>Uj�¶�a��[�xǧ�1ձt%g�`R�<{}��B���Sl[w��]X(�"$��mK�������c{R�_
ɵ?)�}���b;�6�׊n�"e<)Er���.=���6�����D�K�!��E ����PH!a���DqO�盨ߋ��5�����P�[�t}��z��c�p>˖�9 �Ɋ��D���S(����}�W�x~o�VR��$}[ȥP,�I�بS�z}?5���@������{��*&����NO�'������{��D�շJF2�Y��i~���]�B�P����4�H�W�>�3��=���/�6S���lK0�Ff(����ދ�g�Պ��~u �UR1�'�S.�{x
޵���фM(ߟu�N�x���>�� DAR�B��r�uL�ܬ?��vg��@�49 ������y��󎇣q�m����ּڵ��櫡��cc�r5�#��;5�.Mh��FNp�a���Z�� ����E4��S�G��r �\8m��v�)�Q=쿽g���{=߷����Ut�͟ӊ|��^�q�}Q�|q(�W���8��-�O$`��dS��Q�&H&j��%V?���1a�Ե>�~�� ���5%2�\���'a�P? }��ғNA$w�Vm�<R*7��=��G�';���s5D�Ғ-vdw�C�r�0Ȕ�G����N@P-����b����;����)�;)`4L�I�e�d��|��!l	i��4$Z�^��,��c��8{��%��x��LC@_Y������ vi��<4��,8��`H$���G��g�*鴽���W�t5G�����S"�P�F5��W��G�H&�>��.�{��u�
#nob����9%vӆa�~��Y/���a���?$���K7�ϥoX�}똊_n�x�n<|�����+��Zh�����G�*�~�(��1� 8�	�X���}���N�4-�E�
�׮����3��P�O�O4��H�6�������_�� vR�SQr�g�	V��b����Y9�)0��2^S�jϾy���bV�d9����z���-v�J9�?��у�\�G��!m��}rv/!vάÏ˺�o{�c�|��Gԥ��4�]�Z�|S�R�ɔJ�<��/U�5 �<�������7�>��8)3?a�#Fə*.����S�iCZ�Jb����� �څ�HZn�r���"R{��|`�*Ld�7C��lw}�L@�9�v��Pb���8����p��`(}�|Џ�����ɸ>�<�x�G�!���r�j�����6�V�ܮY?5��@��QV��kt}\xB���T-���=�Wu;gL���EL��z�	xu;?��p������k1�k�uC �  `f��OB(M���)�zr>�PSM۸�+�;=�2Ku� ����9���.v_t40�g~��$e��C��Zlx�~_�&(��t�/T�Y"����G�q�����S���(Z?�/��_j��|���A�|W��(6O9���C�@������̏J��+�c��O���?By�TJ�|Ԩ���r�x\�JfY��7�dǂ�4p�+�e�%������x{�C������:0�ݙ�\��B�y��*u�P���}Hh��ɝ�򾋴�ɬH�p��|�w�ٴ�s��l˿v��3�b?����C@�52v��қ����G�~��ojmP�׎<�!���$d������ݵv������񃻎��~�Q��> o_�~M���eD4�}��F���Q�4���N�_e��C�E6|,���qz��>X����a����"K��1�Iy��P�k�H@� I_[�󌿉��i-���;Њ%����%�G��?~�~�۾o�]5���������6(��i���mwپ�ò�����cj5v�Ok������Nɱ�$�u�_x���K�_�Q�I(��K1���M���3�rm��l�����o��;ґ[�pFh�?x޽e�ܑ
0��ʧ!c��Y+Ƀ���Y������\U���?�W�l��v��'�G_��3���/�=7��_����O�ۘ�"~ŏ�wަB"�������Xn!H�m��X��������������졐X	sp\���S�_>������L��Z��5��ٰ
�9��V���;C_�����42���<��SX��������*=r�:� ���D���]�c�ë?CdDp�v��]~x��|� ���fw����m�#�A�s�'�7YrV�G��	�e<n���pƓ��|����I�|��ȩ�����ˏ?���z4s�      7   5   x3�,JMQ@\F���99��\ƜI9����

\&��E��yh�\1z\\\ lH      8   p   xE�K
�0D��],�_������Ml%���!�<6�����$;' ���������	ٚL���9&u�P�1�k�f�I]'tsLˍ�Ҽ�~n��!����H��ιE5�      9   !   x3��M,��L�2��--�H��I����� ^r�      :     xU��n�0���S�	&���J%�@S=�bhUBۤ�ao����|�"�/��
�F�Oæ@Y��J�,��J$\�a�԰�K}��"\A.o�N���k�I�U��Q�w��zi�Q)�ٜÎ����|Gf���5�MK�� ���K�u��������E��q֓%�&��"rlE=u�ېN��m� 1)���	\��YN��W�El�0�1��%\l����u�r���>\~{�edl���EOgN��)g
&dT���H`��d#��'~�!�퍃/      ;   =  xU�Kn�@D׭���|� ^g�$�`K4	R�>�U2Y��?�8d��ǪJ���ϧ�Y��qSC�iLǷ�|hl�Uw6Kzk��ޖqOM�-Z��Vq&{g*v��Րm^ܰ�j��4����Ʈ*;���ڛ�~;H����ϕ�^`k�}O�Y���6��h@c78{�AFȽiz�����(��.�.y�/����+��Uқ�Fx3�E�S�i2�)A]Nu�$?�k~o/�iQ�Ѯ�����=?9])� S�S�_�Se�T�𵜳	��ዅt�Pۧ���������|7�����+��˛�x�� ��ώ�8`���5.�Rh �P@U;�y�~�E҃7χr�-����x�5�����,HTe�VM�Z��K �� U�:�!���R0�@U��zߧ_��;�Io�E��',\��Oe�[u����P?�'|���`����'��	�+=2�:Z6814Z��-ł��h�e�
-*PG�#P��XPA2Г��B�
Ԭ T������e�������$��.�.�ʮ�]�ή��O�/��(������W�F�:��b0�T      k      x��]sGs���_��\٪�������Zv���J�U��#F�%�*PHJ�>��� 
�Y���� =ݧO����m�^�nw����������g�˧�W�_�n�o���_�n���|���;y��/+�r�[��fe�JH�D����W����8�� �$�61�,M�b�vM.2�i�b���K�P|��}��!{:	1�4u����fP���腑٩����K����W!�o�����B!�:TW���r��m7���];��ݕ^���W�7�ѻN~���N+o��+�2W�崓evU,�h7d�E��*���Jt{��B��v�f��b�QK;�Q/gW�y,ϯ;�>������+���6W���/˛����t����__~��_�o7Օ񻎬��*����Eq)R�xf���5.��64��Q�R�1RL~��q�i��r�[7r�_����h������0��q���ƺ���+�g��E�G!�ڵ�|{��j���v{���۹�.5~����|�����4��3�r��%Ό=ɃS8F�a�ΐ�eO��\L��cqY29��J�;�rvEU�äY=�n���)|i��v?F����|X2F��q��͞UZ�0�����t��dL'��U�.����w.���0����\�I��?�)!�a�?_򣜒�t�|���J��0�i!�Z�
7�_kj|����ÜO3���s{{�RC
�y����'����E����r/��RH��h���V{G�};L@#�(��v��O)�=7���b�J�R��9���z�~�����T��f��?�8sAlU3Cڵ꙱���r��-������������z���OG;yy�K�L_����aJR�vH�:����a�!�(��ϳ�!Q'岯7�S����c�+E�8q�?����V_/(d���]˸��_��ﺯ�]�?�7�qy
{���L#��^�4B��d9���h>��Q�j5��\aM�A(�vL�U`�|j���f32Nv�P��#-ޏ�z7ZG�N���/������@�pkkW����՗�+N_u_�?o��;H�6?�?�7o��ժ��gFt��_��
�K$Q��K�UN �d���D�a���J�t��(�>�ɌP�V��	b"��IEk���n���,q٨�4�V���oAJ�������߷_;Pv_�_�]��c�	��~l�b�|&�8d��ʵ���4�F�q��`��2��8���q�
$-��f1�S�݇"d�LA�c�/Ʉ ���Ԥ��XZ\_��ȗK���ʬ�����~w���n�nw��aao�>nw�w���_������?\�o�<�rlg+���9��/�J�2�Î��5R�Fũ� ��R�t�S�\��%[�%�Z��Bi�`Ѿ۽�)1&���c)��,ܮ����G�~����$u>V_��_[��Q��_{\�$���x�A�n��D�:��/%�^9x�#�_�L�G���ZkV,��~W2�~٘���D;v�7FM!	��BN]C�v�G`�a29X��� ����S��ge�ƽ�"��?�'��ݛ~�d��OT���#���o~��Hx��Z����wD�ә�"��yK���>���9���]��i.�S)e���q�#Z"3��i�ɇ8yGo�Zy	d�GJ�{+�=]Ĺc�g�D�>�$�l�L���8@Q��.P8kj|�����T�d}�R�YO�f��20��Ng�sX�V��C�v�4��>:7�<�J����?��%5Z�-��0�^}eΖ���u
�C���M���r�y���I���92w� .]�g����q.�A���pR#i�D����B�G��jv�]$1���H<����C�D��2]a�Uqv0����a�`C�}i�/�������5�^ ���\�}	i�p���ן�n�>����$9�ݗ��%��7$��G�wmq�_5lU���Z�����.3��F�v�Ť��$�z�U@=H�X���9fg�,0=^���H��5��4����5G:���E���z�|<9T{�ҟ��J"L���/}�3g5�~r����o?U����pXw�Z�Ϝ�7kZM����4�zn�BW@�2vQ-���Ъ"C�j�e�;� �@���T�j�pd���2y�neL���[�*�����zν�9�/�,v_�q���}�|����K�8��k]���q������������n��>~���yn>n[���0Ny���+(s�8U�"��򌮔��=L=�%M�P;*���)��:Jݟ���_G=	1:��B��$������vG���U�֌���������;��w����������[�q�"_�ޑ/��yv�π��� ��3:H�3����
�@拥8�)����b� 3"�\\ɽ!:��4��t�&���Ȥ���K���M�Pv]���~��+���/ۛ�O���#�#r����v�`���v�Bwc���.PK/��B��bz^���<~(%���{<�AH�2 ����zЉ���Ŏ`]�4�%����������ʪZW��S���y*0g�~�џ���M4�,��6<3 Qp�w��&B����m��i�\��bk�z�D�jG��\�b�A�-������S6���1��H_O�>sx�=[C��]����ĩeR8	>����t��W	��n�q#��>��W/���D��@�~�y��E�~*��QV4L�-�3H�3Erf
B��w�m�5��e�������ޙح'��9}lg8��*t_��'Tη?���g@��R�5���f�'���@��f���Xc���3㗠`R��⥣,���@�z��-Cp(ܵ4h�;Wi����D�b��=
��4�q��h�갯��ow�mY��1�<÷������TP��`m�a�k�x¿l~�����W
�f���=з������vwG���'.��ӳ�� �����Ƴ�f�ٗAk&!d8��]��tE�����t���I�o�v)Qf�t������Ae�ؙ�Z����ٗz��b`�$��
���2J�#s;˄B�t@���\�o潋]�(]����y�ؼ>�¬ƛ��/}��X�n͒�k�Vo�n��}����E&;v��A��g�v4/�޲cEm��'�c5����K�"�+�71���!���n��͔*��)� �@~4~M3��Y�!U�4"?�bճ��V ���:�j'=O�_���O�x׾�Y�9�C�9֛�����"S����/Y��[��y!w���b�k&Rc��Ȭ�#��<�z��H� skqɭz�qB�n�W�}!�m�c�D�.tT����0Lr�kB���,.����^�- "q�v{������pf.8G���ԛ{1l�DU�Һ��ٛ�@��Ɛ���@jǑȣDu���b�(�@�L���^�@���O�.#c:؉O�D���D�C���������-*v�D"ά�6e{s���h�����3�R�d?�k~÷�4g20W���κF�x�B��]81��^w�I�t�L9��-M��ʉ��	��2�x�i�s�r�!�K8z>��'�?��ZҼC&LBP��x{ǐ�M�&���`�r��\�;~?��JJ�������sv&��T�vl��3*�h����������`"joBl�����|�L���8p�rS�r}���4
~i���\(nW�I��hU���N���I�ѝ�\z�܊3�v*(X�Bkz�u�Y�K,=�3�h��ᦦ|V{.\����H{������nG���X"�Q���;��,�d�V�aK����'�?D�\�T���g����8s���a���Ѵ��o�6�i�m�	�@G��i�8;���e�b�dx4�q�&xǹ��>w�wcDc���`�Ks��ž��f2�yr��j~��Z�M��/B��=�z��W����)d�玤g�'�D���U�/H�s�괌��5��l�@Q���4�& �`珞�5��I3�9���/���E��p��"t�=� �	�S�糑��Ý�!T�~���&������^ a��:ܡo�����
�(��723v�;ʆj����s��N'dM�.n΃�3��L=�]��n�~��q o  *��6��e#���%�8�%L���#��4v����`� e�JXs���m�4�PέG���k%4!�G3mN�K��qgG��'�A%:�ݛ'��پ�h������CI$Bj;�b?&� �~��n@�+h�t��Q�,���Z0-�J��t�'�g��E���K͠Y�a�n���1Bs���}�'�ƙ����W���������̴\���o���Ds&�(W_6/����2�q�\W��s����x�g��Yt��[˴��؛���_�4pQ�c��u��y��������_I����X��@��s����[����s���g�/���,j?���O0��bg�`�Ɯ�ǚ	9I���i̱��iD榥�-v�]��ۋ�ץ�.��b���v���3�2�?z���"S>�f�Is.�;D�e��~3����މy�O�Oj.�Xk�|fJA��%o0o�Id��M#����\���u;C4� 8�;Z��v��}JМ���B;̝��|-��N�:������������R)��3ݱ3�q���^�B�,��w�yr����쑧��=rl����K�Ȃ��n�J,w.��0x�[�ءG���Fn�d�lZ�z��ٹ�*�j̤m��O�(@����`�z.	�U=y`��)S�J��=����-0���[ϱx�<q�s�٬pS�4���E���s9�HS�Z�DVȳ��J�,�Ƥ�`D-�0�� �r��K��Y�>�q^8�N��4����4���9�_�a��X˸��9�\�����������?jy^�}���~ggڡ:#r#d.0��m����z$e�3
�6S�6p}p�\pmպ�Թ�Ü�Q�Jq�B�~�ѐ��RF����_����>��_�׫�z��N$o      <   �  x]�Ir#1��c&����#�������@�>8��6������m����{H�_���������u�9�x~���w�$�
YT5$��4�3�n�˄��.��5�!3B�6���髭2.Z#4ҀӔd5%a�λa�T�%�렄��4���%�\����\�C�FRsic�����s��]G$8u�������pd�$d(!C���,V�B+'D۱!Ț�h%i#�/a�*b����� ���H��DT(Rf��='���8�;Q�U�U�Y�M��O��l��Eg���v��oR�9M&K���1�#U�h4�%n�(��&��a=HK٩m�%`���R��AJbh�aT�P��AJi�,��
��/��K�:7�#�(�N�=�vQ ��1)6nZ����
�C��]x��"���v_E�&�4����A�J��;)��z��Õ�:�{��Y�d̨�K���������Ҥm�*X�y|G�\㾄5��ߖ�A{���т��{��I��H���	�<�-[���3��s���f�k@��
M����@Gk4&����8��=fV��JBt�a��Ǩ�l�����HW�]�ͩǢ���@*<T�V���Ѯ���m�$��c����O�d)��UBK	ن�	*�eBZ��t�k<�q,�����Ux��&�Y�j�-?��?����      =   �  x�Z�RG}^�b~ T�{�L�$a��v����P�lR�����a�
��@����Gґ�o�L��c�[���%��.|-8��^�,���0��ժ�_ܶ�{܍��z�Z���_8�(���9@q�l��]���@-/:>$|PlqŘ<�U9ȹ6:~T��
�m��b���0N�n��'!V"9(�0T�zf�C�6���[�ã(�cE�Jy�U\)��A�8�����Ů`�\|b�D$��8�?'2�a8�����>On��-�:9V�$��.��)Z�����r����m��s�~Vi+Ƈ�a��F�#����t�{�� e��*p��	�� W�������.��jې�Pe�B����P>�c�hP9�U���,�^Y�|5��*��.%��a���{2H�J��,�IJ�m�A�JU8���*P��9q��ш\E�D���P٪{7�
�U�2@y&X�p���<�\�}�A��m�K�X*2T(�l���
�J�HP��0-�bz��	~��*i �?A&Qe�L4����o��<u�o�C{�F�Tm�D(���
LZ�8��ƫp�9�iV��+���+*j� V��L�R�탒m�2���z���aZA!e��*dP5V�*j�Qs%�s�7�2����
���4�4���"c%SQ����ͻؼ��2(�vN�J�$B�敧	����	�2 �<V9DK�Z=t_``Y��-��F@RD���Ad �
�hI�T�8FUR�h{�㴇$5^��Gs��d��>7z#�{���u�]Vk����Ѡ� �b�& (籊��g'.�3��;(]�*�v�g�--�9ۓ�ڽ��+�T�8��e��֊&V0���P?��j�����#��`J�.x�-�^�v\`���r���aں���ܔrt0�Z��ޅ0D�O�13Yk��'�4v�ܟc�?�
�`�R��7����c�y�͋���DcE��)}L�N�c��;��'N<A�87~�y�U�I��ux_�㿂��2�6���@5�PGl�L���yg���tOv)��P����	Y��na�;�\KѦ�8��Pu\�Y�2�j{ C�T�*��}�TQb^�zE��d(P�a��N�_5K'�9��l	�5:��X� �4���L�
�UU}4QP��4}�&J�(w�-���EɪI5�(�˗:Mp��H5�)"YPh�@�BR�*Eib;�=��v��"�Z�b%C��@�0M��J�� �8'Lb�E���Uy�q	�� ���ǋ���ۼ:���cw�&/`�:���<�I��me���(k��	�_ѡ V��P�>�(E���#�F��U�D�fS��L^�n?T�Aȏ���X�쵖��ox���BTM�>�Ri���4A��iYE-Q��BU��f?.YK��D�N_	���o�El��M���ho? ���U$B5�"�ۏf�F��W�^��3`�N{e�������;X�(�ADQ*���q�PE�IZ�㓛��8�U'qP@�b���N�v`�o�wn���m	�_ѣ)U0!��9=Ȫ
9v�����*좡K���R�N�bE��Н3���IC�G ���/~���� �D�GK�� �<�K���'�)�� s�K� ��A��s�0M�=3�.�"g�-�8p��zOQ	P� ÷󳳳���      >   y  xMR�n�0=O�b>��l�@�-�Z�ЅJ\���,�&Q��wL�"G�,�m�X	9��,V)9�?H ������Lw"\hw�%�d"u��c��(j�P�/�@%ᛣ�¯�n�)�4�$H�iB�Rw�������:��(P4\o��.Hd�������Q��J�:uE;���P�R��bs��@&W�4$��?7Pʩ��.a@�&,�߁�Q9�<@��RBq ����v?��ť/*��� �c���8@����*�[����K��W e��J� 㟈��$.�cp�kZ�g>mr��� ��ۃv�Mz�Ɠ�'�L~��Z��f W�t��rD���=+���G�ݝt�Ӎ5|3������cLb�����/G	04�h�E�?H���      ?   H  xM�A�7Dѵ�0v�=�a�@�?���*Եq�H'�
�9:��x<������]o:ο��x~��������h�볊���ǟ�f�1��B����ƿn�}�:�������@\��~R������:��6�����5�������+e�x����p��b�v(ZJ�r4��p�Z��W�����Y�^',k����dB*����W~�Rp�p���e�v	���>�s�������Ԇ��Zy�5��bǐc�w����1.p��;r�x�2�*�A��J����6�J�\
����^���B�+?{_U܍<n��������#4�a�X���d���`9�'�g�����v��ɍdܕ���Y�2��𺚐�|�j�E#M�Ë&s�/�+N�Y�U$��4�
�v3r���v3����G��������a!��`leh%���Nȅ<�����\�ȅ\+;x�����({����vٯ���36��)ܿ�n����N.��徿q�#��k�=��q�#k��}���S�Wf��z�/G7]\7��,ٱ�$�Ah�v��t�{��'%/��c��#���������&����:�6��Q?�:��ĥ�l޹�[H��u7p�º�卹��B��B.2�BpM�l�>lF!ـb$a�p��ג���{~�6�a��3��Z��-%C%�%���������gy��A.�7��'C�j�׿��ǲ����#��`:ܤ`y�^�\4�ב�Y?:G��І9�[�X�`w-�j!c.d���zF��#g��rg�=vO��F����~����i&�fh���1���xuZ]��Jk�����(e�K_���+n��ܟz�*��&��9�5�Lg�Ih$F	���z\���[9�~_�gX8ߍuqF�����FB�̹~p!��q������8��\��1�7��Bθ��TM1k*�T�"އ��gW��m��2�츊#�=\ʰ�kl��Ұf�5����z1*mu��Ɩll�=9�ve��p��@X�8
��#+%��o�f���ϣP�B
�˼Tg%����uu���:�:��`��epd���?�|}}�5�q�      @   �  x=�7r�@��cTX�<R�P�X�������0͋�@��>>����������~�g�_�;|���$��;����s8��7�q�;����y��a����m�t������zk�_Q��G�����غŮ+��5�/��W<��Ov�����fw����rw=���]��u��dNI��\��3�?��ޓ�{{Ob�)v}�눭O���SŜ������]b�{��>��}ć�F���93w}����@'w܁�~���]��C�zd�~�wr���;���F1W�&�s-�!��eN�=_������ͻ
ꊭs{�s�w�+�#����ܛ�����ѵ�������Ol�b/�m����x?��8��/���&�C������'�S�}ܫl��Z�K�.K��E�#�$���ceo����OЏx]��e�T�!L      A   J  xE��u1C��*\A�j$��\D��#�_��	�����{|~�ׯx��^�ƃ�k��X�Qa�o�A���ܥ: h]�t�$w*ޤB���x��!N�J7�!���~w;�] v�x9��!����AC�(�}~��9����^�e6���NL����0m�{��}pV�=�V��dCGbm��`�PA�l�nF���7d7�F�! ��E6�EB<^�M��ӄ����YPiЃ�4�����o<���Ƀ4^v_�O<�.H�+��]�]eh�����k��,h"h���1���
���!�x������^�x�A��-e��=r	�[B{Ȧ+ćo��@����W9�,[��~6Ei/�(�f�xx�E�Ȕ�"^A|&�H�»!�@�ޫ��Bb7V眐s&�E��'�rN����d'& i�J8�C������ 5S�DS�t���5�L�2<M �OI��"�9��I8��9��Z���"�h�Ľ�Յ��[%�zMH	�ʲuO�#�(��خ_d�r.r�b�g�y�m�K����Ba�>�
Cn~6)���THZ�hi\�N���r��XBF��l��$x�!��
�.�T<�$l�g�x�$�d�I���Bv��8���ă$�� ���s]H�����J6iO��"xJB��)��I�k >��c٠�*w��A{-���K�����Jn~���0����.�7��6�+i���z�	_4:���p��1j�w�x� �����}��::ha�B�^�]1)h;�J�e���ă�%x:�X�5~�e �������z��G��      B      x����� � �      C   m   x5�K�0е�0���0�P�>a���:f�43N��׶��4�M��-��E=n�;���0���A��Is�E�#�Y�M�0��N=��ٳ�՝=�Ǉ�G�Gcf��8      D   X  x�\�n�]�_q F�Kǆ�,������bZe���9=ݧz(^rF3E��m@���z�:U=�\.�7?�.o�f�q�z�m
��7֘o|*	��Û_>���������Ç?���]����وo��"ʛ���]ʵ:c7E�.*�!�@��s�CT�ZM�S��C����o���#���!*�A)�\��b%7E����.�������o�
]+تcj����P���E�WT��9�L��vQ%�Mqau���ﮟ.ﮏ�>�y��?\~����<`�,̒�/�����c�Ԫ](n��s-p�Ts�L�6ؒV����(*�q�Ɇ��V)�������]���_E�*Yo\�w�R�&&8�3[�ּ�����E�w�
,��w%Q�٘a�mgt=p�1;���\Z!M(?�*[s^���s�S�sg�V1HQz��A�sJ��H2&�jL��W��b�᏷ŌL����EW�/�����Z!lZ$���.ڌ#?b�0\Ԛ��s���lq�!�������+(��9y��V) ���)�u�
��.�^�ܮw�a��3Z]+om>����m�]0�x�ۊ������S�6�v�ݙ!�p�fﳋ��Es5��\�7����>\ŭPq���3hdQj5�
e�!�� .ZC@�nw8G���"�E�Z#�êL���j8�^��bGIM5��m�8C+��O.��U?�Ng��:Hʬ��@j�(__��3�0��
3�X��8�0�sƙ����,ZcB�(}�V%�j��B���������W�����Q
g�ˢ�uׅZ�hawg�"���j�`b��>�R�)�"���i+f��w�Gn0�����0��D���i�(B�_"�L��.j���� _(�e��W �'.z�VC���<��V���W�%W�= ]3!��!�[�|]Z��npU,��Zi �avo�(=o׀�C+E��z��, �R�/!Ok���bph�U`��$3Di/�JQ�(��I�{�,�'�������_~zZ�i+�F�x��aEY�9A�#����M�˄Bu&S4��a��~�jx��NԊ]�P�Bu�42EM[F2�o��y��!��V}�wv@~���;�L����z��9�`+X��,JQ��
��ݓ)rPd�vG/�H� �y����7 A ʻ����4m�˄�P{��۟����Q+�t_�Ae́}Ҙ4$������^�	�����띈"�R5�ͪ��v�j�T4!x'�}ј�e��g=N�n���>��`�_�����)oTg�J�_p�tђj�>���$�$02���y�`�r�e�_y��$��RTN�"���-mE�* 9��H&�qB�Tq�������V
<oP(�	yh��EE+i-w�η�78[� �##A��Ek�h�wߠ���l5�".����w�	���j�oe��Y���(�b��h���/j�A� �l��Z���IF�bf@Co�Á�V>�Rkeco��Y��W��x��/M��}��ָh���	�f,z����xC���͞p��mz1���ø]�:�!�(�'���A�Q�~� �*t^#�)dQъ�ɉ΋e�<�$Zɸ��N�BA�!�f8���H輷33��y@��j��Nڰ�P�e�_�(�qA���y���a�B��K�9mv2�.J��wp� 7x^m�@��V���̀���������
S ъ�Â`O�E�#��.�c��v��ѷ��5֝%5�m]����P�A!��4�������5&�#�	�~�]���s<8�E����V
uP�ҫ�
�A�:_�8
�%E)@5p��S��|���ĉ�z���Y�́ҷE���.����

�>l���(�<��5U�J�LPS�q�!�_B � 5�^��v���j�c�� G6��R��v�V�1�4XS�B� 0l��|�1̮�d����2P�|��b|I@b�mی.n����"͞η�M��f��꼋��������yaװ ��=r�+�Z����*�h[Z�Xk����E��lG[�Ě�k�V0x��7{g���`�ۊ�LLJ�`�1$ګ՜Zb��օ� m����#!0���J �W����V֖V�+������� �bX��3`��c�}�lß� �>3��j�؉�3�A�dl>m$ճh[�8JG�
~E����"P\l�wc|��t��7�mа&D\��s��`�F�`�]lE�?�-1�� �&Bi���89 c��Xv�V4���bc�2Ir�0b|V�2�a+j5�z	t{藇���f��J2����TH�*��΀Q�C�J2�E�V*��cp�� 3`���F�o��(.K�b�۹�7���`<�aK.�RQ�������j2ۈ�-"�Rr��!vj��p��]zNB|ı�Vt��Y��R ۴��C)(��:b+��p��L{mE,z�a�hEP���A,*��d���}���|4�؇mյj�k�|��$ԫ8�1�`+p.Ķ�g���oL0 ,�.���]�h5*�]��mh�z�t��XT�����vv��	:�RH�r���x�B��/��'CQ
�E)�v�~�#�o�^[�xa��V�RA{�	 ���,���(J�ǡ�$�c�x�� /�lD
[��3�¸�Z)��"�<�@Q
���}5b&���j�nz���x_6`��d@�1+����59P�z�Q��U�����'�* H%��a[���@2�E턵"����(�ϵ���j�����R:��!�B���3g�`p�4��=N�tZD��u�m��78[��sj�e�sg[�>���R:�Zzg�	��W
eB�:�E�V�@�=ᖰ&ٖ���Z�(��Y0ٽ�q��pf�۸���;S��_��AYXp9��Gۂ�M]&�^����t�YD�p�:��mj�Ex͝ ��y�k$��Į��'c�߯4�Q��>��b��,!Y���W`+����Eo�=�Nh�$��"
\#γ|7b���xt�(�i������=�g��
�t#g<�nt�/��S҉�Hf�C$G��(� >
 G�;�Kf�xc�������U����w��܏��W�����BQ�_��j���R �<����a�N����VNϯ���t�(�+�*J�uZ�ن���3�˄�F�kz;Ɂ�t�hu����U�{t�NQ
2D���p>_R�h0!��Bo1�K��8��[�����YR_��
�6m��ۗ21���3zj���9�Н��	|�@:�30��a����̢* r1��ĄtlLN�E+ߝA3��m��a1���t�U��J�������"J1��7&;�/&�~/�}���6D�Tѯt�pS,y
vx�O�tZ���:`{9�Nu�Z���nv��ϴK]+���a�� 3��uJ���V�3��vg���$�H[�� {h��fW�W:Hf�+:��j�j��*�j�!��rw����V����;g�S�2s�C:-�t
}�jt^x�p�"4����VOO��V����$�m��>OGwQ�������C��I�A�nb�J���TA}]+�^n�I�E�Nu^����(��GB]+uxyX�A��[�ҁ��(��B��p��o? ��Q;>���[۵�_����������R۽      E   !   x2003��4400�
s�8-@�=... W       F      x����� � �      G      x����� � �      H   �  x�Y9�7��@7.S�l��2�CՕ�5=l���FGlF�Wb~�Ծ������GI9��r���K��>���i�3+$�>�F;����0�iJΔ��<�� *r�V�8o�	9w�>{������Q��
����I�e6�a�p6��P�<r7F�y����lґ�����@)�7�h�6z�X
����j�QV�hNOw�#OXiE�� ���I ���͔��hD2����������E��o��@�Փ  ���PB�UԐ1��ڢ�1�d�,�dX�&�3�b�#X4|�&h��N�O��,�ر�0u	���U*��݃�� �z3����P��)C6E���2�xT�RPBi��[���p��;4dEG��l�@"u�7YVC ��#�/Uf�m:�]����jL�N 1㠱]��� bi~��2��$y�f)�������cq;�	�tM�G1w�HSsCy�JȁJ���޴"_� Ͱ�<=MvIPC#�NêU&k�q��o+�e��U��*��."c���Hob�$_g�t����%�#��<�X{�D�w��������5Z1�Ȏ��|X��ıڳAJ��^Y���w/���Wׁ�E�o�B���/�\B�r ��R��l�ڼ����& �hk1N[1$�Zǐ��՜\CWtekU�q��g�ge�K���)u)PB��b�]�a�K/�m)6J��5�$D���K�=`]Tk��0rzi�,M �X
 ��|S�$X7�ee��5D�(=��-�aM=��1������D���D� EX�i�"J9,��0�M�Rud���E�BHoR\.橏m9�U���_"gR։F�-E�_�#E-�{���+��iI6�c��,3���CU[�J�q1�i�C�q;QX���i	����C�����6��k0j�Q�ٖ��fĢpG�Y�0��k?X����'�"$�q�hЖL��ps��
 �b"��-�K�}���"%$fuFX+~ʠ���s���,�HQD L4ȸ&1���AX��G��ـ��|�t/�!�^}�W�ßtAu����ȃ�)eASil 1Z�QRҙo�9o�������j�s؆I�~b��ذ�s�z�"%��-p%ͮ��'�5��ԟ ��e<�4s됧�=���ۀ� �e�l �4Unt=8�!u�^;�(`�t9�П b���bsS~��!D�b�d����%ծq��d�(D_YM��t�_�	�C1���Ӟ<��uȎ�� 䶰ܶqJ+^�L�����)w�2�2�N!��AG;��	"���bb����Q�y�Y��?�PQp��� B)�m��ƴW�q��K:��
g�^�C��R��q��cO͕��J�<���X� [r�N���P+�H������@pfق\�C�b�]s6H�Chn�� �����-��=��!,�8tj���Rb�z@hn���J+�L4��h�(�j�3�|A�+W�ߊ����]��R���FM o��P�L��������u+�      I     xE�ɑ�0߂�`cp�が��v�2ƾ:GWU�S���|�Uک��AmW����_e�;����<�~O��*0�Rm�{]ų���!��Ej�=`�';�To�b_@%@�o@� ��'�o�Ε��t��#ɾ/:R@�&~G��*e �6������t��b* 6HU5%Δj���{�7q�+ -�;���oKJ\5֝$�v�ωi��J�x�n�����-_[<0q� ���F�a���˩����#,x ^�^pƿ+��|=�I�q�B�%u�WW B���aA��0ZV��E�+�p�0(X����7�,�H�r��v:ɑ(�~��> �ܲOR�~fno<���(4p�##�[��{+����;��<`��NF���Sb!ɱG���3��� ��g�[��Nb�nl� ����M��=I�Ѐ*$��������L|�2=�'���s ~k�9�V��@C@ѕ�>���<Xu��-��T����-��M��%����ہ-��_��倫����'      J   �  x��KS#7���S���c��9�P��@B-�-�)p3����i�F���6�����m���Z��Rz�������tMW�>k��l�ۦ�����P]l���k?T��>�m����s?�\FT�� �Y,�4DY��h�h�oUSϬ�ۼ�Y?�U?<W������*���/���]L�q��iً�����㾏��FԹR^��ce��Ne���56.?���c�U�v��/����?U��+��7s{��q���n�V���n��(�*KԶ��V�u]G3�V������a]}9��!��6^j�N���~��������;�B)� �b�PDWlT�US1��Y�Ņ�m�I�%��c�e�����>)� �F_q�h-��Z���+_!J�W���x[V�ֹ���Ց��h8��$d�v^BVT\H4� �\a�퀢�b����$Q���:O(Vu.H�a��=6��u�\��~�}U}����1�m����Tg�9[�jQa����c3:G��C��w��yJ=���Q9��Q�U㣦�Cw��D�7����!_���-�d�/�)�+ߺ�x����
[7���2y����x��A6j
�UU��e����η�ϴ{��؋B�ȭ�LY���!��L���9Z�]zR;\X>|�qI�כ������j�ӄ�B���K�v0�F]I�Ƴ3�O|�$QJc9�u������a� %Q@��s�&���ٹ��L�f���E_�v���>���䡠:��i�UшTqt��O�)�wϻ�v�fk���L��NN^��`X�qdѴc�3C�հ{����DϪ��T����a('E\T�W���:ȳ
�h��M]_е�����>��4�&�ef�T
�"���X�܋�\�g���
P�VJJ������,tȌ9�)�,]JLxJM��Ubb(&�<��Yo��.�Jj��)8DW\�H�@ɸ�K2j��W<�j�����+���Y([�+� %�+��e�`��`�Yn7������UѪ��`�V��"�K �|%�J塊� %�8M�ZE� \,Pf�.5� /��+l�i��%D��.�����w̾�����+<�'1���P"j��YĪ��
qR������	k(ҷsQR�ڰ@�Y�a��`��
��-�ɘ�i�1b�K����n>=���i��3d�Jla�ӭ%o�jaZ�������LWB�k�ۮ����o��x?a(��������c�ϣn0���vĪ��-�
f��B���j�o����t0*߽WK�K������EM�C�P�f/��o�ɥ^�_���&�sd_��&�WR#J�LD�H���i��+@�d�re�\�L�t�D=�Λ�.E1�Y	�/�DE�g�H�`��b��j� E�EI��*@�N1b�-���v��U�9����j�=����� �QW$pXbp�Ơ�=�}|�u�f͋WzrS��V*� ��Y�lL���v@e�J�F�2Q�ź�}��i�O��1_]�/��	zG_Ӓڶ�W��]��o.���z��F��K2 Q�$�g��3�|�s�m������O��&d�*^��*޷�PE�
gC�A^Q"e"�D�+W�	�t�*LOn��1$=BX�)cBחS�b�=��r{�E��Y���L����YT�A]7&>@�����D���Ͳ�2AE��qvrr�/~\Q      K   �  x�Z�r�F=S_��j6`G���PRR�|�eR��d�H��>=��R.6xp�"�������ֿ1.\WU���݊V����ح4�hܫ��y8�꾫�7��P����U?w�{�fP���V��t/�#B)U��������R=t{;���ŀ�b,�8�j߃z�}�K�ݾE(�� Y;	P�:��&Vw�p�{{��>����4�St�}��i������_��qs�Ww>@�����Wj
���[���}��n}���6�	J�+e�2�u-���y�?�c\u�4W�� ��r�KƸP�Zĳ�io��1��
Ƿ���=z��V9횢+�\E1H�t5���BMt�-��	A�ć@9Y:]� �1T��΅T�r�ڥ��ǐ�$��?�I�\�;� �FV\����v-���L�A\8�dV;K�F��u�U��'����-@IER;�jP�"Q���X3�\� *��*�E<etQmu<�P�� ?��]��Xo}>A��s`���4�D�R��@�c�V�T���Y)̊�j�+Z� T���"W������r93,�v�ޞ�a�>+���N�@�\����Ѡ�DQ�"�W��c9Ӽ�5zĪ��j��IfRϾp�"(J��dE����.J�3�p���WJ*7Q`�I����ig��o6�Ԣ
>�kP���Q� 4f�~����H;�~�ʹ9o�U���Tv����,Ai�� ?��V��`�/�;��>��D3+M�h���t+@fEZܺ��39Am���0���~�{�NYE�=Y�� B�}���{ݙ}��&��r�h�)gѦyw�\����G���L����)���	N�-�z����?v����5<C�z"�ڰ��F�<^�,�n�'����U��_�z��R��$3n�$V-ҕiM6��Ձ�;��l��p:Ǝ�wgR���s�4d������=Ҩ&�PI9W���:/�]P�vsfȲ��Ȭ��D��6��u��6PH�4V�
�x����&��)+�֟��W��C�e�t%��
5��D���uN!&�5T0���{?��� ���U�H�� \ԙ[��Э�r�W,�I� ���km7�M1�	.(�]���+/o�Lm.2܊Vwv�9��c�<TZ�g�J�$(	3�5i_w[H�j88@t�Bbi�K1�E��b�0��w�~�ws���p����r)ʎC�ʍ�,@!�#�N�m���� �M 1h5�A�^�zt58���]ʭK3�Tpt�Lrg2��g0�3����
�
�wgF�B�@�~�L֧)(�+"�*�	j��p��p�P�P�P�$�ȯ�
V�>��x?}f}�ux+�J����{�X�}=��:�VX�$V��(
K�5J����D(,Q*�(	
�k:΅�ʍj���K�|T(�t�ѐ�P���P��IP���
V�L��u�	^��N����|�/Ba%B]'������v�k������~ܟ"��S�������777�m�;p      L   �  x�X�n"A<3_�?���/w��u���2��d�����5L���JH�!��(���e7��1����~������GX!�1�h-E����<���l�_�h��`.����3H�
�nP�&��CH9����1�GP�
+fqc)c�胟��Y�� ��P�h'(L�@ȵ�,�������
w�JC�E�\����*b��2�#V� 8ɎTp�<����	(e�0�C�ɬ�q0/���@u�@,�曡�Rk%PzV?E��̀��{��3V�S��Y������X���G���|pZ�B�3�`U�^��*q����W�ۜ��ġ2�L��f�)?ҪuP���JBƂ���P:H�1Ef��)��^�[��_���U\�8ǪUMJ����MZ8���P����3����1=w��noyu�`qr�9������v���c�i��h�.��Z����K@_�ST�R�.Z��}Uv����Z�Ձܠ�dP'�zX����e���@�����+=V_��ޠԾjPj_���n:+��Ȯ^ �����Ξ�/5d�n�G
> ��/#�/7ě��Ԇ�Џ���\���p���<�O]�h���;���(7/}2��Z;��v�Z���Ţ�[j3�J
���:��)�eVeЫ� P���wg*˶8{��z]�pZ�K�����?Rf���J/������yƚ=      M   :  x�VK�1[w�b.�<����g��`�����ɴ_�j��BH�\���n��߾��¬�ܘ�9H�o�a���1��Z/��ѡca�hF�Y���Q/L�Y.!È��LQ�`���ܻcZc2�?Б�5��Y}�B�Y����@��>�E�s���ť.>@�+�ku*���a�u�=�R��2�y�C�^�����P���0��ϊ�����sZ�Y�f6�.��v6����d�js�E��΁�uV�u�l|�Y|��:�Ⱦ�*]8��O����|ȥ��=4���$��̆c����5d���)<�u̫��@B|��|�-p�$E�KΜ��)���аS[��a��;����D_�h���=g*{�����[�v�n|�:4c�γ�>��ز�7 ��t��p��G���=1�`?��g�,�jCx?�9y5�B��T'f�ԧ�]�+���N	Ϊ����ϙe~���Y|
�極|��s��:�{߹��v,n��ldg���Y�w�ϼ1+����T���a��p����s�⬡���Ʋ����������j��;�y��0��3G7����������|^Y��2�0>�� �b�y嬜�D������|'`�]{e^Lr>�k�n��T<8��:�����]�f
�^�$���g*����<t�D.�ɡ��t����{>�Ze�{��=�1y��I>Ӹw���͝F�����X�9����{��{cP��u����X^����������!U�(\��j�nc\g�Ew�[41�p�y���gqQ��~G�=_�.}�ü���� ��]      l      x��Ɏ/K��u�S����e�,ZHH�dS�i@���=?��<uY���_���s:-��s>��i�����4m��?m�ǿ��f����jε���j�e\����q]�����;�~������[{\s?���5�ks�K?��v���,M��kۮ}l�3#�v�}��~NE~]Σ[���&#��u&T����LgZ�!#?��4cs�e�m������|���`�_�a��k>�q���Z�֜�P�?��r,�|[f�按����n��k�����5l�����p��ڎ�}�����:�2�2�w7M�9�䗾�ڮo���o�45�>4]N������v�p�G��G���������:��9��h��S����]7�W?��Ч�n���zW�|����垚�3���e�Mx�����x�p6g�:����������ah�6'��m���]ƿ���Qm����p�۽�_��ԭ۵�W7g����wok��4��}S_9�k=;'vX��۷��m��{�-}�-g�����}��m�R��"��_�Q�Y'��n�.u~׵m��k���\���!tjB����4w�}��m��3���0��6�s��y�~���}�6�������\�~i������ø����xo&pQ���T��s�?͵��>]��)#�ò��<wu��v��U{e��i��s�~��,�0LK3������k�����;��=ʩ��]�Я�2U�������9��ҎU۶��]�6�~�8nd�W��ڑ����"M�_sMT�Ԙ³~�+���vk�z~�s�W��Z�������Q�k�ܼu;锔�x��z��P���w�|�S�z���i�v��g��}Y�徻.�~���M75}�?����Xr�G���浫�[�i�}�6'�o�10�^�s��qoo�`���S�]�6�u���^��rm��=�w����?�Mw��vR����n�v�}տ���N����=��`���[����T�䯁�<��^������V������ҹ��=�����R9�~�]��_�};h�Ϳ�Ε�r������ǣwU)�?�anPX����Ǎ	E]���l� d�}�0���k�ޟy�Pw�M�?����fӻ�:..@�	2�o穣}ܾ"��X绻�)�i��{�pѺ���Ģ=��L��p�<��J�?�/�g7t�}�����骿�{��\�!#O�o>�b��o��6�cN�o���`L�g��}-�v3��>3�[��\��g����s�[��\��Z��������n�)3�<�?]��φy�g�<xwS���VV�ۿƃw�a��g���d���ʌ�q�=/�����־�S9���ǶM#���G b]���:���ޚ�*�{�{�N #1�:��u��l�߳R~C/��8�-�m��"ϐ:fM{6)��s��Z��������}Df����c���������9����ޚ�m>s���Ƴ�����֞�q]G]���z�������ip��Q���Y:��`�ƿ絹��u)�]g!v:��ݿ�����P�?���w�R���S�p�W���u�x��9�{����}�B	����2.ә�c�������s�;;.u�������*�/̟�v!�a��s��sc{��$ �	��&�<�J�j��)�y�v{f�7z@�<����{�����xA�|� ߽]�~X�^����y��d{7����O�y�W��3�03%��������ؐ�\�ÿn3�f����0��L�/~����9�;���r����>�.7�9B�ū�g�ؾ� ֑���"P{��O���Qs��s�y:����Nd~i�6u��kc�Ë}�o��>!,�T�i�X���~�JT6�?�c=36����F�(�o�����������C��'��_��\��K@@H�_v�n�e���y�B��Ҥ�o���X��_=��B��f�?������5�59�aY�i��|u�n��E������C���єq_ύMpfޏ���	������џŦ��O�p�=��;�u��4��P��i���qtC�?��O!���R߿������s���0/W��h�sZ�Yĩ��"I��x� e�ɴ���Bu���~�)����X�E�m�u�9 ����*S���g>8=9y��=��G��؅b�c�~��_2e�f���=e�as�O��^��1#L�0'?
ݯ�"�U�w�׾g��jf���.����b�;�P����u����/�řZ��r��ճ4����C#�Cy3C����	~KW���ǙW��'���[1�={�ٿf���y����풝5yퟛ��og0����uY|���p�Y��z��?�+a�
��{�{��"����� ��� U>�n�����j��m\�w��r�1��H͟�0�������xe���e�Θ�e�$��v���e䝜M�v��gGb��)��_�j�D�y�3.�"�����6��FO���e�?y4���/�+�R����$@F4��ޝ�ŽQ���ōv��c��f������/�	��H�?��F�(�����>ʝ�k���r-b��"?-Ȇ�s��HY-� ���/i���z�����-��kD�;�O�F���rJ�;^�"�}����_e����_D�ϙQ0.��/۳�@���E�W�C�$u~F�:WFҿȋ���	a�&�]a���o[F&��m����ޝ�)-�ȳ�����p�)�"�Ҝ����ߣ���͜:�G;Jt1@��!/}���|H��◍Xo�G����%��{�}N�߶n�]��:��~I6gN���v�#�Nߟ݆pj���G�~����S���n�2�t�l��5�餿�^y>�(a�)u~��茺7���2�w�}��xكg�֞G�A�1u~�󔂎G����r��43�:����Ŀ���l�)�ΰH�_��;�o�=�&=�}�\)�}mlF@_�� �[=	��/�6��6w��<�v����C ��4yk �{�����p� 0��g|��Y.e�����]�Fs�|�;��O)|���?2��uq������;�s|=_yn��{X������������u_�CQ���pay�S���<'��Z����E,}j���o��Z�+�������<��U�N�|U}�<>7S�%��X/���������>��\�8��\�<�'�>3��������(��xHF޷Ol�m���"���¸��+\=	�����g�=]���X���B�F��9������H�?��6��z��G�@9)����G���ʛ>��(NJ��^,�p ��S>!#�����ES�}���q����l ��Y�Y����$����;�8�`E��^ �n(���ЊW��85E^4o[��TT��b�#fV�[��T�2K��C���������y6���s����'���p� \�*�t��/]�����5T}�:�W�'X[��^W硂 ��k+(��
�L�s=n?v q=��"x�9I#���7Z��Kg��ED)u��si�3��ɧ˩�T����*2P�aT��L����;>T���aR&�O����t��w��e�Q���	�o�g_�I�1'~A�]]����nM��w; �$jY�O��1���%���v�p����˿
��Z;��K�����3��S� �x�r�y�S�,�RϿ��4�=F�<1>��y�U�_z�?{�O�𹈟'乺�� ���ɧڡ����Гu|@T����%#�K���n0�dD�����ҝ^���;|/"$3�<�h��Y�?���qh���<��x{��#�������ӗ�.�?�`D���2&�_��VmET�Q@��n_S�n��d�y��CLGQ01~d�kڻ�~r��(f��?�������w��{�{��ݤ~�o��� tY�v�|����cJ>�TM=�2Ig��[-!/P>$�[����	
e�GX�]�{��w�l<��@�)y���/a����)��y�@���	�
�(���^�e����{���/T��g�{�{��kv�A����`�n������ά?�GQ�V�?��lB�`)�w�U�����pd��#u�~�����	�    ޞG���٩� ������]��; U��r6�ʗ�0F��C�ȯ��;?3����,x]��2�8�2J�y'	�~���JI̟��,�-����Lz}�)��	y�����-���)��u��2���o,�z �vg�&��C�f����=f���Z��'~ۺ���b�)�	J|��6y�pٻ�J&1�J-�轚?Ips���f���he|����7\̌��7I �qE^�m�K"����門cC�xG=�*�r�����>���cO�5e��_�@a���#��	j��I���׉X7���H�M9f��R���
�٪_y������ȍR>W�~q'�7�[�)3�K�c�Hd\ |�|t*~ -]�Ee�л��"�T$�������0�ځ��+��?�	��	yqJ�ܳ��Q���+Ý�_F�%c�ſY��rZ5�yƣh�A����۟'�����,�y^�ˋ�S?�C��K̿Y�u���P�����zP�U3�r�����:�|�W6\.~`Y�5��"O:��������Z�zI7�~�4h��۵n���/y���*&�W	�v��w����f3*�L����H�Ë�b/��գ�"&�o�X&�Ǌ?�:��}�~3!�:�aq����B��)w������Y����<dqf|F�����w��7����\\�j#�3�* v�-3���*���3"ϋ:����F�y��S�	䂧�w��S(��)��(���L���F�E���?C�ylNL���:�ܚ2��+�G82���� r=�J�e4A���y�BG����|?���6@�����ו��;���"�}J��{��g�Zz �\���(x�R���A2/ ���<m����z꟔����Tғ�Wp���_˱���O���G����3���EC:���g�UI���<��Q��p*d��%�����@,�_�;����y��.��,�mW�����������p$��@J�'ƟD>a�U{���#������wF��W������ғ�_!��c����М�ʄL�_d5s)�_����A2G�Oɟ�j�d�k��R��j3��;
0$\����
��Ќ<F�I�vy�o_o����[���h����;g� �Z�v��'��g��@�&�\�[��	"R��&���3Xz��[���.�V�_�M�!�?�ٱ>e���A��9)��g9E [�_���W�81	�_��P$]���b�$�>��:7�����$�^��������:���[�����;*�+�T��È��CjD���;O6uFD����ż��W�ȏ�et8�RJ	y�s Uȵ�>�r�]s �'�eoZ�Z?��v�]�8���IԪ?��4��%�c�y�ܕ���yt#���)�@f��Z�{6��Å+��o�b��?;h�@Qg��^�D�ܰ�Ӟ�@������<�i��� h��%�U����Q	R =��bO�5q����U���
g����s��O��Wzϟ�{��ob|�3��N�~;@!�����W I\/�3>��*$t�J�3��vX_鷺~�d��]J�%�?4���Y��P)��
]�M�������T�9�{,�l�+\�wL�:L.�����&��i��~[�����J���I����k�(�O��e��m�wE��Gf��*�E��x�f����* P�AF����|Uy΋��������_�*0�e��~�5 �)�G�SC:��/x������?vM�������D�J�>�-e���?�:S������y�os���|8*l�z~��@*Z�ӹ�OXC�!oU�����W%2�?�?�)��p����<��+ ��C���g����"p��,/#��A��S��x�Fe��{ ����J���C��/H?X�*��h`�m}j�>����?5M���o��o������������Ϩ9&��y���^��0�.�� ZF4�}� ��y�q�Z�d V���σ]�����BÙ����4ʏ)�$ L�VɆ�O�.B)��ʌ�=F��l�p�,n� :8b-�Ĳ~<�����ˌ����5�+�.�� �\ ta�0T�X

�Hbf|���ŇC��_&�Z��3��lQ��ʫ%[uR�/�6�0د��p�(� s���� ���+�����m ��Sg�|����.�I��(�� ��{z�s��0�3�( *��"/��~/$y��'�j{��Yww� q�$��\���p���cPoh\r�ߨ9� E�����G��ʙ���c+D"������2!��5S���ȫ�>�`	��~�-x��&�T���R�,LE^�E�ESX��Wj����!�_ GJ�U	��W/�.#�R��j�$��F���B X��W���\ �ࢌ���O �ǩ̌��躸@U^ݚ�\�wN^��,��)�����F$,��E�.|Q [Y������H�?�O`N�^y�=8	��aK��}�ݑ�*��O<l�\ I�\��Ƀ8%Ώ� 	�+W 	�-��|�����~D5���_��Q��6q�����:uϒg�FeSF��KkǪ�y���I��������%�� ʄ���~��"�Ʉ@�jJ���|Q�S rYrZ�e�R�`i?�T�B�R���ta��y�)��|?��(�2����G)HF���|ܪ��	ה��� {�t)x	��b
���[��p�D�0s��<>�lY_(y�9ILd���*�"�MF�+� HF���Еy;� Td(#��D9�����!��O
�A* �pP\�:�s/)�	N���Rwr��N�H+.�3@V�s*�
�g��aQjrCA:3�� �{ߋA��gA�r����+�ƞ|^x�_ʡ�ِ���ZɆ�~��[<	���?����R�� ��`Le4��o� )��~�g��&��߁p}~*��9�m���� t�2�3�n .�E?�륞w!���{rq�V|���$|贍�:���?@ �4 �i��ħ	�O0'���<�i��ܧ	�O��&@?M�~� �8�a���� �O >`|
 ���) �S Χ �OH��>`}
 ���! �S ާ �O�� ?`~��c �O�`?�~
 ���) �S �� ����?�Z �i§�`|Z �iʧ0��|Z �iҧP�`}Z �i��'��p��}Z �i��`~X �i����~Z �i�V�@Z��i�NC����W�O�Ը�eD2��Z@�i���|J��)���XHs}D��)�ǧ"�|H��)�˧2�y�T�K �6��|J�0׏�8��}J��)�ӧR�ď��%���@�S�O	�>%0��@�S7<%(�����ljW���.n`�?��wF�7p�"�i~-���ֹ�*���/����aQ�� �R-}���9Q���@R�����n1\ �"ĵH�wuO��ٷ��?��ki��ֲ$��?0X�-�)�������3������ȋ'BLSF�m�W�KC<��'|��x��ZvƖ�Eé����cO'�i���������h��cM��#���n4j����TÄP�V�_�7@Y%���B8o��?��V�������a\� �����M��B�G��S �$�7^��+��i %�o��/$�E^%|m_� )!�ΣG�%���.^/wF>��+��#�v�XMcF�,�o������X� ���D����k�%9X{����趎��~?xd��9��z�:��[f)���
OAL��vC�VYߑ��y�޻@f���q
I�O9��|=X���1o�Ӄ��AL��K'
x���ۢ�ߊ�!#�L���O��KKs}q5�I�_k����*�{8�=G��_�g���i�����&J���B�V��u�ho&���'��g� )�����2���xB[�5�_�<(�Ʀ�T1G��o\V����(H�S����7�m�:	x!�5g�i`��_)�^8��.E    u�￙��ey����zF^�뮂C�"����0�)�!z�xu��{�Gĥ ����%�^E�<=��Z�-���5R߯��9��<�R�L!Gf|�z �Ϳ�o�c�r �y�G��q��g!@����-#�r�֠d����`Át�/'�xr9p(k`򌏸G�S-�&=p3��N���t��3]|��|�"���}�<�E���'6iFx�����'=e1p�)������2���ɢ~ׂ1���W���q]?�
�	y�B�O�5Ty���t}�ky�[=��3��c �~��ve�g�|?����� 0I�?8kݺ����[�
8X��+�F>�䥾�6�To"`I�����s�e�*پ(3���: h���_���kbR��_���r����uS�Wǔ�%k��>�o�)i����t��V�u�ӆ>3�/��g|���]x42��U��PB�ڟ�(O<VQ������r}q&��_TC����Ĝ�G]Hec��맔�><�������ŀQ�o�[4��vC`��G���4��z~�)[����: '��������D��%h~^?��3#3�ȏ�@E@z,j��;��~�E!AǄB���?�����1[θh��=��OP���r%kK���#���H�w=^��ȭ�+�'~�-S�]�Pf�O�qM����I	T�?�c�ǥ 3���u�"�3{��y��'����C`��@D�#H|�^� ���Z����Ot���ܙ�����)��q������1����}�����>�}F^��W�?���jdU���?�BEcw�}�r��$���1#9��#oѵ�-�y���UqV���`P�"e�_�2�������=��U ��Bj�<�	\��Gs��oE�m'�!rJ����-���ߏ��R;3>��P��zUB�筭�PVF^�8���e��_4PI|���U����26�O��|����lÊ<*O�ܜ`}F����e����[�p�D,�?6`��ᶃ��_�+B��9�.ydk�%� ������&�����[���� Jm�u��	y�G��!jR�y)���DO����������������}B>��� le|�]C#�y��Ɵ��*S0Z��;�8�h��׽e�ú����CCgN^�s6,���wF**�s�(#PĸȣNG��|\P%3�7���O�=�hqbR���n�ȿ�Z��~��vD����y~4�\��"����mb�4 (�W���o�땾x��Q������jE<��������.��e����]�3w�J�fɎz~��j�+�t��%�M��^�?bw��F������}�;,���X�[9��{B~��{���OQ
�w���셻nov�����V��[f|4?/����6w��08#?�_Q��_t@��Y�_����>��#o�qX��Zf|����!P����|�Y�G?��T��.�`_��u�DN���&Ы�
u�64xq2�#���!>[?���ɯ����#<�Cs���*Z�Xt@��'���M���3'�ͬ0�!yl�,m9ت��2�JL/#����Gf;�G.�%����w���ߓ9D�_���jL	��C�ȣ��,>yD����@���hO�x�o��$7�c9�~E���~�wG�z�$Ͼ(t3�/��l32���O݃�Q�?#2H�?�c����<EP�������w)����02���*#�G�Y��$��S����{>�T������>(����G��AE��e�[�M��=��ѽ*����&0����w��b�y�CO�9E��z�������_A_���q����*|�v��i�$�B&��e�y�?&:� RĪy�#گ�+X�c�|syWO�g]��vi��"�"#�yD�!�P���2ߥXF�G��c�*���?�[����?:����5�~��Ȼ8�����]����ٰ�5f��_��mWE��?r�|�4�ȷ���}�/�ra�S*u��'��+z��z*7~��Ǡ�[]���In�t_ۣ����?��At=}4P̜�Tm�o������F��<�Qe�+��ndF�>����9G��͌��sB�(bP�Ǆ���=Q����|!�|���}O����A�����?ƼO��T,#�B���P�/��Tsb��V%2���V��BJV�#����[��{�
芑:?����7�ȋ}�e��ڝ�Ţ��_�v����ω�k������/���]����H���.�
[9 N��mB^�{��5u��SL�TD��o��H紌(�W�10��	��������N��
�]F^�=�߿���2C7����T�8=w��)�g1�8�.0�|���*&�9�/u���#u��O�)}A�6�~Z�?/e���Hn����g�P�F �|����７�g�w�<ԋl\��d֏߹�b[*����~�ל�����.t���<8Q�>aƥ�_[.w���x��%$�})�)X������f�I����}��Pϟi�:3���?�*���y�i�cf���W=G_���<M���ǜ��X���J,7:3�g�ݮ�ZY?�t7
��yz��!���{��8릖zu� ��@����I�FȌk�kY�`���S�y;�6�~JԂ�D���_�`�����ѽ�'2�������C;#���7��<�{�3m��.8��p�eam�n;�s$z�pF��>NO�? ^���сH�?�������W���0��.��׊�vz� $��0��x���yO0H�	yPX��������QF���!��6�gO_���1�����������l&Q��~|y٣�㘙�<t�A��?�C������G��ȋ~�bՔ�F^��i�ȏ~��RI^՜<�i�7a��S�b�L���"����kg��sꯄU3�>��;5M��}��G~6q�4�ԿD�����ȐC.�����!�⟥~��� /*#�[����\ϟ���{�p~TF^�+ �p�����V�|���;��C}�`C�z�3�g�p���K[�!QЖ"#{��;Yn���Nj�D?5�XW�"��stm"���P��)�z��=��=#���y��g�/O�_�4�c���1�6�-y2����O����[&�홊��S�O$yW�zK�������f�F��C��H���W����Y�y�/vF�����ke$*7��o�Õo��_# Ux_�����ّ����B/�2U ����6�!��Bos4Q��o����v�7Ӡ��!���s���,Ъ?�'PG�����H�q����������*xA_�/s��Ԯ�������`�G��o��B���9���,9Ⱥ~U�FSf|�%���y��+�-��^��˵�P�P���^��00�8!�M� ����z@E�������s�d��JPU�'�7�f�#g��S�2_������	f��׀)!�v��/�K|�US�&ˌ��^�t�������.��wߵܔ����	�l,i4�ʌ�yb�[��?!iN��S"5�S�1 �=�O��<_�;)����3�n��v*�Y������}�V�S���FF���oe�A�vE�E����?���p���^{�4M$R�P.��^��\�&����]�"JX91�����'b9�0�m'��jnۨw��x3�/��;D��g�85"�]
?��C��_��3BC�X�-�/.���:��a�$��3hpE�8��+���9��N�����#�z8j�Μ��l����|�/�Q.�>��~�+�NI�� ��(��0�~�
�g���Go��@N^�\��S�"O���}N^�g���z����`�s)�I쿓:���e��9���uF�[_yn����823�,=ͫ���������=�y�UJQ����;@��_C@f��������oL�� ���ĖnE~��(ƻ������7-��SݸK���)�}�l_�o��g1����w��"�wW ���    k&{�Uϟ�_�V��۔�}�`�lqUA��P8_����=���O�q�'R@9��K�e����B�|�����ً��u�h#��]MU�~�XlE^��)�
Õ�?~�{��X ����������/�z@�G����F������mr����L���*6����v^��j��y����v���ȯ�CO�����W&�oH�O�|�%�B,XU�W�d��cR�@���˝���*Z���KR@*f"��WH8�W��UZ���|@=��A������ђ 䝹�AyV�-�im�ge�A��� ���ڿH��V�����Zx>�mT�褂�G?LB���Ԝ,�����������}M+ki�{ �]@"R��>N� ^xN�o"Vb�r7z5�PkE�`���&�Y�J����J�s�~��W|����ߒ��y�T�'YP<����B׍z�~���PD9�#�]���g���Od�A�R�����y���x�l����
�	���>�H{{�z�^���X��a¤��З���!T�������L���]u����t8��1���]��Ӂ������F�H�񮨠�`���|G�$�F3�\_&$Jݿ�zΜ�GSG�S��:���0E�{��~q`د��e�h5���g��$�3�f���8eD��5�� �,<��R-+��c�$���{���|n4�N��#�)o@�~�xs|W�`���;�X-u��/�bKG���h�_I��?�i��ά͝_�tE^-�����s�[H�y���e�h.���Ư�����,b?�# `#W�z�@_-�3W�Y	��f�W��#VǧJX2��>���Bu���3�j�&����Q���y�M@��������	C�u/7>��Pv�5@XS���蟔��V��u|�W�W�)���f�j�:�@jt�F��z?�/�h��;��Տ"4K��
*v��ʇ"	Ru@���Ss*�T+��1���s̽������'�󜟗�qcXf�G�%��䯆���^*I�ÃM�/�!*�ݗ�?Q7@S�(����i���A4L��0#� Qɖx�3�`b�;�!���?�SP�Q=�Pǃ�0pSj����n����p��/�g����_�ꓹ�v��&����t3��s���l�E�E��?mn�8!�<]��T���d���r�o�����[*%u��^ICo�����(��ʒ��.�s���q�� 5�C��������u�����@���	,J���O�E0.0#�T|"��yܕ��o����m��}��ӻ�ÜR�o��L�����*S�P3�l3"���F%�jxχLvb|ݾ��xk�e@Phb
\J7#����q����"�N�0#�?t�R��K��ŞTef�A?����|?��"ڲ��+���)��6�t�Ȍ��������9�9��H=+ *�Q�ǁ�S�o�/����k����/5&T@��<���/�O<�G^�M
�6��f�ث����w�̌��2���"�k��Ǔ_#�V��ȁ����L�S���Mrʒ�Q�����퉦��������C�<�!Y�W����Ȳp��l���!�Z�� ��~8�����q�����?R�3� R��ơ;԰~/q��?L?��*?0�d`:^`Jԁ��Ƣ��=|z�/������*E�ct��FZ91��Þ�	r��?"Ƹ�Ϸ���|Z�k���½������;%.�������������+��\����0%	y���U�xw���xt���>F��}?����P����֭�o����p|T�?�?���>����~>��������,��DE���������,����Gy�n5v��I�������+��]�/f���H����y�Ӏ_b��2����-g�ʳ�ٞ"s��z|��VǗP>��w+3��Q����Y��S��rg-0c���phgƏԑzC�ƺ�C�?�������d��7|�o���y��f���o~�H�!��Ă�߽C�\��x�&�CN~�ʺ��;@*w���|s�P�/j8�b��
)���9��*��L|�?']b��|0�yѷ&M�#�i�����_୉t[��� p�&�绯�3��/���	�/���i�E�?��VP�R���q����͢*��y����:�Z����˿'���O|�?��������_������ӿ�����o�������gL���b?���\S���ofOo��7oZY	�����j��Ǔ �;"#�Jԕ���"+rS,�������ި�bJ���o����
D'�G��iO! ���J�G�.Z�<�~y�P�ݵ2)���Hͥv�`d����(����#��,/�R3�e���������g�)&ĭ��xS�W*537�a�)D<z�OV����(��22��E��l�>�Ę���I��� '}I�h����`�$5��<Kl����&��O��ϓ��Ga�Z��<��oHw��#�wʫH�dʌI��b=/.1��yR��<�%�zXx�A����|�Z�9���_P�G�3���QJ��b:��0��xb|�� ��]���Ҝ��bQ3�b`P��}��w�\�yu[^:����>"!��+�fw�����u6B������"x�_�?݉��\���X�*oN����+1C�dL�_�z�{�Ny9�6b9=�$!�h=�)�.�@=B��b������ss�n|Ώ���EK��|LW-1*�"�B[%.�y�V�W�����������E��>��_��rH�0�xF^9+T?�W�vԉJ��x/��Z"��L!�
���as�}��O����Q�gʑ�P�i���p���A$"�~hP�/���<�.��, 6qB��{��"����N]N��}02w�ky��HV�J$�<I��|U��Q"��9��c��ҹ��?��v�g��4���2�o.?1���b���1E����Ξ�w����]�!{���q��#�������?�D�D!1!�N21��y�4�L�Aac3��T �z�U��D{j��TO��¨�/(���M�?<���`�|母G70z��<m��[�P����1H��k}B�=㿧Q2"e�hcк| �E�}�6�����B^([Ϗ�g�����(������ѯ>��]yϟd��u����z!d���o��m�'xt@F��`W�HU~3�����@~��'�Z˝���Q'BH�g�`H�H�����k�*M�WRUY�QN>*^�
��L��^�,'�]�S��9l�)^m����6���x�<Z����m��W4KS�Z��F<Q���(��K�Q��WH_����/���ٿod6����{�uR��ȣ�хId""#eT`�ʛG�0h��f�J�54�+ 2��/'"V��<7us�E�l0HtR�3�?#��!x{EP�D�Μ�6ӧk�r��K����(�)��"���r�2)��U���W$��������Oy ����|�8Rx��>92��0n"�g���f|A�qs�?��X�Z���b<'X(��������*�3�'���o@δ�@DVן6��d��h\��E�8����1	x1�<�7PĐ�`h!!?��C�^$8��P�9���N�=�@���o��p�kf�U���2L�`|  eF��B�ao,��.�����(Cp+T=!4e�M`�~��U=o�@���CB*�1��/#�u����"�/��&1�P̜@�~}\�n<X��	y�^�%R�/h���s'1�$��d���o�p�)���?����d�_<�:6`E�]x��&PB~	�Vo=&�g� E�N�S͛�oU�=0#�������'���KE��?�����g��r:z����_��01�����W�D�#�9'�y�*�$H�����F2�	�$K��� s����s���J-\F>�=�<xE����������G�ˢ�����>{ki2�?E#�    ���WC+Q��pA3�?��$���K�#'Ou�
���K%��1�&��׹J=.�����dTq��������3��x�_o<�y6\���j%,7(zQs�r�7.�K�	e|��L�e�d������o����$�X?��H�ޔ�C}�	F�<)�#���u�J\��͛F̭_i<�������/L1�����}@$����Ԥ��&g)+3(�>7/��ɍ�{�4����c�-}hs���<�9��*�&�|` �X�B���N&�T2��tX��%,��<n9�Y|��xy�?�c����;��AΦȟ�)B�r����7R٫�ӵ����݉��8����Ԣ��s~�:� �1:!/������?�∢׀������D^���<
�4x���{(�#F���I���g%R����'����Sa��;�O�m��:��J9���J��@���QR�?��!1���	����3܆�-6��'������+�g-T�o{sb|�×rw����i$͠��oH�p�G���?�p�u ��e�q�� �+���$��rS��*��\P�<ヤ�$�S9mf��������Z�ǚH�_�!�$d.m��o�Ș�;�~S�vNĴ����c�;����3S��G��~Rҝ�m����o�7�X���r_<�	|��֐^%[B^�ԅy��:o-NF^�N)��M=��Z����vb|DΎ08����!@�p��A�q�P���o���:��1S�/L�k8 ��
�'+���W�L=n�ΐ��'���g��ê���E���<������}����?����!�LU��]p�>����K�mbn���/.�$7�^- ��ǲ�<<�2����m�=��E^Q�����c�\K��*���Sצ��w�Q��=�9�N���?��+�ʄ���ߢ?��Wx�
8����y�j����:���^�� �k%Ƈ���n���:��n�L��?c�-����?f�N�HD�V����%찴��Y"�!ȡ2�|Cf[��K�?ձyl����P
�귲0��k{�C�qw��W-�����C�Y͠�/��O[/�3���[Q2�e�)�$���?J�K��"�"�/�q���YG���b��J�AC�����N���~M�AP����,����3����E���?��<�N��8j��@����wU����%���/�S����|a��WM������� �s�n�I� ����2�~��<�͙�c���D5r_g�Q�C�>w_��7���Y8������@�Ft2(������,j��S�V����.���~qf|v��5�`/��D�kCg��i!������S�a�r�_������UÀ�[?����g��^ߺ~�ʳ�Z�+�|�9+��/�L��l��d�9/씨�.����>���Xc��Y���o����E!g���\р+b����A�E�';Ƚk�(���U�}�}*���®6>5>T ��<��{�����?p�815�˕�LfР�ȳ=�����~w�</ܯ؀j��f���)C�+����W��;vf�o5�����e��
㌼��樆��=]�z���!Z���J�r~�(�)�z��<�+B^�0E^�@��L�l�o��"��(9��<��զ��3�(B�Hٯ���RƗ��G�.'/|(؃w���:6�2���i�Nt̞������ClI���Vk���7��T�O����y�b��Qӏ�69R�/M��؂7����$��V���v����?6�Z��P�P�iOG�E��ۭ�qTBu��x"H]B�;^S��D"s	yqB���OU��,�ڡ��,%\�`�?B_��n�����Z�7e���P1��^������=<D�&��@?!�j������#O��h�w�y��/��⏯���������^<�2�2L�f|yQ
��	��[�
Ǘ��n��Z��.�0'u�J��	�!S�?�|���dP�	yƇ�(�G��+�-%O�,����WW��ؔ�e��wx�u�ߝ�r��?ʣP�`�&���ON��U�_�)��S��,#��/��\ 4�� �K�W�Ζ��!:�d䝝��.�׊���K|��c�Ӧ ��b�AJ�����lѾ�ȣ���O��03>5�	 ]�2��U܁NUK��G�E��	���^���_� w� b��:�f1m�4j�~�?t�b��T�>��	f*��h��ƭ�/ ���*~_'f��I�g7@�T
 f�1��X�U�G�?X4�PFr��W��8� �@Db���B>�x|�~�Vn�֥�_��^��%3��5E#^X�_P`�Y��2�b5����ʳ�����⯑�@C��|���H>���!)���������n ���x�}Y4"�r���@�*���/M��`����_�ݤ]�?Rq�S���c��K�Ο3
���-#/�(�V�}D�%~��䗷�W�??�+"�������ůJEpF^���sЗ���5x���3�����S:9t �rj�d{v��>��~��V'LIf|���J7���۷�M���8?��|`Y�2>
I���6?2#�S�6���_�R����F%
-_�v��LAX����uA�I0������P��$5#�e�\9��~�Vi$�s����?\�e|�[̮�=����N�F����4~�@l��|P�15����V���b$��0-�7����jB¦%���筊`���*n�zF��nb˪���O�~�91>�9��b@������>b )����������}x1/�����:'*��?�o��Sؒ�G�������'y��$�cB^�^���CV]�d�	y�
���R���qi<�y� sT�?X�O_)���?��������	01@u�֝T�xM>��C��=�� ��E�p���d�!�v��m�"~\o���<#��ws�<]B��:���7}�����}�#r�;=7��x���P��Ϭ��%Ɨ<G�����h,�;���״��a�?���_NQ�G$��?�@A�R����NV�ʌ�����M����Z�!ib|| k��9�O_����o��h��֯i%�CT4XV=#/[�x_�s���L��z����?�Th�2+|��C/�;'9��z��۠\��������!��c���!��!) Ȭ���r��mV�L@Б&�E���p�J������ҟr�Zώ
~�<{t��������״h��2�L�����4MF^����XƷs��`�����վa.������@�Ȑ��%���㛔�Kn�{��������"ک�C[-e��2,��!����S���uh�oDJLR�
3�z(�6D��3���m��X�C�i���D�A�WLtF~�2�W�P�I mF���?|��w��+<8U�E^徶�6PJf|������z�2�0eJ1���1Vċ�<����'������5N*� )�g)"2<s���9�9�������_�1���韶�+�ԝ�״�����?��5e��evzA��#�~Sy�"/s�_��%̬�h��جE^�(�z&�yž�[p�����'�T�~��c*��vx�/<��ND�s��7������Eu���w��{F/�g|q���5'/LNuu�0�<܆�z53�w����xGɦ5[N^�"̇����Ύ��(�����!X�4 ��ML0�~"���ޡe��������88�\�'\�Ap�s�{��π���<�$����oz�
��g�U#,�k�TR�G����y=�p�������I�4��E;����Xo[K�g�ra��c����"1>�Z�EH/�SNȫU��WVk��/�C2�"��1���t��#(���,N���{��xPs�+�=gU}��c�jEti��I|�܅瓽Z�O���SP�Z��L	�j��j�(E��"w�[/���I>V��<�d�ц��<��馞�W��>��/��!@��(nF�q�V#�R�<�P$"`�/%�Ѵa�������Mb� a  �X���f|�[�
30#�r�ūj��?D�"������tcA���� dWb����k-'�a��������=� ���<�@._��������!�ȳ5z�7� ��'i�s�� ��l_�����@Eg��������'vp��A��?3y��>���h��bP���,�A,��(�X-�����O���̡"QFS����M_������U���m\����P�!�����ˤOC����Ojd����[Y]`��zJ`d�{M�_��y�X�؈ك[.�aj�5 .���'{�*͌o��*�O����ǒʿ�լ��u����2��>Lԉ�_�7���LJB�2���/�����'�)9��<�>�gú~�S�k^aa�<�\l�7�E��}R�����CZ#`������O�����R"%Q�U��v���#�]63>�t��`�����ŉ�s��oF���p
@F��n������:I'����*�&W�hI5'Ȍ��Y�]����|��TN3���׷ڦ�?@e��
���������wGD��GS���Q���&��7�����{������_�����������/�����������˿����� bR�      N     xm��jAE��_Q?���k�4��(H��m��k^	5ӈ�ꨄ�l�~pn�����C�Y�!f�2��7��#m!8r�2H���j͎�+z�����Y�������rD͞<L-���L�Y��(��7ͭ"�c���NL=��Ds��O�κ;���&��M��"35�A@KԴ�gZ��NSi3�e;g�L�����u?��_�~6]�v��!��	��RK3�R���в��y8�|MⵒJ�|���e�>����bΖ��\�����Z�      O   �   x%��N�0E�3_1_ u�^��Ă����a3M&�U�{���RwGW:G�;D!���M�Va\?�on�3=��б�q��=5�'7e��,��S��)Z%$z��n��Y���|��x ���pa�!�0+�1���2'�Tp�4h���P{����7^Y�l��!�����'4{�pWe]�8{n�bO��͡�QS>IBs���jUN�XiU�cO�}�Z��'D���V�      P      x3�t��O�2���/Q 3c���� G��      Q   �   x]���@Dϝ��/�D�IC�\�-PX �]L�{A�Լt��[�V�وr���[�g�鉌}�B���i�k4�$���p�b'b���Jst��v��Y�A�5�9����9�,R�a6/X�h�&�W?Q�qӹ��E2����
,"�E�T�m�B�^��&b7���q �4xK7      R   r  xeT͒�0>KO�'������NY�tav/���;uvy�ʄ b�gY��V� (!5^,�Rys�1��ws��TT� ��`iN�X�\8Z�>L����bNς�A��F�ɓ݊�V&8�g]V���2��`�i�{Ö�sy�%�`��5����_�b$��n����&��ǰ��ǒ"OT�7K�f�O/0J`Le�+N3o��|����\���M~$�v��aI���W�`j*��۾3.{0׺
�?;�o��������Y��g�ʘ�?2V�hOm�Q*HW����D����S�/ +(�����:�8}OE�6 ���>��0u%�d�ȣ�B[S��"�t�?J��?I���\�)0���γ��1���<�-��07S�$�q���LicrS[\��󯳆��x2-�ui6-�>L��b¥�R�<�`<�'N�j�h�x�ş�~lU��0�3���t�W�^��5ל�T0͙C%O�0�a�.�*���Un�sI�;T
��u�kT	�~^׭�A�縴3����U:����&
J�1LZ���V������F0���I��ȯ���C &Q������^{Wh�~�\�L�H�0�/��3�����0Q��o��������j�<      S      x����� � �      T   �   xu�1�0Eg�9A� b@E*U�.��$U
z�FBHUC�h?��������cE�}���3�\[�ؒ!MN���@0:���#��/~
4�vd�AN��c���%K:Fq����=IR�"�w���8���/.~}�;8x�ծ6Y����kс����a�jə��j��"~+ab�      m      x���r�8��=O�������;�����v�ݘ���ikl�eiW���4�YΓ�_"V-�J5m[)��D"?��Ơ�vի7���U��x�:������Ew;$���[�����U���}��������K�Ι?>CU������i�?��7�K���NC��84�ں5�PG���2M6.��c���U��]��A�m�{�'W���n�����(׷m�Mm��Q�����m��2'��z�,�5c��"r;�oC,����8;�T>{7�y���-��s��O�߫&���^��o��W��ݷ��}��~����{�t�Dۺ.�%⯻��~z����Z���K��׫����ϟ�V�UZ�׼p]���x�?6��K�����)N&.c;���T��lM��ɉ���6��~R��ck��<L�țe�z߇�Qycۮ��ތ���75�U�X�hz�;��K3�z��Qy��شc��۹�l;,��&`��l�i��O����+��WY������nw��u]~z�{������K�/(��ϫ�o��:��p�~q�_����Y�W{�~b��eA���0/uc�q��؍�зn���Qz�]��Xq���_����B���z���F�?����Ğ����}�=҈���G�L���ݗ��;ќ}]�����LW�u�:Y��������gcםk�Yo.v�Ȟ��b�]��P�%N�G��68�y�Y���ژ	�&��vq�T^�ܦi��^�u�~n��|�4z?`�A�Щ����)z��������v��˛O�>]�}C}��{�>�ѓx鷻���w�?��?��y�ޚ��`nSߋ���Ɵc'�_��.����v�5t��'{1��3�=ڡg�|��d�8��ƬW�K4�8�M�������hc��>�]}�aC7{���������������7�h�Ov����*�����a�A�E$���16�!NyU�Ũg��z��c�ϊq��Fvq4�.r�l��XX6h��k�°呟z�*�w%;�ȣ;����ͧ����w��ty�CO*�r�+��b#>�Q���g�y.�� ��Y�:[���쯡MA�m0���NƗ�~^��ۤ�q�(��!;�إ�vq1�N㸯P^��il�lR�O�7��ua��j?�N���m�W�>^�=b�?=^�K@���*{Z��I�������.0+6�`b�vT1�=x�}G���鬝f综Uc�BEK�O�P|����aZ���Dn����;�.�3̃o<��3"_X	�U,�L�,������~���m�ņ,�8(�؋j�Ӎy�N����7�ug��1X˶8'�ͱe�B�[bdV�7d1�,M����i�o�lb�N�<Ytm[K���o�o��Ѻ��c6�7<.-ܩ��cK��ݪ����sT�S�|��e����_^i>�>c��E:�.��Nv�Xbn�Z�T�m?��h;���i��z��7�pvmb7�ENL6�M;E��<J��Pb�b<;\䧞��e��֚��7����ob<�f:4�.<���㲑g��[��[�n�E7��5���Ս���:��gJ.Y�Ц�gv��؎�v=d}��*����}�|����"9�z���y,�'�8�<K�\�z��m�������\��z�����c���R�X���o�#�0qv��in�Ȅ�<ڢמJ�T9�^̈́5Q��NƱ�1`�=�SZ
��dk�z
���\�l�e(rS��f���37.�������֡oy~G���1��%Ib3��T䧾���͚���ݯ_�>+1�s��c����FrLk��S��.h)�z*�I���C�٧t`��@=�z�-EhM��PʺXO���}��c�F�EK
���L�uy�?��,�B�}��O=� ��#0kr������8�?i���*�Bq�i\{����3���J_Muz��D~H�'��nH	����>�����]�ΖT�,�@b>�X���C,�Su����q����/�#��Ә�տ_�,U��{dCL/)���sd���X=�?[qكba쿜�,S�,p�U�Ix7�S͕Th��HC3�"_���Ԝ�IG��pz=�v���]T�G��G�������7턺�)Y��U,���˻O��Bon��e�~_�9�]T����H��c�?�Ɋ��=;���믻��]�E�@����&��cc��]�ZFB�<-�V�o�ю�3]�Nz @&�\ %R�����ņ �d��P��o��Z.j��vw����'��{Vi"P�Y>/U�oM�Cj�ҋ��O�M h>��8��%R'y�&t�6; /^/���B���G�M��D��M��:������O=��5�~w�x󰻺�r&$Z�.��������)W͙��]ό�FmҐ�֖����`=[Q�|vd�5�s�k�=�<��,-X�Dr�N1gON�ı1�Z�_F�ѵ�4��p����X���*���L�������dMJ&�]��χ8�E��ڔـX�������-z}t�Ι�"ߟ2���06���p��m(�S�yY�8����.�#%6�R�O���.�����d��Q�D�i"�\�+�z�����jM��=ޕ�&{G>j9nU����������.o9����C�UXAo끢@_�L;�� ����z)r�� �Do��#�R�5=��˾�&iH��En�1�fh�|jZ���3���O=���n;�?To(nwM�����-�g���k��Y�Z蓙�^}m��Ӌ���Y�OzJc��.;�� Q��œ-��Rb�T �"qzK�)yrX?��bRt���z���f\����a.yrC��ILY�6D�T�ٗ��H��Q��+ I�M�i,q����,�]��_�$��'Ͷ����_��&�.��>�pΤ�弅�Q�%�*�6��Ѥ ��/��HZ�4uز�������B�1�,B���;ҊIA�J��*U~����Τ�%���� ϗ5k�U\T	��F|��
[c���pO��\G���s->+���	��i��}3�l�����!ǐ}%h�bPrӄ�ؠ��V�0��Ty���%h�F�6�$�1����ogI�5��W��X�{����l���H����$Y��@cdv �Q���blU�d�$�ɢځ>�q�����ږ�l�����YXꆮl��S3��eW��^ �fб�0���U���U�w�o4��)�!�Z�nHi��M�L�. �/����y.�I�H�ѓj"M�B�fˋ���q�˨XֺL�+@֤�:�� N&<�4Hi��iΩK�)[���[�ӻ����1���@��K��Tq֒����ة��6��苃T�#��DKA�jT	ğ-��&^p {L5�4�6 �l Gp���:�ȩ���'���ؾqCh ɻNu�0F��-
�"������_iia�{T�����(M��,7a#��CPR�p��5�
.%�9�w��|��y����=��5�c�	U�t�)
[� 쬦����L�q�G�w9KC�I1����zCL䮱��Ѳ:�������|PNPb_0����gsP2��d�r�����5�@�'�)$�&�GA���x����������r5{Į����f�t����|O2���ͯ�J'�O��O��:v��EM�J�JV��8���a��K!����du�wt!z�����DD�@"����y�.�}�rf�;}Ύ��m;Z�Y8�>�T��>�(����!r �a$�.�Q�jCC�uiaUM�L���ƙ�23��$���G���c��-i}?#�Aa�z����V���M�d�|��H-@ݦ�S���S��W��]^^_U�����/�TFʞm�æC������������ G�!����!�E&=N��f��+��ID���	#�F3��45ڥOr�DG6S"O��K	�N�(�.T���ӂεȗ��*nm�|�	A��pӔ�R�?7��+��<�/��ۅ�r�M���9����58�����[l�T5q�������ݑ�h��3Tś���������[��;���8���Hs��H�/iO��س���4�#4�ЮK��/�I�@���å1��*i�.е�W�E     �68������bl[��`�@���]I?ӧ�dD���a�R���o�"�\�Ã�(����.�E��
�{��ً�@`s��ΊrL�Pv�D"���z����R6�lS��~b�e(�Z<�[�TK���]�xGԻ-�'��	
��o��z�Fq��QB;{ Z5����ӊ�����$0���S�yn-+�Y��'A����j	���]	T@�#�ź�U� @��:�I��q��FT���c=sg:~�����K�Rw�sPF]����~[ŮI��/dy����<d����*r�6����Owf��t]�v�g�f)d����s����xM:<�
�:w-�]§(�n��?�FW9	y��DU��n��w��s��;���
h��s���'r�47���U�#��4��ʣ�[d��7�:�%�O�z��¬���+���˂�&�`Q.*�Ve���o��!E:�^��\�#VŠq����"��Fq�Q�C�F�����i����g��(�� �3pBq��z�2��>E�Ql{�y,��̬#cS��8���0��H��V�谕���­�/��gjHq��?�#�c�dG�/��x�0#�ӣɜ���]���w��n>14u�[�jO���tv��c� �I�Jҥ/�?\�M^|�J�|X�CXj䩀,�'�3eW��� �����CCmP�,�0Q"��S��*n�α_~�U�>��?⣊{ߧ��o١u��{~���Z#�v
�-Q@ ;�DN]����:���3��鋓^��R �1�ł]�ŏul|7��Ɋ����N=�@qB�n��\&h��u��Iq�B�Q���*���69SqY�s@�O��r[�����'29p(�?��A[��02#�"
�-K#U#����qI�����qG1;2�0�����u��V�\?0�A�nK<�"I�*u5q%W��}��۠/�r|+W��$jM�&LS���4�qE�U���� ��_���^���z�u��������.r,0�i��~�\��ǻ�p9_Er��0�q!_og;�!b�/��2�����S�wL�՗�<��jwS�r���xp��f�@��蠴=�����i��^�a�����R�,:����R����7 ��"-nk�@��.=_D���NA�H�H8D�'���f��m,-#N=�`�
M��a���}��/���k��?�bTqL5�����х;ئ����=\2kww��D��Fn|�-!� �P_��=�0`JS-,=�} ��!�ݰ����M%��m#�Y(0��6� b��r��]2��q�?!�����SzK����CŁ�Pq�����f	el�>�0�pV�^�z�f����`&��@��iasRK!Oz�k�q���d��&�(���L��r.�Қ-�5zK�']��@���Gm��A���{%�&\��gA5�`OMH��u�1���c�=ܐb']?t�vV����O�����*%|�H�)�u���D� ���l�x��=E.� i�m!5���� ��^���	����ʩ71�?���f�D�4��8�@�YFM�r�%��/����!{����Z�¤��>��D��1UCv��F�Oa��Ɠ�X�h�O>�Y�$V�s=	o��0[
����l\-Һ�11��%���t�H D1�qd�ȷ��F*��IX�vL��\z<0�"g`���e�T��\� ����I�Z<��-����،���"$������t��xF���C�I�c
�ٖB[T�<��q)��I��� �½�6�UN����-֞Ω�gs�ŐE��J�T9$����U��"!j�b��m:�jXo.��G�v��<Ÿ~d[%D���S(�p�F��P�mCMނ���XXfЈ�B��g"��Q���Z�Wˎ���0N
%�d|�i�B1.r�3��L%�38���������C�u��'���(��(v���v4e�Q��c�?��
^�'�U �P @���q]��*�8��r�b�� �|R9L�,�峁]�kҎ���r=�M
����S�ߺ�M���[�덫��*s��������&"�
� �0��
U54$M�*�-�͛�2��:�o�E9J z�*�P�k\��j�UK)�S[[87��nc
�X<b���[�Xm2�	+T�O��Ɂf�ʩ2Yx��|=3s�֗��#�|4)�Ky��e���kR��ޟ�53�w��^��8���H�h�Qy��1͒X�C'8���F��S���_ːw��ok�a0ƞ��FˑaT�����e�����
���]�{vV��i�C��{��i �h'�%��:�0�)�r:��j����׏-��[��"׃��%��l8@��zA����N=_�I���UqP���w����W}������T'8�jx��\.Ie;ʁ̜����Ț�� =	߁�#�d�<��85�x)DT>1�C��dNu��P9�z�gj�2�X4
�$
�t�?@z�B䧞\����q��C�}<�{������\bE����fv/��h���1nNƠ\=�� !�fS9󅖹8~�$m5f3�Bz��\�������LK;S�5��F�,y��I[)��bׯ������߳��?�oo�+�V�A��9������EV6 ��F0��p�"A/����C�K�7��@�� x��������� ������!�zA4rTά���(�T~���ؗ��z�ۿ]]_�� �+�[�]���)��7����~t��2o
�9lhf�rj�PM0��8yo@aZ3���-~N��&)S������H�_Tę  �"��&-��*/�񌂤�gf�sd99�
	� �at3�)�ו����ݒ����~�]__����aա����ѣ̷2�?ǜ*ᄓV�M�r�K�45�Ŕqs*)��L�o%�0&
�ꥴ)I�H�C��N�rHʖq$&i�T�3G�HY7��xކ:�O%��9k ߿^��^���������������+n.�w�ǝʲ�g.UI���r�j#S�_���dxӃ�m:�?[�A9�*���8�Q6�~D�#&��
+���P��3T�`ᭋ��G��#��t1�=�=�&��*U�^�i$5�zn1i])s�������`����rm��C�rEђE�h&qA*ۚ\"�?��զ�&�����$����*K����B#�����v�\Ne ]���IN|K��4���D.��|�����@�+'�goW�Į���|��2�&�V}�O~��ƩG���Q*U������A���kN��2�:��I���P9� ���9`i�nU�s�d��U���Z�;K��Ϥ6�<%#���������5~�FUow���H��H^(����>���i�\��@�7�q}����C�POP�Lu�r�j#l�:G���ꄩB�r  ������0���z�B�gx�&T{���[䥬���u{4���w�T>��$2����L�pf���r��é���8U��~up%�Ǟ�3��p���ru�daR�e���X��M!�����~��n׼b������Љķ��^������	NB2�� c��/`7�C[���\�Ξ��� ���6�g:4T;�2r���7a�����B�"]�$'
��	�w��Q9�i8�jϜ�'IH�PP�?�q*��^�U�1�hi]����f������i&�s<�2�]ʹ��eF����<��rEĆ9c�{��a�����|=c,�m	�U���S2CCN�glL�}"o)��X�"�`����S��]q��)��oHr�0`���?xm7xC��0u-G���<��#g�q@ϗ�@����^R�*6����]�e�����[�Y? �X�+�a�e��iCJ��)��rw-D(�_������:���P�����#����1w3v��xH��t��8�3(8}8=�,����8q�Ⱥ��bh��s*�Lz�؋�Iw9���� �  	�(C��I�K��q\D��a'��r=~��ÒA������S�T�T;+���/�t���P���،`���P� '�����	���t��SrN�����%rv-�XH��×� D�N��	�m "�A���$ �qz��������¯ݧ�O��Ok�p�xd�衛QF�sF�h	���[y1�$��2���;�|�N	�He���d��	���z�'��z��{�|n?�3/T��6�7�q���~��uG�˄��u>��^�U�T����[��o�U���M%tX�:�)L���5+�G��BRҞ�� ����p"��G���H���-���8ߥ������Ƨә��r�>�w����]9��=�q/2z�rN: �ֲB����C�@&�:2Uh:{eOU�e����̀�j�痠��C��	,�S6(�c�� *)!F�]�\ΥDd�j�4��N���f44��r2h���P��=��� 3T��T4i�w��I1TRC:�MTF������#g�`A��T�S[H!�D�+L1����+Д��@�8�H.&츞�!hvaI�GN��␥��,�)}v�\z�KlJ��#!�1�ZB,'9��$Z�Q ��I��q����g�����y�rR[OL
�T*1 E���y>ǆB��������o�)��N��N�=��y�$�r��_w:���9D�ʞ"3�T��pn�G �L'�X���R�˹r��rJ�RC�������9w·n�r�&Y��;@~D¤r�d6<c���*�Q�$10�ej�����������������Q�����(3�\��<)��� �3=i)b�3�uJl���WH�J�B�� �'?O��[9!0��-Q��=4l)��z��a����O?|>�򰅱dH�ߨD��ia0 ��"���.e����H�J)BQ����P$��S��FyQnq ����ܘ�Q��Jq���Q&��< G�$P�.�!�2�������@�Uo����Q�_�ٓ���\�:/���̤b���è��8}IfXd����� ;�E���ၻ��D�E���,Y�xl"SjPMDn����μ.pA!B��S9�h8'ld��{~���N����������|�w8=l�I9�KN�a΀F�<�d�T�.r�Ő$�6"D~��Sf�2.)�9�3g\��i��cX��?�n�w<˯˟%3��sn������^��@S�܋c�S*��"?���,|�r��
��A|�~�E�+��AFU8ن�
�Rcp@���"吏�Q1��6��\?Ig��W&��*��G�&�������޷��N�u*�Va����ä&����Tؔ���'�:@|���?����Jr(�29��nz=�eN �J|�\��[����D�Hu��U���	Q����ޟu�.�>ܭ�֏�;��Ï�/м?�# 1�g?��_pd6xε!�"��h�%	����x�̺��8ʸ9]�{��V�d����0 Tq20�B�&�����iδ�G@�x���{�2����C�j����˧˻�Ϸ_�l��AB�Ks���3��7`Vi��a�E#� 1pR�yO�p�� ɴa��і�9N�v�l.��%�y	"g=<������!�\������7z[3����M���G�m�(��x�~r`�#tv�/��mGW�$"}�Q�rf��JJE�
�t�K� +��.�a{9�h��.�# C+R�J���T��P8ɝ�>]Ri^�(O�Ły]�=�s��Ӎ�����۬�J��.��2�Α�����D|��[0��m�R~;����9�Yd+&�7d���lS��Ղ��Ǡ��m�� �M���J�q�����2!�K��KH��zX>�[�`��rf����M�q��h+�Œ�� 3���-���x�@�̅R�U���Գ�G�XùiB>�o;  i�B� zY&�� ��J(,�{:�]�X ����qJ��Wj��{�0,�/G��ՁG�J��9Ǔ|���KO3��o�*gS�`
0=�wRp@�r�~UN`�*�j�6��ͻ��8��H�_ �7�ދIڡ@�4���<4&a�wړ���L���'��L�?��Zq�kz?ZPFN0,��������?/���?�lh'      U      x����� � �      V   W   xs��+I�KW0T�L�r�r�8��c�d8�D�3�˽4��D�#���3��75'�$�_�3�1r�ac '�KW83�b���� W��      W      x����� � �      X   A   xs�K�NT.�I�M�S� �D.G��S~QJfL�3��NM!ř���W�S3$�+F��� I�B      Z   8   xKL���S@���F&)i�&ff)��i)F�i��F�I���Ii�@�\1z\\\ �/      �      x����� � �      [      x����� � �      \   "   x3�N��J�T .#�'1������� �\      n      x���vWr��������}�ݾ�}�A��H��5k�$��"�����9�b�j@���%/�V��م:��׿ժַ��:����_��m�Z�M���m�[e�I�h�q2�����s�|��R� v�MƎKgb�^Y���wپp�GS�a� �A��$ן{��U۪n5�밹��5o����ꧏ�Ϛׇ��m�����~�o~�=��y���/+�~��?+���]�U�R������8G�u����{��h²��;���.��n�EZ{� �.ho������/�!z�l�n�Lz�v��nj���|�s�O��W������a�����/����m���k���ݪ�����N�uu�*_(���"�冮[�����0�z�b�Z=Y>�n���?mw�o�&V{��s���r��z3����l?��䳰��w�f{�n>��]o>�/��G	���!�J�%��E��⬝��T'9G~�]��rn\b!��ݒC�齚m��7����f{o�`��U�Q�� ���zE6ϭ�g���/���dܞ���o^�>�?6����_ww����7�}���K1�9ΐoG�}��)	/L���.����/��`�P�6�t��<g�vs�Ǳ�OS���2�e��}��QS����������<��xv6��Sr��秐��绛���as{���������f�^��o���J��&�'�C��OT���i��B����Q2+�ݢ��ؑzԩ�wc���ڃ8S�D)�S�g�ع������S<�Ջ�MC�m�%�~�ܾ�쉩�A|����VIzR���mwR�MI@[�N��e�it�j;�C	����=Ѡ��g0���m�]-�`4�3f{��*=L����T��/�Z����\��C�z��(������������H�4�Ҥ,��t���|XK��M�X/�6�O���d��]M�xo���v�N��5�����i�^���Ó=���H�.%�V��f����f�����e���R����O��2g���'/����?��n~8�g��g9�n�̿����puX_7/׷_�^%W�y"����?S�ȯ0�f��	
pMi�ST�.j0U���Q9�uI<�⨍�S�l��zo#���OQ�����x���4rQ��{~�T�z���G��6����U���Y��w�&�}�1m��'���;I�� U��,���M�k1�qIf�W�TG7:���arx��~�����⻾��Ut�i�Ђ��\���~"�8�k��{��L�ո����M)�]�fs�>4�Y�=��~�|E�:�
�\WH=�Ɓ��^���[?̹��g�*vbf ����V�s�S�XѮ�q�v�u�Վ�g�W�!�����3��@����?ܭo�o��������T��9�Y�Y�K�<�IW!�eE�jJj4S}���n�<�'l����
�h[����9aR�qƖ�g�Oa`�	aI6�/'�hR%B�Նz�"���������v�̷��-}����:�&�v���a�P�
'��<�E��_���ml���2z �Ȭ"{\f�@��㠻���h;"���m+�@|\<6������~���c���a��ܟ��	,`�|��{�zG����+c��˺��Lp��츘%�#�X.@6�iֳ�J͞�S-��L�?���ǩWx$��������wCm�$.O_����@��כ��u3�7ץ~��<�OL�>�|�Q�BU�	�N3L�/K@@����+	ļ�Q�
rW[:�Y�9��v�h��-�Jh�)��n�}��)���2S��f��A�����޹狇�[�ܼ�|l^l>n��ۛO����~s�}�r���R��7J�=��QA��t+�����>���;;�����<�Ny�5}��.���4�H]/�2�u��y�>ۍn���ڿ(`ܿ�g��������~�Z(`���|�a���v��p=L3�֟��O뛷�&¸<�i:�h�\��S�O�D$�@3_��BM�Щ��@�����=�Jpz����f�'uLH�a�HOLp��sTM��6oG�A���*�Q���cG��Եs�G9:���a���k�nR�u^7���b����yy�����}׼Xz�|}{��MN�������4%;�t�3�9��F��Ç�d�Z7S��f5j��2ˏ�������RcoM��������g��gũ�?���h��Л^g�/^k�jj^l?)��e��eq�kl��p���WWWixP@�mO¬b����.�������l�yf�����)a@�b�Đ��s�h~�n:��[_;�Hg���8@���Ի��x�-|`u>q��/Sz5m(��O\��I�h���D^b@i�+�w�ߗuBFݱ ���sj��ص�:M�nb������%�r��$Z�w�#?'�S�3��`@Lȁ�N����֌�@���瞟ɯ~Z�NU:l�mr�q���v0�%��[q�HT��?㠙��Q�+�!Sz݇�51��0�+sq	,m�Bm����э��O8��#>`5xX,�}i��󓃺���������fS0;s1���Z�����к�#*S�����-`!W��j�<���AA�$G�D/T�T��c��CJ>�<h�,Rp��O���jԘ똎�}QLӔ�z���g��Jן{~�*d0����fs�v]��X�N׼���t8�T�J�s0^�C���w&- `B�#<��W�����pV��{CN�r�w1�8��ج������S���}7vV99׶~f���T�`�����qz5�~���aw�� �}�*���
W����M�t�eCGlU����L�@��K��q}��ȴ��r�J\�g�@�0R�-4&ܸ�&Z�:8�G�M����I�O���j��L�B����'�ļ�A�7?o��n�!U�<�<_�D%�b���%g���wmuR�$M�JIx�r+�L:7��G�(0U�i�{]�g�B,,TV�z��i5-K��6�)�����!�����c+�Z1�����MZ�^��W�w[�������\�OP�T(xD�wV���]�I���K�;X&8���3<��\�m���s�@@�w-�6R_������ t��������?����4�+���l���L~b�H�}�������>ͼ���w�c4zd��3e�0r�#V33�e-^�]��_?I�)vY.hh_���Ǭ���<5E������/n�~5��v| I'$��%��,��qP���f�(�M��'��H�Q�����ؗ@��i69�=8-�˦EZ��ؾv�H2���S�MS[a;w�w��[!y�0㑯��K���d?��� �6)���=L�ǜe��A���a�P��B�זV�s���rͰ/�l��~r���	`�JP���2��~�2-ߴ�*�s���e;U�*�<����\�9P�e����>:�~��|s �/p����|\��_���]T�/�M7[>���yTv4�d�~����m�%Ҹ�/������6~��p�m�3#�T��m��@�����w?�W<|F�k�֤U�ﯤ.���N#r���W��Y��4���N��[�pp�c�Xϸ�P\H)�����G���X�sE��� Ѱ�Fs")p���B�Bc�~�eR�;47�=[��`��ݧ�jھ]�R����E����]��V��gZ����c�|�ee�i��"�����$D�|�P;��]\,�x7���W^��O��a��3$0-:����Bj� kϧ·L��8�|q���_�w����^6>?�N����?�'@m���;�#A�^��eеD��@Y�~�uFv��J��m�t���6GN��2O���I)O���ceǘ�Z�o��ޖ�G�{~��'�~`'��:c��<%c��-�_Ul�B[&�����Y�}a!e��A���A3�@�!�`D�r��<����҉��Be;$s�c�'�x�b�X����ɍ3��X����'_�ի��;���~��l�vo�s�v��̞pQ	��ʦR9B^�a�uk��mdd7�f�a�u��W��9�m�fd"v�ǙF0�$R0��j7	S���0_,ժ�����3�O˕��f�Qh�7�Oov�R����4� �  Jؕ ���a��~b��7�9��Ec@KZyMQ)�Ēo�!l�	޴�Z�WM���aD1�c�1XV�׳��vjǴT��:�թ����������S(��S����XC#���|}*��+e�es6�Q��b+�G��؋>Y��cOm;��8j_<ނ���D� �{er*	� u(K������:V�fv�~����V����,�e�.����I�2�!=��
�t�r]�mK@�6w�-rH�X�:j��s����������"���܈�Zؔ)?.�i�|=�r�r�^�٨Yf))G瞟��#4�������%��)͔�P��uu��O��q�s��X��hsq�>����P��\�˕+�'�QPO'X>�"hhf��&V5D3P����A���T,@h�Σ�b�Q$�t�3�O.�D���nI����b�!E�۴>;�fI������S�e�Ò�,��	]d��#�?	9	�e ݌���E��¼T��M��R*k#�ASR���~��A5K~�{���,���2���ޗM���Mr���I.�x0�`MU�y�@%�/+Uh^�`I�U���vQ��}m���ĎT�e�/��I7��#{��PH�@Q/�	qEe�Ȕ_��������/�r�K-���y\����e�|�Əx�-Յ���,=��Hx�������^�^�ڪ)f;�#�AM��d���E4Z�lM!�m-� ����x)��4���瞟\�W��7�?m?0Ƚ>�ׇ�9k�u��cj� ����.��=�����H5�O��54M����T6�Tk�� H�@��(�l,��S)��ƞ
?�@��	h� ]��3<�,��g���'g���2�}��@:s�޳��a}����#���:�	=E�� ��U��.9�ǀAHd;�����%�)(�-jt�NY���;�9�i�,�k��e���E��r���'�t����M����-�ڴ�G�xR�AG�����.��c��q�P�˪�P��L+�3u����(&43��iqU��4k�_o'?%4�V�u��-�\�8��5^����܋/ߟJ��-� R�/�1���+������(`�ꯐ#V�!rjq� ���Rr��	%!)^���6��y��(��n�4�"p���x�d�;YÇ0�g;$�"�F~g~ʒg���gI�=_|��մ�]�3�?�y�����!ٛv�pKd������������T��F�W�+�?�gفs��B0j�s����V@���U���v�*s��#bG2�I_�8��9[$�s��h�*��ԛM�Q�4mق2Z	�F5�hu�q��oj��ʜ�ޕ_',
^#��4c���L�С�����U�@%MvT�zુ�2��C�G��9,�D�)����a�׳NeEB
Ol��{|��t�v5��{x�t��C�P��
<#h�r�3?���<�x��m^��a�/���t���^�����0�q&](�d�q>yP,|���zaX�WE�����	9�`c���§TE�C�F����hc�z==�*�V!d����)�(u�'E�!�@��J^�?�|�T�4��v��r"IQ�auN�W-�)
s�^���>� �3l�h 9�g� ��B�YyȎ}�f@�(v6^�32�zv��{�L��-X�2۫��Ι�3�O��S?y�el;&�sN?\o�Ƹ��e��Qz���G�
��`��g�|����G�ಱ."�gS��?�U�O���Ȳ_`�K�S�҂U�lGL�0��X'ߴp�=�$]�f�0��zH�LW*�/�S�������O�~a�T��N���RPUb�م��R�MC����Ca�8�a@�ȯ)F��>�ө�N��	���#�t	�^�uЙ��M���fF��!�+��S���jGõӌĽ{|�c����A#�8h"m�ߞ�����jZB��K�Ű�Y���eais�qL���DRs��Z]�R�(Iu�u����Sa���Kp��n9��,�� ����ogǇ#���� !�.:�O	m�����WU�0�b�����K&p,�zsϒFV�eNn�	���XM�	Y|�n˩�\�@zȣ�NPۅ����V=i����]�|ʦ�-���:Z��*tU��
�)ݛ�9# aw��o �9Λ�����&��Ng�/�B�7Q�8m��t��<|��5R*n쭕H ��h�J� %l{��@�(a�V�7�= ܆�#a3��P+�e�b�����8���9��x&��27N�1d�$���`jWo6���k�[�<y|x��`��n�.��M)�E�=PW���λh�6l�Q����h��3�nN^�v�s2�gv���R-dU{��jGՍ~5��Y���V�� _��0v���q*/�2����aL%E��OW�#�������z�KXLW�:l]'8��p�8`�OlR��b0*xN��lG�ݣ�(9aԁe��̩Sգ�xn��E�n8�����xx�����!�`��.?}0��ٞV�-<̇ؑϣ�FN⤜g���AO��ܫ�GD�������W�S�rϽ�`8���F�M����'3��g���C�H�βz#<�C�>VĔ�e����--�Y�j���zj8��*��b�xoB����xLҷ�g����� R����pE���3(8����;�|AR��!h�|=������'��%(�t�s?�xעL|ތ�]�dמ���=6��6�^2����<�9.銎聇
���0�c8�1Y����P��7$�A�}�}��/v ���x?�A��������/~��FR����V���n
��%	wᾗ�	p? �sz��ꑿ�L|wnL�Qu0iD�E���C0ֲr��KV��;sĩ����]%(t��L��._���c
�6��^�Yf�&d��Ċ���=_�^��/�Rܣ�n4�i!h;'������e]�T]˿h-e0��&vDZi�7 T ��o���W��Z�K���:'%(��^�~���Mm���,�SՀF�R�^O
ř�����y�?J���9 g,5�5X�<�_B���9 ?��c�j�?gu�?��v�ڏ��e5SAy�}9Q�-�ӫ���s㳙�߾�)��6F9N�g=��Wt��sG�2K�t�U"�2��_�e�gI�h�m�
\�w,"��.��BC��i�c��E��� i��(uY��lN�����?^��W�߮�V�3
��,�x���:}�L�����ߞ}��7�8V�      ]   p   x=�;
1���U���T�B���$W����X�{��gjW��ϛ�afޅ���bV�K�X؞C-X��!�}��j$g��ǵ�l��:%?+�#�8��g��z����B�$�      ^      x����� � �      _     xuVMo�0=����sl��j�H�l�S/$�"vi�_�H�\v�a��oޛA�����6[?���?B��\��z\3�s0��c۽o��5|�,�(�馷�S.�kyTtn�W�x��+�\�~zi�v�\	Bj.d�_�b����R�q!;�5|��Ǻ��յ#���A�g<4)	��h�'m��mi��9�|k�s�w�Px3W��ǲ�i� )����N>"�X�r����*�Ϧ~J��9���?g��=#@��hB�6�.�����yb*�5����=�ܗ��=d�צ9���!�J'��:W	D��ldN%�JS	'�P](��N=W�L ����ƙ���eD~Z��bS���}u�WW�V����[�������H�.��I�z�%�h9L���	^
�Y�yI��"r�y=�(#����هD��#�Ç�W ��6�ޅ
����h�EM�t�5��0�8G��2vtu-�`ra<i�(�⓱!���B��ؾx@�w��J�-
�^U3�HlI��s�Mݐ�\���}���"���N8R�av���k����i?F�_���u��m�$�������1T(��!�_@Ƭ�A�����9lr��D��yl�&+�
��֨�R��S=���f��5U�%��0B�0v����?���Ya��AöL)f[~b����H��������
VVp;<<�g;����D;�4�r~���FKx�;W�XݥHǖ�Ԭ��W�2b��i��~��p�.1�q
g����0l���"1�h	��'������:�      o      x���rG������w&b�[�꾬���a�g'17�ő`I�$핟~������ &�Du����Y��_�6�mn����f�b�[�/�w����Z�������7ן���#|��^������:߿���m�_�ܮ�{��JiT}��O������ߪ��0'�u�{�̔�1��3a]�U0S7[ol�w*N���G-�ɲ>�nY�M�}��NG#r�����F��S׹Q9�Ǩ������+���O�<��ko6ħ믮v��6�/+ �">�} ���l���W ��ʎ*�QG0�`K�yʣ[5���f�U��7�:=LI�i]��������A�Sփ��,��b������?���o�o6�/6��=u�����m�l��1| ps��f�7��. � ެ�������kQ��R�"�q��$�wMC���%�2  ��q�}�r�]�f��<�"�av!M}n��=���~f�h���\O�k��Tx@�?�� ����O�������j��WU|�z�R�6XG�U͘�|��Z�����{��EP��̦���t���G+��r��F�����)H�G�\�\N�������i��Q�v��K��J�ݕ�g�/PZt1�>����޿��wۻ�6��#����6�7;��ǭ�]ue.��ɚ.{U�u�`6vaR�c��'5�n����G�7�4��u^��� v6J�\�]��g���n\�[���/  |p�M������z�����u�JEo��5|��/o�6כb��,�B9�9vy�{tL���aw�1]��x=�r��4���9�g����AC�w\�G��\�r}���1����J��^������������z��ݾ�^h���H��7�+�~J�NG���ǅ1:������)�Ԥ*T]����B�ц>��a��wa�a����C@��
��"P�G���}�k�d���J���^��ѭ����-�#�����f�7"����K�q�?��+u�Y{k��U��7ǡ�9M$3�`R)���E�&7�	��|�����"��y zԹӲ��������*��ǑN�/���@-~���v{�!WM|��2���nNn �[ֺq�*@9�I�Y��n�,�����r����,� �#VW U���E���49��"?�� �wW?m�ߒS�\oެ������u5ab��_�}`�f{������������M��ګdRJ ��Nژ9Fb+�m�!�i�rTU��E�:���"�ݤ�)���U�MC���f���F�F��ۿ �Ą��H�����*�"�P���}���VX�V.�z;��f���O�vGק)�D�ޮ���<�*'�y`}���:O�I�e=1}Fbw�>i�4:;NT-���_�����w$#�g�o7�pa��w��a�E|�^�x%���ђN��.K��lOX��+ �����<�P��H�3� ����F����OC����t]s��æ�PBJx�5�G����桮?�0���FCAqws���5e0��/2Q6��S��Fb��օ��ZW�������zKQo\\x�Un�H�rz�dl�#tP��y����Ğ,O4k���hf�l@�<wu���p྿y}�.�������R�	P�P�>(�����f�Q���q�����ޏN+��p͚0:�a�[�	��U=���1�Ԫcr�������Ha�Hey}�B ��?�����7���z[��ư��mw]E�o��h����_��q���g�_������x��_��4�fh]3I=+"D2$f��yr�46�$�b�$w��E��Wx�����1$������lHS����,Q��=4����(�Q`����o�o����������ңA	�?H\���c�/2bJn�{�کު�Foǌï�o�u�[�܏:?r7W��lɔ*Tcu=���;�Q1r�!p��\�z�h��w=��@�$aNo����ڽWb~��3&���������	&ЙǉY.�u�d75�5�d�7�d*�T����(_C�w$�z�ʆ��)Աc�4\b���i�;XKܝ�z����rqZZJ}}n��$�_�=C�L�v��2������v�_�w���:u�����E��W����??\���+��2E�6$Ǎ��,m&{��� WHI68嬯rO������3q�Ͻ]���8������!z�= �<Rۤ&���E"_�S�Dn)�{lPX����q�����}�� ��y�<�<���_�?� .�Q��Y7XSV������h@�0$��QT.0�3$�ȍ�Iȁ�T�]2$�"뭇�	�D���dN��C.۹���1 �7\o�Ox��-�7%��\�/Pg����ya��U ag��5� <dz@z�rZ���d&���`0�EC�S'�I��*?��?�7�w�~�׿Sa�*-������jH0����S�tf��_ �H:�k�%�d=��q�����������!�g�?\-�x����� ؚV���O�\5,�f���(7�i6!dOXf�&����u����0J)�Wl����(�h�|��e�0��Σ3.v���8�����_XZV5�Nw�����2�A=���jP�{���d�{%*[�"M�/7� �i���Dm�g����{�'���u@�|���a ��t)��(:�v)&��Z�1�R�Fջ<�4�|��!Ɓ�M	Y�Y��I���,����඗�=�F�F�lM��ݟ<�=��auTv>�q�����˛�q��x��+��O�O��빧Տ��Q���#��k,i��M�v��h����^�Њ B�ǻ��"�|��\�L���v��vd���G3R����1ݠz���iHRj� �s߯ *i��Pf������մk����R
�*ś5��򹻛u��5|��_/d���1D���t��8f�ӗ���F�4퉹�|oek��>�ךl)P�ujг/y��Ox��T�%�U44!�|����/P*!Bқ7�tp�n"�\��
<܋R�.���0����O��v�5��,7N?wB�6���Pc5�S9W�
9�Y?��S��GV���q����i�ۿ 'DH���T��Kq?I�G�L��s�W�-UmYZa��DS��w[U��Wk�\XUىS��6��{�`4:���*�8@Х�\�Wn���2�p�M�Z�F��)�{h��vB'��h����9��R�������-���V��]��:ؾ���+�^��m�{��+��Sy�V_���d�=o��Lަ�k<y�miu���(��9��X|�B������¿u�p�Z��B<���0��V-M�<EV-p�DZ~�~p#�3Ј/�?��ˣp�r*���7m��_x��2�2l`#��h]{��(v�X_��a�F��o5`��71�Dm�`����3� *�*��-u��鸑���M�o���H�gm ��Q�ۿ@)����=^���Yp�5-�����z���	+}=�4�?���n��C*��3��T�V��cA�@G�9ź��L��o�
��R�O��[�;���>����/�irϷo~��'�NF�֫&>���Y:�a�A�U�ʷ��,~����%�P���PQ��@��@M���y���ʨ`W胴��y��7��C�-c4�Q�z�x���U����/PJ_mq��]�Қl=�=r�/w��\�e�޾ؿW�g��~�||�>�R������v�=��g�Q��D@ΖV�*bo�/�B��"g^�N��=�.�[Y��'��=�~]o�	ݲ�Q���ֺ��	�?����qj7�-��ФLOB�ʋA�">£j%�(BU��;!�,~8��|Mü�c��@�=�(}��5f����ZA8K�m�tyѺS9e��$I��V��$�]��:��8#5U���_���/n�o��7�Z���w�x�Yɻ�/񗕄zw�ӫu��$�"X}�;�\�|�K����� BS&�v�y����w�H���s?n$�d�%w�y?�Ig�t9E�N�oi)��T��O�/ v��������T� 	  �VQ�η|�?������j�9N�ى����YƯ�PzN��XM4�B��Y
�}�C��44���s�\F�oe��*��h?�[�JĿo\`����/��ST��xIJDYИ����Uqa FRH��H���aޥ�}�Sk8U6��|h#�8A���8Nx�����@��~�b@�C�A�ى��%J�£���'��0'2�~d"�1
Y��$&��h )�vL�\WFCCkGR\��SGϫ���Lp$e��S����Z�*?�� h%�I/�^����WE|���	�u��{:M�A��&�^��v�?�r� /�x8p�!X�r��6��>��(g
��[9����`��*rC'�fܰDore?�Bҗ(�5OOs�7گO�t������_ � 8l^	���)�՗?ޯ�G�0�C�a̍��o��C��˸���@����z�N��:���^��#����'���M��8�Jc�����;ƪ�K�y�"?��d�7��D�=H���">~{�i�����O�ǥ����B���Їe���\�#�9�0�tҫ�������AY�A�o�4L����������Jsa1��_ ��O�����;�c�ݱ�!X�S���כ��������M{l�S����u�H�epT8Z\=d4��r��Dޓ2��Lh�'ñZ�{����R��#ܐ�7t�a�C\��f;["rsnē�>P�	ޒ�'����
�����o��
�{=	�Ӑ#z*���3�NF����Ñ��3OP�3"ٚ����A��
9RC�鞏Q6����a�%��L!��0wx�׹�\�27���^�t�,�Y�Z�?}=�c=�񠇏���@Hf"y��@�Qs*��L�sſ��Ӱ4�KC�Ƥ ��C`��R���˱/2�A�K#��<�\�g���"��?�PR��x�(��oﶯ����Ln<��n�"��]�����44Yc�  u80�lH�+��DJ���T9�G��x�'�0������V�q���~��x�CÌ6�"�E��G��Ngs�X�i���ɮ��|y ���;���{�WG�<��EO��< �1�����tm|�%��mx�����^��!�@C69΄c(v��q�8DƇ�%�dؐяR��nҤ�V0S�dH�T�by �9
�������/@\H��c{�9Ozx �3��n2�W�4$�]^4b%t����DF4
�ӓ�ל�l�?=�!�Prr&�n7��*�n*sҰ�)�-�]U���f�D�S9�L#��3�"]f�h�M�z����b%ee���q���L�£OC���L�]\��OB=L�x�	����tG�I��gH���:]Z"���(>�y>� �?��_V_��W��z��S��Ss�fZ��=qdʷ.&| ����0PU9�C�GZ}tBzù�E�j��G������2c.����eǨe�\�S���a����d Fq�K2�����M�He����}���ˣ�r�cI�Rp�~�Ä́~y�`j����Kۄ�M����ɣ�������簅/hR��[}�+=�˵��L�)ߴ��]LrUn�6`��PqZP�@!��V�J���p�s��9W����gD�g��r��s�p�\_�+E�BE���}?�Z	�i{�j�^����� �J$�Ց��'�a����
����CU�����<U���<ÊV�"p"�!i�/���M��{V�35'9���G b>�g:�j=3(=e_]�8��� �W9l���()<J�Qd�ͪ@�29?A���n}��	�ZƄ��;&��޾8p{@g�� �9iI���_��7�2���15�㖱$��8�vh�ϛ��if�Zr�;	���@���9�p5���8A�w¼E�YR�r�8N�Q
��G����ɹ�Ј�-�s��V��ﯮe�z��i��GG&����0Oq�F�XA��nBy�U(���9�=zG�<Uk����#c��
ڤ�ǌ��28����_�)���U�&�晙ʺ�A*�6rD* ��*2��*�@�@?����0�J�[
[��QuZ=�R�q�3�������Uy0̒9F���9�8�� nYO;"�s�h���ʡUj:C��\�e�I��T9�~�\s�*�4)i�c��?q8�� ����6��9|��ӫ���kR�=S�)�ᮾ��K
���l~�DT�PO
�a��;�8$S�[�Y���vh���r:�����1U���!����h����B���a�>��ބʭ3��/�&�v���O>�?�.��      p      x�Zْ�r}n~E?���ڗ�Z�P�U�Wv�����f�ء�����0pĵ��Du�Oee�<�TO��߯g��m��_n����k�iw{�<�?�>0O�P�4U�3�x��z~�Y�.ۇ������-O�����w�맧�çO��Ol"�(�^t���ߵ7��QL8&"�iqOj5�\�]d>+9�����$o�t�6{�I�iHͮ4�,gkse�Ry���g筣�r�c�;|-(�Bh�����kv����]G���7���?��+!jZ^Q3����f��/�/�u�t��?�ܾ�/��4-�1DrN�6����Ͳ}���6�g�f�zxZaC~^��잖ǙB�<�t7d�Ƃ��s��.�� 
&��rdA3���5;�LsbcT*��،��](/�a����9�6ڴ�:�(�'5)�/ݿ���&�S����ay�������w��f{4|[2�9#x�������=>.�S������K��n7ۏG�5���vG����v��z%,�x��{�S¨K�����ݣ��O�Fx5�f0�|^Tߕ�*.ݸ>a�+l��~��MS�TMw����~�0������n��ù���&��)���1c�/C�G�d��C)ć)Y:optYE3Z&3�6{&1&e���r�l|��0"H�n�q�f_/���y/C�hK��<ZӮϴ
<S�x[/�������0D�(��~���ݠ����v����o��q�o׈�%����3�����'����M]�A\�hqCy�FJ��bN�3���qm	1!=nK���y�}�t�Z�P��l�I^ДPe,��_�E�4�@3�}0o�o�ڎ��&.w�}	%��}�؀F����/:���|'A��2�H
�
N5���}�B�1�b�Is����oF���/�s�3)��(V;6������ȡJ&��[�$�$���}�0Ib
��/������؍w�������n�P]�-�~���͵`�j&��4�63C�nY�쾼4�t�v"f��>.A��8�$TN!C��a;'!1D���fg�Z���s�UD^�ح����>)�
Z�p���h��&���C(؍�G�(����������V_�|͂Zh�4?�������3�g߽ԷG�I�Yr��o��G�d4
O�v%̓fw�)Dv+b���]�%��fׅ$DZq~}@�aL$�#��/ܿ�)�|��q���o��������/�h��_6�k0��W�� ��ul��͸��Z����9z�E�UqW9���H��JYI"��i�rZ:�=�hj"q�x;�e�Y�^4�B��'�Db�r^�SO�z�PBP�EU�����и�ެ
�{q��������k���$8�gN��Y��-�����<�1���F8�
�U�PR3�9?k�X�6! W4N�Y�����o#<c+�׷!�(i@���K��h���8�'������q�L0�\qʘ����>��� '�L��ݧ��~w�*�.ꮌ�1$
�l�M�X�I��A߉�0U���AN���#mK4(sePV�B�*�pe�e�ۈ
�_�eU�.�f�t��&���J�~���#������G�[�TO�ƛ��o9��BV(�ze��8{;��ݖZl���7�/�#$���N:�Lg�=(�X��Y��x*��E����W
K@xk-V�'�2�Q�i��%�Z�1!D��Q�k=ajYa���إ�W4�����/���sñT
��������a�꡺�y����^�^���C^nO���E�	�\ѴHC�hfE�I8M8��h9/P^A���Ι��e"���	��!��]v�F�Q�A�$����W4�Da���^��| �����c������6����ױ���7���*N �F»�����Ԣ�I��`�`wŎ�eֲ����i�HT�F���2Xm���"��f�t��&�I�b��n��>�Í~��?y���?��'��Eס��B"St�Da�R��v*X�{�	!����2��P:���<��P�&O XV��G��Q�Nkk�u����7�������rv����a>�p���a�y��m�����qs������!�}]�a�<�(B�꾇���d����ӌ� e�="��W���0)�y���hF؇����z�/��n��<c��l��/ݿ�)����j�	��_nW�=+:D��?(�"��Mt�G��?�nV�z����D�u�R)+����ڸ�H��0����4A#���Y<��\��u�@��a7�d(���e}9�,Ҹ���_�ES4��lv��z
(T��ܭ������Æ�Iܬ���y��J�t5�P�o9�t�t��z�����o�D�Pe��$C ��b��e�`�(�'�Y!l�WL�9��M�t����n^i�~�[�� �Xh������7T�ۣ/jP��{�����@��=m��x��*He0`G9�ZYr2X�B $�U51A��{0)���9]e�=gd�zH2�;p���8(�e���_�}mSж9�xpɳ�#7�8�����f��G|�s����RH�9{�Q9�H@"J�ĩ���%�0�
�e�Ca"`?�I�YE�_�n8���ى��ng�
�aPñ���+�h2�Y����?F�;T�#�<>�DK*�i	^��8�bI4�<"�mhB��� �w�.ASD� �-�%��@�[؃}o v~��M�u@S��U)Ͻ��p|����oF.27b}�,�Hh������-�f���AX=Cm�N	�ȦB[[=�1��.@"X[O��h؁vFTF�{������_ѤM>z�$xG��?������9݁.1"x[�e�������I,���q�$��(�.c6[ ���G�A����M�ֈ�ͷ/ݿ��
���o���������Uq��Z��u��Y��\{�(y:�����8��v��	�3ڄ'�K���3����u�v��k$�t��&��}5/�O?������_\y4w��ٯ��O�3yi��*���#��
I�sS��EM�o�/נ��7�JQ��V`�'y(��S��_HD�!�9xi4Hl����D)mR�_����b���ͺv��,/�H/!ǡ������h��!2��%R
	ɮ/ir�Kr�|%�OЇ���#��5q�E+-)"�C��(F)�)�QQK� +T�4ֻ�{ΐJrl���6Q����
`[��L2m���4i)�9+r���j�9ޣM���]0�R^`PG\�}�5!=Zx���^(�uBz*��׉��AsC|�m�!�4�)�49�	[�T�����v�(
���'��f�M1��럊��`��(��~_E���}:��P�z��<�A���RH1^!��ؒ>\���G��|�x��z�q]�Z��M�M�5W"�ѐ9xNb��ڡ�	P*6�}L
AY%�a�ݢ��T�}7�	�(�������+�h1
�e���5��?+r3�`��S���?����-8_Y��Xc�	�Q�~��r
'=�H�4S� Jh�v
�fz)**����N���8�9�pn=f`2j���A�`��_��)������׻�翔��?�9@C�N��~}���:� S2-��#;=�j����f��e�&�����	�|�]0H[BXd"�	%N��aqn�A祆�< �W��ʰ7z���̖�Pk)HP�k�C��ޠ���L�4��tx��\�;t	�����/��6�PU�HA�N��=����Þ��*~���߉^��>��C�=l�J	T� *��!Lw{iEc4�&�@�B�݀��OE�� ��ݎ^?t���D�K��`��}>���Ym�=��9�Әz\���^[��R0�$
F(�c=4��S��=lRP�$��E�d������iN�Y���y�gԑ	ekS��
��%m��h_�i;��!��f���#�}��1Q",���	����~����(���BD�m�P��R_���]߷yLh@B����
V�Q����e����3���<���n���t�Ҡ�Y��2U ��N��$���(�PM���b���=(�d1���l�c W  V���P���2Є݀�5FY�¦׺
v�D����;��{;͐���,L[�i<�9Oc}İ���z}���ʸ�K�����
���s��}���$`JRb7a���u7�������������c���&����h�Ԩ��p�-�Ԩ�D�ƊziB�����S;|M	����rC�ܥq}�1Q�ɔn�X��+t�1�y*\�3ci�1@���� ,ȅ�b7.����������qwn�sI���ճťV��'Z��A�j5�_W�¡1�2�x���
�fS�O���I��b���#!��� ń�Ct�\w;H�ҡG��������%���W�^�ء��      `      x����� � �      a   T   xs�K�NTN��J�T@��\N�I��
���2

�I\�`}ޥ��z@l�d.�ĬR��b���̒�̼�t��)\1z\\\ ]\p      �      x����� � �      b   �  x5�Ms�0�ϻ�B�\�A��:�ЌK� 驗�^l�����0��w]��l���>�4��ީ��V����ޣ��c�r�+ZX��q
{��Q[U�p6�\�r�9�2��Wypׯ�Kʨup}wG=�EV[*S ��t�uG���DH��T���H��T'�������Iz;׋��_(���{�Ҍ���(YF��z)�����H訪9F����r�0PG���!��;��(�j�%��X1�%*�;5�n��t��TO���S9fS��U�ֱ$�`�B����X�W"e�����GG74�5�FúvE�R�b��d����p�ы!A.,l��ϕ|�L�E��43	�@'���G��f���]��{Wq;!�h'� �4�$����W#R+"S�V0����U�UO�r.Nծ�՛0B;�7���e*��Y�D؅������F�`��78}��Wq*�z,K�S[
�N���7D�z��      c   X  x�X[�#1�v�)^6�g���ce��11ت��_T ���ះ�����-�\&�OD.�t���ih!����:,
�!*�A�&ⱦ�AdH��lb�rqU���6�ID�����s��	���x�)�e������0�̞Jh�<�k�vLJ��p�y2� Be�"l���tUÚIz*�j�n�$!U��B�7�1mɤA(dk��+i|�J�L�4����,m�E�W�0#�]�h��=W��QD��y���3&���3!�)��D�$���Ƹ���a��Ƅh�52f_�g�7��7���9�+|�c�/�k1�`�z�P��Yp�ͫq�e����0�J�	H�9�&�RlM'���^sb�c��"¬ �g����v���d���,(����aՙ��#��[��f3��*�
ˆ	���H�)kc¹��EePu��=�Wɚ�ԓ-!˦���A�ğ�y�0���n� rz��("�C�� q��t�3��bk"1'.=W�ϮN�i ��G�02=g	L�N��`z3t����X�CW@0�Y��6�gC�isf�������0�ܓ�P���~�a���`1�
�̖u9�qQ[�mn�؞�a����7Q�ê7�6s�T�'�F@՚�sb��P���(-�c��ٕ,��#Ⱥ���1���������~�f�����-x�Gw(r"v�W�x@�i�;��! DW/����c�y�,W��p]͝"д 8ؖ�����\Cռm6�r�EP�h�s\6�|��9.?o �qy�r=���k(����9.���q�<���flI����O}��q��O�f	���V�S�N���ɯ/�n�_��e2�����^��n�n      d   .   x3�H��*M�I�S@\F@�ܤ��,r�H��P�q��qqq ���      q   i  x�XMo�8=��B�] [�ɽ�I�{�i�صc����~G)�ImA���~�(�y�f��+ i.�C�&���}{�hn��k�v]n�a�����~unL��� 	�A�3��S�OA�D�0���d��i�K=��'<�T���;��nx
<H�Њ��h�x"PEB�z�C�n�%�&*��#k���|^Ji��ɚNGa�B���UyJF+A���^��ݫ#G����ϫ�]��Ù84�����f��C�Z�e՝�6���OCT���(�)�(%
"b�u�p[W��8QX�Q�V%�gQtA�(�2U��X�("Jh��zk5����o(�g��<����qqxh�9<�ek�P��yۺ����h�����Ї�����}n���k�w�[n�Vۼ���/�qK���I�R]'� �p�1�M��&Hk���%9Ո��Z��RFg,g�8���W�#��y���ɺ\|�sV���OX��[��C�nx~�X�^��1�wJ��TI]rRjH�{*T�9H*�Z1=#�`���')�rτ�Li��yn�)����s�����o����~���7o6�����B���o���K?�Ϻ�wy,��<�It3}!I%�y-ڱ�0��eœ�&i�Z:|��樿T�/Й���8~=9�W��ǲ�\<��>�ޮ��/��	&F�.���N�}��-��O���E
4%�	w�_#Wl�;��U�M�	M���8��w�E��cT�!+�Z��`r����?�����1�U_滼�-��+wX�x����]�u˼�V�����O�Ϗ�Hj�p��F��F�(�i���@5a�)]�R��ILP?��a�{�������T��Յe��{�2:�T<1�6Vc�F��g�$0Dc�d��K��إx�aj�Q������9�����K4�E�קa£T)PE��&�Ko%���pU2����21%�Tq@a�꣎G! 8���~�s����*U�'�̂1~V�Z���^,i�����䣺��}T�_m�z��ho���[����>��B��S9pm�E��F�-��\U�H���+%�Vv쀁ך��%>f�
�Q��Yb!�hF��?7���vF��6��MD_˼Z��,���z�����]/6�}^�!_�o���p{�(})�j�ar,#5�G���u]% �FQ��yeM��;��qG�#4�	�}�[��P��l ��9�N�(b���;F�W\��隣����L�ӫ�&/W{d�3��~�X��vW�{��`j����K�𝖉��b2��0��O,#�%��ځS�aF-s �� 8F�ԟ"K$GH�z1�":�8�����8�(R��e5�P���\={�,�7��*��#M���Sd�MQ.�B�ZgGG��ɨe�c����b}����s�@hs���/8%���#�c'�=�>�w��4/�O=n�~d���;{��;0+$��v�([:wt],f�H1� �W�E�#�ƥ`Ǿ�����Xe�&/7���7��6�֋mތ��s�q����X` a���+��s?bƃCx��a�["��aQ+8OD`K�AN�?7����ׯ^���@E      e      x����� � �      f   4   xs�I�U �D.��Ē�<�3	�II�Ls���S��3@2)\1z\\\ ���      g   .   x3�t��+M��2����+�ȩ�2�OM�2L8]3�t� ��m      h   �   xm��n�0@��W�P���i�EZ&[��Ũ�5����&�~�đ�e���9�Zb}qw�ӓFܒ��� {���=�k\O;���l=V�l^W�(�D�4�r]�4���Hg߱]`[��dj�َqG�7���4��%��)�7�'�f��`�o<�l��C�Jt�P��"��I��+���;?<��2��F2�V�z�@�q�5�DN%�2�R��$���R�      r      x���r�FΆO�b. �j��d���ɖm9^K�T���E���D'G�T�w�=@79#� i�� ��h����0�I���.ߥo\�R�eeb�m\�Lշ�
�vCo�ѕ�/�fyٕ}iG�.��eߖ��t|���Li���X�=�jg��UCӄ����]uhLY���?7��G��i�~5]|�V/ϟ����oV鿂G�}�*V��ӿ��b�����#�i��hD/��e1�MݘF�+�|غ�|��a�c�,���z�塰u���89����n\��G?4���$����0�%������O�өj���z��Y��zV��������r}|r���}�U!��V�����(Qx�pp��Cل�����S\6��WmS8���8�XY3�M!�V����Iއʎ��͘������b@��/�<T�P���r[eӇ!�;��"������y�}���"��D�Ţ����bs��/O�Vq{�>���^~>�.?�������h�{:�u�|�y{�~;]��L��z�����^��K;�z���s�m(\_x�O��}훢�Y�1�-_��I^��l��Y�]U3�I�"�}���J�e�c�v�������������g=�';�J[��܈n^^]_��K��]O��_Q��v:[��-}�������L1�'d�Mk�bQ��pNe;�3������Uց��.C��y_v���2��ı�*���XU�/��H�η�k��K����#3�=<N�y�&��=�ċ/����=�ur��Er�����r2�+¨��W''��כ�r?O������n�g�������u�t+��������r]�Y��u{r>�ݷ���ٯk��{��͓�LnӘ�i]��U�X_T^c�7ɝk�$\c]�T#>`�AK�.�7�
]_�Y�D\��ˮ�C�ee
g\_Y���t�=_���O7���'�O
[�h�D�%�G�m�� ���qz��hŔuk���x��[,o�=�,�ݙ�o�$o#{ 6MՍn�WƷ<����8O4s��YnLѫʋ�(�il[�0����6o6MU�����g�'zsK����ޜ� ~ur6]_^�_L��#�Vbl��������t)����N ǳ��S�������̱�)�6Ʊ��f~��+�F2�jl0����Fh|�!l�]��z�*��;q"&�C�i������__w�bd�����C{9]^f��V�(�.]���E�oϧͺ�.��_?�J�w�����(ow�}�߿^��o��O�BI���|2�2�Ι P����޴��$����׶��y�8�=�o�%P)����΄�t��-Vݍ���|~c~|}�d��a��M��W��O�3v��������t�MFV���v��B$S%����Z�+Dٸ"k%��6O��F�
�d�ր��S�n,����D��VS�I^X�b`�m� �*�+260E��P��_�]_���nB��l�n����TqG�O���Z�e���Z$>�`��(,�Y��^I,G��X!ߖ+��HJ��	Xs��|�L���w���5x(�t?�<.>2���mlI�C�
���1��U�/�<��C���]=��u�?�6\_���������:�<131�O��ϛo����J[�jcW���̯IZ�M�x�i��Ϯu9���ϓ�w��j\FЍ��7Eݴ�N�e�z�1�Ѵ��s�1�e�wD�b˶;9�����8��X������(`M�Dw�ڏ�]�
�.��jƗ%���վ<Z����>���9�h����U��no�7��3�n.o%���e�RNu�W�'�UlSU��k�x�?F#;@�� �%�2>{��|�R6��$}w�� vC2m�fU�����_g�HTӏs2Vw�����^X��1Gʲ�����}X��1-7�<	�-�(c =���,7r��%�B2,�����R����?y�ݶQo����pss��&��r���Ь*�/Bݠ{e;�&+�>��̘��HR�B�s<6"��յx���m`B��}=`x�7}�YU�|3D��L���B��x ���6����P�\>�&�����M��<p�����
�}1�������	C��\��.Л|�T�㋊�Û�� /�?������mv���r��F׏�
����4U �a�,E�X�<֓��Qۘc�P�C!R�R�XRcS������\	�����Jr�\��ݜN�V����ٺ�|����WE���3��=}�/�^����}69v�7c?䀇���cmj�l�x"��/�u�M衘|�Ze�Dޙ���
�NN[o1˴_��~D��,�b��
�ma�k64�x����|��ŵ��&����<!�;��=T'�2Ԋ~���6$4�:�~�rg4���V�I�;x#٢��)Ƀ��A)���9 ���(D�r<��j�W�5��������a�~x}Q^	fJ~گ�0U�ஏ����uY�k��U튕�*@�zBM	���.��,�F>8�o�'�q�.�lI�{2mߍFQ�<���9�mPlH�aZw�,�)h0^d����t�@�K;�?$;p��t�����>�����}G�mH ��i�0'Bw\�B���<[�[2���X�-e//x"�) I}R��T�l}�Y)��ad���HJ�`��S5zW=�@���9�-.S�����y.��`+B]_nɞ���>ݞf�k�Bv��$��j{	��Q*PҀ��V$�U�$��2�Td�O��fpֱ�؜J`%�I�a� ��Ď�g�Ϊk$m�#%�s��H�l]��׭m|��B��!Q3�B�ڌx?6�"��������뻹3S�x:�=�n�z��C��mD�x�W�k�~uB�#�+ok��|�*�A8���6���z�^�>a�5#�.a��mS��������8��m���wm������i���M]55���Kv7)�"'����.�)X1���T�s�.&]ߐ���:I� �.فR�^����&���V,@��I>r��v����k�'�:mك�1˻���a�5�|H?��i~8�����|��4Y�X������X�P���PR�ꛝRe�J)��+�1
��x���&D�?@Q�~���b���o�w�
0�.�F:3�@����Kr��Gf9�P!1�� 6�<��jI)�N�w���O�8�lx~>������`ǐ��P�֕�����܇��G/���q�G����?:~�S�������|�Qm��l����<Fȟ���������
��U�� ���[���Zy�B[S�5��qqY�`�ho���xS�x[p��uR(��S��u����ʗTBq���R��)/����٪6\H!*���Łpp?
Te�V��ǯ���B0�X�pO����T\To��Y[g�U8��:����ksJV4q�(�BЩ�P
�f�����PJ痺�Ϯ�z�Y�m��"�%D����f��{Z�@	᫺�ns�i;!�%ɸG���
�k�*_�"�lh�.�˞�@`��*�����-{���������:��?����d0z�5��A]�k�� (���b���v�[
T���,j���0�E��(��t~_C`q���>����U g�|��H�<E�ëS�
�N�=�HMr��V6���|�"�v���ݙ|S��Qr�5BJ�Bϊw�	;��c=���br���ѝ��,�Z��Eb,ǋ����EN2�$*W���y�� ��(ɓ�m�>�p늒z)���x�ȝ������!�;�O�HrVHvИ�/�?��%C�Iή��1� ����W�:���Y.�K�U�(�GK��fH���������L�h����S��3�p�딊��d8h� N��-B)��0��KX�1�eu��#^��!ZvM��E�bt%y���u�0ۧ�?t�4zps��Ot����_o.����,��@���U����;Zu�̣������ԙ��,�!�"B��c{�h�P�F"�M�Rm�+�4$d9����5H�9h����U}���@kFJs+���ʖ�����{݀o_hN�z�U�� Y���beE��@�)A?��    ��B��`Tnh�p`lH�%�C���)�B��h����u"���� ����|}�˽������lE��K�V�f*�xڒ�s���kJDA�k�4�̼*��t�nc&�j�`�)�f^�"�������#*.)�ж��R�h�Q^�⑝�ц�j�t�%^�6��ޟhZ&���I�n�CB��}��~ٔ�����&��b�G�V�����r-��������q���]�u�ϯ)��������gy#e%OE�B��`J
�ծ�2xO�`$~��������\+Wu8���������Y˥��RyZI����l�IK�����IeX���l�z�/����H?�5���sm&(�P���.�P��,�<���㗺1AD|�FR+Qo�)�f��JP�O�L�])兎d���#�,c�U���?�</�0v��T�$�	�:����
���B������)���Su�~�[n��=��j��C%3~1]n��:��l�����E�����B�RQ#�&�Pr�;c�?D�H�9�l�7\7�5?��#ѕ&�|���'�c�%��hw٘��s�v���Sò�,C���@	=�9V%����/����Es��5h��Q<\����r~r�?|����*�n��^���QY�ޢ@��[X�~�bi$��쏇H�WP%����`�N���"nLUd��䔓�`i	�tk���g�. ��ϫ�5��s�d&Ŝq�oki�����Sʚ2����+L�t<�ґ��A��4���*���ݢz�aMj+r\5P�0��c���ȹ�+v� Pk�@�����4ьUhYP��3�:���Kz����D�0Q>l�@�e��SX2�x�/��e��r��=9I�8�_��B�U�4`� R)���G~];D<�|~vR�Fh=%>Z�������<���as���4��:�H����ҩ���5��8;���r��#F�"����'�G�����rbd!s`O[C��('g{��KZ�Z��"���V(x�&�ِ4,r�fh(Of�ŀK�7b�s<��$����HL��˲���~��;+(�˲Tpx���)6 �S�����f���a����?, .X�
t]`�gx�sXEn���?~7�`�����r�4��m$Ӻ�,��!�z�'%2bX:(pZE�c��ф���q����	�Y^�
p�B��Ώڠ�s��A�/=+�4����4��ˇ[�(�{W�E;��5��G�VhZ�WU�띉 ��W%]Z��Ӛ+	D�;~�f޹�O��T�˙���I��$�PDS¤�Z��I憇/0�,W<E'˝�$��+Ʌy �H|�K� ��}�y�\<p}�$�L��=���������@�O]����׷�ࢡ%����yj� ��_b��:g����暕(���='�E��a���c,ne�	��\�����l��A�h-lS�#Qk�PrO����Ґ��]_�HT�����J����fU��'���&��z�;v�������y�1�<S�
~�RU7%`�M�P*��E��#R1-�q!��hՓ���ț�Ӂ�T��0%���4����q�0�PEH�����
�;+4������f��3�d�>����ٻ
6�r���\X�.�d��bQ�i�7),ݸ��#\�n+,��HSo�[�{{�zu`�0$J1�#iCP�$}	�������&��O��
(J-�>t}U��o.�iME�t{��n��`��Ѕ2��M�ފ�S,V����c��F�'�P�U�0���J�CG�-��j��Q̤��UL䨊��N��������eJ]��D�8��r�q(;j>>� �G����W.�9q�/(B�P��ĨǷڢ�{��o�I�#�Ѭ��;�h3_��o���_�߾��	 j��l%�O�i�EcE}k�X+�(#Ih�e�#�T@qG�I��N�?�~�A跠�A�����Hu��w����P̳��;�hSg�7�N��~z�奫��k<����NN�̤$�yoІR��V>��0�-\$<�-M�Y��'�p�qO�fU�#�@�BK�H*	������U�xfx������ɀ}�p�w�L�����a�{��@i�0"(���⪥\��>f�mϙ��z��LJ�;^�r������;�*�W�"p��RFyi�|$F3sJV�/}�	R4Q���0�����c:�Ŭ�Rڡ��Q�eɞ��||�`P�L�x�zɒ�\~Q��=?���^_5�4���˳�k�h��]*��1F� )��9dW�Y&�
�c���&�rp��}���A.񌤝f�`�����#:���:�r���lB�������0_��
^���f�OO�"g�g8�;�`s��}9�Ҍ�=�)�FK�'�s�%���0��^I��W��=ثc�%w��J�3?i�sRܛ�t��ì�%u�|�/��+�J@��b�x9��}���Ӯj�y%^i>?�p����c��*ץ��?8')���	Ͻ�#r�g
/ə�IJ�j��g맆���;~�j�No=9;]@/�n.`���L�JElO�Mдv��l�;z���Vƕ��	Y�fDE�:sڝ�'��J��6�yE����AsYN�S{���-,+��h�[�S	d�v`nQ�n�/".��+�
�D#q��²���)���o� �ZDN���Y.Өb�܀ʁ+���xs:�� ��ؙM���9���$y/�����o;r�$���M+s�z<8��S7KrRՑ2>�.u��_s��f9�-95����u�a ��x�e�]��C�r6I�H��έ�Z7'Od�m�>�N�
dBs�*��� د�@����	�Eu�04��ş���Ǣa?�Ԣ8il��7���R�ׅ՘��uv=6��DCJ2-�ktk��4P�������s�0���W׷��n�?��Ꮻ��?M�7�i2���Ϭ�^��^��C�)+���*�<��o�����?�wמv�l�UuF�VP1�E��غ��W09'8�Z�/c��k�9U[���x�F[tb�� H�4E��ǯF�Pb��T5'?��q90�W�>��܂���#���4��;9}+2ק��w�����%�ߕ���4c� ��� �w�4���^I����χI�*�<����(sJ���!y>,�|���F�U��=�_]̅K:�>�o>�n@WQ�^�^��L��l:r(<�fQ3���.�G�)�:��aƖ�y��^�>ҿ�j�u5=�i?�?z�$��������$g҉��)��;9Si���� �����e>^�dи�ǁ2�#G��|�`7��2�� �w�0O�1��L�0γ����jtd/-9 �<���tc�~7Я���U���`6��Q),y�J^)2��_��ϴ�4 �;��W��qĥ^�q{��X�h���-�UM`�e~]�/�
2�vDYh����`N�X�9�����2����"Ypl���02Y�^u\��@����k��c<�a'^M����Rڬ(0-؇��Գ|��,e�=t}Qh�Kk�=�/���&U��?�����2}���s�S�F�y怖��(��x��S��x��q�>��a��H ؒ���o`��I�$w�LR[[& �x��&�i9J�d�%O�[<�I���^j����,�Wx���מ�SD�	K/�V��>ď�_V�������b���:���Ҍ�\�V_����:������l�U�++�9�j)\75d*���܋����W�?��Ք�p�Qr�2;�H��M�~��0C9`X�4����-ɼ��B5w����D���Y.K%5c	���I<Zͬ�r��T�}�ête2�	FY����� �j�Yz�e�ˣ������a��Y�����[�P�� )�%�<H�i�הAxY����~&v)8I�3���I�}�G�`F���k���	�M�떀��<
zvU0=�ަ�Xv(�40�CJF�h�`S�����H�D���o��t�э0O�(��)�R�xi�(��r^T�H��R�D���
<'Cdʈ�2��"�[:}淍�b�ٺ��Fz>Q#�9�@��N�e~��K��ĉ����.m�L��N:>��� N  �х /�h�L�0b~�Xp��C,�y	�`*��B���԰��%/�Q#�$=i����+�u_Dw��t<NhZ+u��#�/�KKrX�@=^t!;EIP�Ғ\� �C�E�rS�l��0��J��?u�n���F��	ȕ|~���P�o���6��E�,��7W�	��Ҳ�������j���c���<O���@�bf �D=�i�,U��7;Ov�x�{ArE	�U0�7Ȕ�h�"����2��������7o�?>:�$0Z)W���G#C�;��u�	P��/�Hѭd2���Լ�L�� *��Zm�1��^�T�� Ve$gH��փ֦@E�����E��B�ś������o����<ɋ��(�{5)A�tQSg�+���|�]Շx���菃�	Qlbt0�soy	�����!�E�i� �5о_����ZA�WU�B/�i%ALQ5��e���+4�/$��!�;8~����Ҟ��2KrFω~0l�������n�]k7uz4��{Uy��f��a�I �X��	����T>�t�`_�ɒr���������Zc#��@��<Q�T�F��j]�Y�|��CZӅ<��$�3'���v���C8K�sZV�y/��I+��<{$���K�萧�B���%��|i��Q�X�8iO����Gx�P�V%���HSZ�߯�?�YU&�r�����ϫ�s�,�wW�#ޘF���#�����|�a���j&�޿y���s��Qd'����0�)/����	R j����C�ӗ�k��r�r��8fuY�{x�e�d�N�&��Lr&�J����]́�XS�ܲ�+ZƐ�)�y2뜏O,>�x�#��Y����d���=/t�ϞO�cR�#�ʧ���o���/e�{D!��F�}F��t�IyhI������Ǒ���ެ[�2ߐ�����([���M#��V/����k.s��-W� ޽���o{O����L�W���f��I�_8�d������~(��4 ��Rg����M��$�ݭt��4�������żd(sp�����ZLa����73.ū]7ZNnH�py2�F�,�����/�~��/��"��      i   �  xm�kj�V��W���tW0$0��ݶ�1����G>_=�����t�Ω�+�]�mۮ�~^������a{����^�������v~�n���������+zjF��~�<�^>.7�<��������~�~��f�_�����|�n�=�EM��ţ޷����˯����~���k�*;�\�k�A�$�м2A�/2��v��w�ꌳ;	t��d9���r�tg3yU}��]t`{=_^���nRLi����_�'!*sԉQYi~���g_�*Hi�ao� ��q��+R�GA��p��	� >�8�I�T*����q�ҙ������p���p�Ѐ�HhB�KhB�KhB!4�L�$�-���B%)!FIR������3%)!�%)�HC;�����������ZQZ�����������]l�zIH�׽4$�s%"hGz�H���D*�kX	sv�0��ÁSي���V��VÒ�Dl�G��_�Gw{6�G�|��u��UIq�B�hvD2*)#I��b�����T��R�ދZS���m�*e�R)BR)B�����u�V�:�$���H�,j>O&걅T��[섣�b�QV1eՀU���ɡ���K���D���H%D�J
8�i�D?sB���ȹr:a�tB��J�3���He�9r�4��GQ�L�h�m|q/ �ƽ�TEG��AX_����
XoT@�g����QA��=j�:�*v��1�	����HM�2�����>Ŕ��SV31�M	X��gPؾ�$�$��j�0%h5��вVß������b��J�^�jl+M	�F4G�)���W��q�q�d��jTP�F'��P����;��A^�^�`�xu5_�,p:Z�_c�-83�@�+�#�~{%�J��F�J��B��:V��V+�x�jj�"���(��	Z�����6�e`\Ԗ��Ԁ#{!�	�IMH�$5!�5m	ɾ��ި���ʴ%�m���PIMjt�5a о��h��hXmV�3��ެ��Bk��_�ߕ���T)MHM��NKR@_IJ��JR�jRR�$���֓�Kh_�ä&�FU��-�d�J�?`eJD��i;A�"�>d��i�����s����綾A���j}�����ٮp�Nv�����Z��/���:��O�~)v�|�`÷��"{S�~%+Ҿ(���P���jhB�RI	�5!��#	��Khc��ÿH���H"������~H�ڌ���f�߅���? hb��z������\�ҏwo������w�����      �      x����� � �      �      x����� � �      �      x����� � �      �      x����� � �      �      x����� � �      �      x����� � �     