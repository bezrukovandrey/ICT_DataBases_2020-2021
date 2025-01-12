PGDMP                          y            library    13.2    13.2 '    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16394    library    DATABASE     d   CREATE DATABASE library WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE library;
                postgres    false                        2615    16395    library    SCHEMA        CREATE SCHEMA library;
    DROP SCHEMA library;
                postgres    false            �            1259    16454 	   Abonement    TABLE     �  CREATE TABLE library."Abonement" (
    id_abonement integer NOT NULL,
    date_start date NOT NULL,
    date_end date NOT NULL,
    fine_for_lateness integer,
    fine_for_damage integer,
    state_book character varying NOT NULL,
    fact_date_end date NOT NULL,
    id_examplar integer NOT NULL,
    id_reader integer NOT NULL,
    id_emp integer NOT NULL,
    CONSTRAINT date_check CHECK ((date_end > date_start))
);
     DROP TABLE library."Abonement";
       library         heap    postgres    false    6            �            1259    16396    Books    TABLE     �  CREATE TABLE library."Books" (
    id_book integer NOT NULL,
    field character varying,
    volume integer,
    full_name_translator character varying,
    full_name_author character varying,
    name character varying,
    language character varying,
    year integer,
    id_pub integer,
    price_book integer,
    CONSTRAINT "Books_id_book_check" CHECK ((id_book < 100)),
    CONSTRAINT volume_check CHECK ((volume > 0))
);
    DROP TABLE library."Books";
       library         heap    postgres    false    6            �            1259    16459    Employee    TABLE     �   CREATE TABLE library."Employee" (
    id_emp integer NOT NULL,
    first_name character varying NOT NULL,
    second_name character varying NOT NULL,
    last_name character varying NOT NULL,
    department character varying NOT NULL
);
    DROP TABLE library."Employee";
       library         heap    postgres    false    6            �            1259    16469    Examplar    TABLE     �   CREATE TABLE library."Examplar" (
    id_examplar integer NOT NULL,
    id_room integer NOT NULL,
    id_book integer NOT NULL
);
    DROP TABLE library."Examplar";
       library         heap    postgres    false    6            �            1259    16474 	   Publisher    TABLE     �   CREATE TABLE library."Publisher" (
    id_pub integer NOT NULL,
    name character varying NOT NULL,
    place character varying NOT NULL
);
     DROP TABLE library."Publisher";
       library         heap    postgres    false    6            �            1259    16405    Reader    TABLE       CREATE TABLE library."Reader" (
    id_reader integer NOT NULL,
    second_name character varying NOT NULL,
    last_name character varying NOT NULL,
    phone_numer character varying NOT NULL,
    first_name character varying NOT NULL,
    address character varying NOT NULL
);
    DROP TABLE library."Reader";
       library         heap    postgres    false    6            �            1259    16464    Room    TABLE        CREATE TABLE library."Room" (
    id_room integer NOT NULL,
    id_bookcase integer NOT NULL,
    id_shelf integer NOT NULL
);
    DROP TABLE library."Room";
       library         heap    postgres    false    6            �          0    16454 	   Abonement 
   TABLE DATA           �   COPY library."Abonement" (id_abonement, date_start, date_end, fine_for_lateness, fine_for_damage, state_book, fact_date_end, id_examplar, id_reader, id_emp) FROM stdin;
    library          postgres    false    203   �/       �          0    16396    Books 
   TABLE DATA           �   COPY library."Books" (id_book, field, volume, full_name_translator, full_name_author, name, language, year, id_pub, price_book) FROM stdin;
    library          postgres    false    201   �0       �          0    16459    Employee 
   TABLE DATA           ]   COPY library."Employee" (id_emp, first_name, second_name, last_name, department) FROM stdin;
    library          postgres    false    204   �1       �          0    16469    Examplar 
   TABLE DATA           D   COPY library."Examplar" (id_examplar, id_room, id_book) FROM stdin;
    library          postgres    false    206   `2       �          0    16474 	   Publisher 
   TABLE DATA           ;   COPY library."Publisher" (id_pub, name, place) FROM stdin;
    library          postgres    false    207   �2       �          0    16405    Reader 
   TABLE DATA           h   COPY library."Reader" (id_reader, second_name, last_name, phone_numer, first_name, address) FROM stdin;
    library          postgres    false    202   )3       �          0    16464    Room 
   TABLE DATA           A   COPY library."Room" (id_room, id_bookcase, id_shelf) FROM stdin;
    library          postgres    false    205   :4       G           2606    16458    Abonement Abonement_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY library."Abonement"
    ADD CONSTRAINT "Abonement_pkey" PRIMARY KEY (id_abonement);
 G   ALTER TABLE ONLY library."Abonement" DROP CONSTRAINT "Abonement_pkey";
       library            postgres    false    203            B           2606    16403    Books Books_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY library."Books"
    ADD CONSTRAINT "Books_pkey" PRIMARY KEY (id_book);
 ?   ALTER TABLE ONLY library."Books" DROP CONSTRAINT "Books_pkey";
       library            postgres    false    201            L           2606    16463    Employee Employee_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY library."Employee"
    ADD CONSTRAINT "Employee_pkey" PRIMARY KEY (id_emp);
 E   ALTER TABLE ONLY library."Employee" DROP CONSTRAINT "Employee_pkey";
       library            postgres    false    204            P           2606    16473    Examplar Examplar_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY library."Examplar"
    ADD CONSTRAINT "Examplar_pkey" PRIMARY KEY (id_examplar);
 E   ALTER TABLE ONLY library."Examplar" DROP CONSTRAINT "Examplar_pkey";
       library            postgres    false    206            T           2606    16478    Publisher Publisher_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY library."Publisher"
    ADD CONSTRAINT "Publisher_pkey" PRIMARY KEY (id_pub);
 G   ALTER TABLE ONLY library."Publisher" DROP CONSTRAINT "Publisher_pkey";
       library            postgres    false    207            E           2606    16412    Reader Reader_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY library."Reader"
    ADD CONSTRAINT "Reader_pkey" PRIMARY KEY (id_reader);
 A   ALTER TABLE ONLY library."Reader" DROP CONSTRAINT "Reader_pkey";
       library            postgres    false    202            N           2606    16468    Room Room_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY library."Room"
    ADD CONSTRAINT "Room_pkey" PRIMARY KEY (id_room);
 =   ALTER TABLE ONLY library."Room" DROP CONSTRAINT "Room_pkey";
       library            postgres    false    205            Q           1259    16625    fki_id_book_FK    INDEX     K   CREATE INDEX "fki_id_book_FK" ON library."Examplar" USING btree (id_book);
 %   DROP INDEX library."fki_id_book_FK";
       library            postgres    false    206            H           1259    16613    fki_id_emp_FK    INDEX     J   CREATE INDEX "fki_id_emp_FK" ON library."Abonement" USING btree (id_emp);
 $   DROP INDEX library."fki_id_emp_FK";
       library            postgres    false    203            I           1259    16601    fki_id_examplar_FK    INDEX     T   CREATE INDEX "fki_id_examplar_FK" ON library."Abonement" USING btree (id_examplar);
 )   DROP INDEX library."fki_id_examplar_FK";
       library            postgres    false    203            C           1259    16631    fki_id_pub_FK    INDEX     F   CREATE INDEX "fki_id_pub_FK" ON library."Books" USING btree (id_pub);
 $   DROP INDEX library."fki_id_pub_FK";
       library            postgres    false    201            J           1259    16607    fki_id_reader_FK    INDEX     P   CREATE INDEX "fki_id_reader_FK" ON library."Abonement" USING btree (id_reader);
 '   DROP INDEX library."fki_id_reader_FK";
       library            postgres    false    203            R           1259    16619    fki_id_room_FK    INDEX     K   CREATE INDEX "fki_id_room_FK" ON library."Examplar" USING btree (id_room);
 %   DROP INDEX library."fki_id_room_FK";
       library            postgres    false    206            [           2606    16620    Examplar id_book_FK    FK CONSTRAINT     �   ALTER TABLE ONLY library."Examplar"
    ADD CONSTRAINT "id_book_FK" FOREIGN KEY (id_book) REFERENCES library."Books"(id_book) ON UPDATE RESTRICT ON DELETE RESTRICT;
 B   ALTER TABLE ONLY library."Examplar" DROP CONSTRAINT "id_book_FK";
       library          postgres    false    2882    201    206            Y           2606    16608    Abonement id_emp_FK    FK CONSTRAINT     �   ALTER TABLE ONLY library."Abonement"
    ADD CONSTRAINT "id_emp_FK" FOREIGN KEY (id_emp) REFERENCES library."Employee"(id_emp) ON UPDATE RESTRICT ON DELETE RESTRICT;
 B   ALTER TABLE ONLY library."Abonement" DROP CONSTRAINT "id_emp_FK";
       library          postgres    false    203    2892    204            W           2606    16596    Abonement id_examplar_FK    FK CONSTRAINT     �   ALTER TABLE ONLY library."Abonement"
    ADD CONSTRAINT "id_examplar_FK" FOREIGN KEY (id_examplar) REFERENCES library."Examplar"(id_examplar) ON UPDATE RESTRICT ON DELETE RESTRICT;
 G   ALTER TABLE ONLY library."Abonement" DROP CONSTRAINT "id_examplar_FK";
       library          postgres    false    203    2896    206            U           2606    16626    Books id_pub_FK    FK CONSTRAINT     �   ALTER TABLE ONLY library."Books"
    ADD CONSTRAINT "id_pub_FK" FOREIGN KEY (id_pub) REFERENCES library."Publisher"(id_pub) ON UPDATE RESTRICT ON DELETE RESTRICT;
 >   ALTER TABLE ONLY library."Books" DROP CONSTRAINT "id_pub_FK";
       library          postgres    false    201    207    2900            X           2606    16602    Abonement id_reader_FK    FK CONSTRAINT     �   ALTER TABLE ONLY library."Abonement"
    ADD CONSTRAINT "id_reader_FK" FOREIGN KEY (id_reader) REFERENCES library."Reader"(id_reader) ON UPDATE RESTRICT ON DELETE RESTRICT;
 E   ALTER TABLE ONLY library."Abonement" DROP CONSTRAINT "id_reader_FK";
       library          postgres    false    203    2885    202            V           2606    16434    Reader id_reader_fk    FK CONSTRAINT     �   ALTER TABLE ONLY library."Reader"
    ADD CONSTRAINT id_reader_fk FOREIGN KEY (id_reader) REFERENCES library."Books"(id_book) ON UPDATE RESTRICT ON DELETE RESTRICT;
 @   ALTER TABLE ONLY library."Reader" DROP CONSTRAINT id_reader_fk;
       library          postgres    false    202    2882    201            Z           2606    16614    Examplar id_room_FK    FK CONSTRAINT     �   ALTER TABLE ONLY library."Examplar"
    ADD CONSTRAINT "id_room_FK" FOREIGN KEY (id_room) REFERENCES library."Room"(id_room) ON UPDATE RESTRICT ON DELETE RESTRICT;
 B   ALTER TABLE ONLY library."Examplar" DROP CONSTRAINT "id_room_FK";
       library          postgres    false    206    205    2894            �   �   x}���0E��,d;ɡ�0�-`Dj���F8@/���8���IP2�h�����x�QO�0�B�`�%�-�s5�[d��A��u����� �c�Y��z�9��K��)�-���3����;n�O;,(ka��(u|�t)Rn�a��/�h5      �   $  x%��n�0@��Wx�T+&P�MՁ�V���5��S¹������{��Y��S���/��޲��o�_��@�}�um^�qG�DA����e�������²,���N���A薷k'�������I���1��}@�d7���u�J����2��d����&'N��7G;�1q7:&�_j�Z�MQ�%Ć;Δ#��ㄒ��3'�!_&���`���!GJ����X$7����eU����5k��8�v�W	�P����a���Cԭ2�@H���6V`��v6J�?p�s~      �   �   xE��
1E����>�Ƞ�A�M�{��B:S���0���ܛs�t��V��%�
�M�%R���7y��[�>2]D��G�9�@L��Y�c�`j
�C_�tE1MĈ����m��z8'T�u����gKw�K� ���[g���*�څs��E�      �   %   x3�4�4�2�B.cN �2�B.SN ����� K�2      �   �   x3�(M��/-N���,)NTpJ��/*-.�N�L�QH�3�2�tM�-(M���ί�H-����/�Q �0��2��	S\������5�2I&UrF�Ve�MU(�6ܜ��5��)�d,���W� �#4�      �     xe�=k�0��ӯ�^c��x-m��)�����X4¶$[�_In�r���s�{�t���O�����\~�C�K�d����<��k�K���8�t���5xL�`����gR���>��cL&mƅ�ȍ���c���qx��O��ɞ/�8%D
�۳]�-3����N�V�b�+��g2>���dwV��{Bz
��t��7�)k�pXl�0C�k9ӟіJQ.e��LV�!�x5�?t\trv���]���Z��/�o�      �   *   x3�44�4�2�4�4�2�4�4�2�4�4�2�͸b���� R�i     