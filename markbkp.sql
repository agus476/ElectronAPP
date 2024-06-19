PGDMP     ,    "                |         	   MarkForge    12.4    12.4                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    90421 	   MarkForge    DATABASE     �   CREATE DATABASE "MarkForge" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Argentina.1252' LC_CTYPE = 'Spanish_Argentina.1252';
    DROP DATABASE "MarkForge";
                test    false            �            1259    90447    marcas    TABLE     g   CREATE TABLE public.marcas (
    marca_id integer NOT NULL,
    nombre_marca character varying(255)
);
    DROP TABLE public.marcas;
       public         heap    test    false            �            1259    90445    marcas_marca_id_seq    SEQUENCE     �   CREATE SEQUENCE public.marcas_marca_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.marcas_marca_id_seq;
       public          test    false    205                       0    0    marcas_marca_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.marcas_marca_id_seq OWNED BY public.marcas.marca_id;
          public          test    false    204            �            1259    90439    proveedores    TABLE     t   CREATE TABLE public.proveedores (
    proveedor_id integer NOT NULL,
    nombre_proveedor character varying(255)
);
    DROP TABLE public.proveedores;
       public         heap    test    false            �            1259    90437    proveedores_proveedor_id_seq    SEQUENCE     �   CREATE SEQUENCE public.proveedores_proveedor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.proveedores_proveedor_id_seq;
       public          test    false    203                       0    0    proveedores_proveedor_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.proveedores_proveedor_id_seq OWNED BY public.proveedores.proveedor_id;
          public          test    false    202            �            1259    90453    proveedormarca    TABLE     �   CREATE TABLE public.proveedormarca (
    proveedor_id integer NOT NULL,
    marca_id integer NOT NULL,
    tipo_proveedor character(1)
);
 "   DROP TABLE public.proveedormarca;
       public         heap    test    false            �
           2604    90450    marcas marca_id    DEFAULT     r   ALTER TABLE ONLY public.marcas ALTER COLUMN marca_id SET DEFAULT nextval('public.marcas_marca_id_seq'::regclass);
 >   ALTER TABLE public.marcas ALTER COLUMN marca_id DROP DEFAULT;
       public          test    false    205    204    205            �
           2604    90442    proveedores proveedor_id    DEFAULT     �   ALTER TABLE ONLY public.proveedores ALTER COLUMN proveedor_id SET DEFAULT nextval('public.proveedores_proveedor_id_seq'::regclass);
 G   ALTER TABLE public.proveedores ALTER COLUMN proveedor_id DROP DEFAULT;
       public          test    false    203    202    203                      0    90447    marcas 
   TABLE DATA           8   COPY public.marcas (marca_id, nombre_marca) FROM stdin;
    public          test    false    205   ^                 0    90439    proveedores 
   TABLE DATA           E   COPY public.proveedores (proveedor_id, nombre_proveedor) FROM stdin;
    public          test    false    203   �!                 0    90453    proveedormarca 
   TABLE DATA           P   COPY public.proveedormarca (proveedor_id, marca_id, tipo_proveedor) FROM stdin;
    public          test    false    206   �%                  0    0    marcas_marca_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.marcas_marca_id_seq', 321, true);
          public          test    false    204                       0    0    proveedores_proveedor_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.proveedores_proveedor_id_seq', 85, true);
          public          test    false    202            �
           2606    90452    marcas marcas_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.marcas
    ADD CONSTRAINT marcas_pkey PRIMARY KEY (marca_id);
 <   ALTER TABLE ONLY public.marcas DROP CONSTRAINT marcas_pkey;
       public            test    false    205            �
           2606    90444    proveedores proveedores_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (proveedor_id);
 F   ALTER TABLE ONLY public.proveedores DROP CONSTRAINT proveedores_pkey;
       public            test    false    203            �
           2606    90457 "   proveedormarca proveedormarca_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.proveedormarca
    ADD CONSTRAINT proveedormarca_pkey PRIMARY KEY (proveedor_id, marca_id);
 L   ALTER TABLE ONLY public.proveedormarca DROP CONSTRAINT proveedormarca_pkey;
       public            test    false    206    206            �
           2606    90463 +   proveedormarca proveedormarca_marca_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.proveedormarca
    ADD CONSTRAINT proveedormarca_marca_id_fkey FOREIGN KEY (marca_id) REFERENCES public.marcas(marca_id);
 U   ALTER TABLE ONLY public.proveedormarca DROP CONSTRAINT proveedormarca_marca_id_fkey;
       public          test    false    2702    206    205            �
           2606    90458 /   proveedormarca proveedormarca_proveedor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.proveedormarca
    ADD CONSTRAINT proveedormarca_proveedor_id_fkey FOREIGN KEY (proveedor_id) REFERENCES public.proveedores(proveedor_id);
 Y   ALTER TABLE ONLY public.proveedormarca DROP CONSTRAINT proveedormarca_proveedor_id_fkey;
       public          test    false    203    2700    206               @  x�u�˲�(����zW%��.)�x�F�[��?�|���YLDEB���G���&����'�V*,�0MQߔ݂ե�Ǘ�+��]ԕj�w�)gu�v�\�U7�{�_�b����窟[����Q�eu~SGb�T�#������J^��jn7�7ʦA���l���?�6���j�����*��.Y��O��Uf�kSa]�b�Yk�Β���!S�'�r�IW�#:]��U_uaT򟬏3�(����)H��4�޺���-Q�z���j�lj�d]��.������z�m�������ͨ�ӷB�Ӑ9;Ŵ�v�7N�ol1�e�[����݉H<U���S�5�^������-���t���|��K���mQ��Jv:޺�qd	g���3J܏�J}�Ԫ��t٨�e[�8[�X�~%�Gw���ڭ۬�\��P���������C&�����%���1�R�����˲r�c8�el ~��7*�̦�/{X���j���U:v{���(�f�l?�_�
������_W�r?��N��F����W�vO]5j@�W�H��U���F����cW�����oj�Q�h5,����j���TjM�5յJ-�IħI7�v���4~�dm��5Fm>%B�jB{�A77���7ݰ�$�x&�|���)e�QsWq#�:��J������Z�髛FRu�׫�=�0"���Yu5��ͯxj�?2g�	�FO��eO1�kw��v��Ja��|���V?�����5H�e1�~eK���n����#r���'�V{L�s2�s�����Dh| 	�\��0���|����Q��6W����'t؆c9�耋dr#֌ܢ�I�}�$38h�sD�t��M�!�!?�����b����H���@���G�q`�챊�s`1�r-�1=h�D��h���M�26�b�@Y亴�g�0|���l�����S��	P;�>�BHYzB֛�Py�g.$w����˧�/��eP��e���v�����j�]Z/��-L��˶�e�(o�J�8����{�;���~�)v��������j04��$��@�a�Dή~�{�J�L�ӧ�x�: ��v�O����.n�,�d.NǼ�"'����ߝc%��h��r�;?Kr�%&n��	���D�%�����h���}�â���p��+�(x�����Z�z	,S�`��{����}�Y!�O�V�3���-�ղ-�z���-pUKl��u�X����b�s!X�1ƃ��	��/�37��YpmL�j-�
��@-WLw��u_6j���Q?�0�!OdG�@�K���P�����9P��d�Ҕ��&D>}�6��&
l&i6ǝ���_}f�~Z P�#��ڄ�(��WA�^<3��ra���޾iJ6p�Q(@:�MҮU�m�q"n �^�M��@7n^����������%��-�ȳ��\<�uR��S�k� �j��6nuՖ��Z��b6Pm�QHb���eH΃ohq��x�ʿ�(�f��J�O��涋���t��o�渤H�WH��b��@�w<�G�����%��E�f@�f������
����O�P���BM��>c���V�f����9Z��m���34��ϲ�@�W���ˀ1���J6P��
f���ak���$5{�"��l�b�P�L�x"vS�ᔠ�����F��.��(`���D���`@��2�@��|'@�$�R���`���% $ō�>��򬔧~0�g=�W)$:�(��F*�.���@�=BUiި�0��]����%}_��. $(J�J��G�p���<��HfW���)?lN��dJ�����Tװ�2<��~;��B�����r06~�q�A]pJn�����_K��t`�Xģc䋄��L��"2H�.\���v�w9�;�=�,@��e]`+�d`\~%|h'�lp���
Ao@�;��c�p6��u�gC&�B��k|�IbX@	l�Y&���4 ���|��)<v�9���;G����N ��>`0��yTAR(~��\>4�ck\��l4�1�A�
���ҭ ������7�[          �  x�eU˶�6\��B�d1>捗���|��H��>���HI���fa��Q]����2��g��꣌���8(��'>��9��x[�ßQ,��
'{uv,V�hf��Ȣ���C�#��h�TȦ������=p�˦#J=�6����iy�(Τx^̻���{���x'�8s\-��h�����~抔Z݃��Ά�	��`�͌> _C*�C�Qb���g���ZEG#����Fm�W�� ��o��Q�2���~�-Y���,�;�7 �>��w��9V?��y[������-���3� 3 ��P�и�5��z�5kt@�eKzJ������H�3z�7�̄�mΕ� ʞ�ߋ�x������$_�0�}P�9sg���ʘ!榭����c�
�r�kH5�����p���k0
dω�jcM���.D��	T��Yޜ���^KS�/+Qux4o��ldg�UO7j��f�>�X]�(�N�@��̄1�ǐh
��� .�
I$���%�y�� �C<�U�{��[E]�yh(��7t��p�D�-ݷ9�SwxtkҢQH��5�)u�v��7���B֯[����L3��g�����3�����)���T�
�s���y�NS�<.r��74��!�Vn'Ѵ���r���
h:8V���)`��L.���h.( ��D�OJ�
����W!���p��-�i���Ӵe~��:.W�N[^s^l;D[�G����������rmC��r8�-��'}�S��h�������㿵*�˟��i�JҘY{���f����-�Nߝ�x�	(ad���[b�w����Ft����6�������ȻX�lE��"�"�a�ќ�Ψ���1�}�F�P��NE�o�E�R4#���(n}�*/���-��l���0�l�ϴr���|�<a�YE�/���$�|�$����}E�Tf�gD5�t�������]������b��         C  x�UX[�,)�����t7�����1�dv��iR@M�]�ϟ��X�z��?6 |B�g��Y)�o寿)ʲ���1O��o�s bC�'Ғ�@��� _�<��M����6t`��L����&ٍ�7�o4��l6�l6�q�lN�yѴ��)�$Ikrfl"|����jQ,r�+6�b%���ǊLҶ"�2H=Vd2�R�3�VϷ�#N�&�x�$�yf��D �Ԑ�vɟY��,��ULP��Я␍U�h��A�.�� ,c�:��d{�ۤ�bW����֦��v���`��}ؾl�n�ۛ��`{�ml�ߞl��^l/��o��&�M~��v�� �Io��]nғ�&m'm'm'm'm'm'm'm�8�N��z:��,=�h꽏��4��,:y*t���x��B�~����m��F?�g�ஷd���M�G����N���򼔣y����W���x΢z�m��-��i�4�Vs�à��q�ՇW��$w���e�.c�i���%��^����2F�1��q��9�=l���r� � &r(@���XK:�4.Mh���Hs�1$����]s��|�⦜�̎~kj`�<q[ΥY�U��K�K�5����S8�"�`����4����� >�Eô�*�cZ(L��L[aڊN3�i ��hXW�+ー3��S��t>��Z��<�$GS�xQ�y�TS��c�NGcv0�;�������;^*J��},W��Ѯ�@�d���T�!Š¤`a��ŤbI�8_kRnY�,���!X
����ŵA  )�&�g��k?u��o�O(�&8� �p�[�n ���Y� ml�����dB�B�s	j��o�dj�L`��9��Y�P&d����"�e"OV'W�\1����m@��xK�E�^8�r�91��[ln���tu���.Z g߿\�\�&�#Po��5r=B����� ��](v ��lݚ%�(}{)vJ��Uf��ސЅB~��@��
Q�VW����WQE-tz����1BoG("(�ǔe���QhP=�������(6�R�QhPu,�����QhPl`���7��9
* ��]k���{tK�q���*i\-5H�]h��Վ}�s���3�n���4�����Q�f:A�����ՙ�f��0��4�j{I�P��#�Kӏ��S
f��`��iɴ4�ikN��_&�ɥ�^��!���+���`�+>�Z(j��=�*�Dy�Z�����ǹ�&�Rh�M� � �J
��� ���@��)\#+(���L��1��Q���: �\F�x��4Z(
���LXS�d����[rfγ��^��^� �������ً� �'Ƭe��(�]����3�'�|�|��S{ �����c���Q ��3TvY�
��1��rF�� 9N9����S,-gi�K䗖�Du���%�(��Y�li�~�*ꭲD��]��2`YG
�,\X�+�҄�hO��s>��	�Ӯ�8,�EP���]���>m]��`�қ��_�pu�:hb
��>�-;8��0G.G.?m��7C)�������� .�<�Ao����0��(A�EW�PQ�|0C�Z��Z�k���N)P�Ը���5�k^�;^L�%�9^�X/�7蹿�*g|��9�\j����XC1���1��zr���  X����眨�L�u� �W!�oL���X'�CP�[� ڇ����Њ�Bd:�纑���ܑ���������+�9�1�rs�	6S�D^8�w�>�2UN�ʚb��D����J�s����{��N��]�L.�n�`�٠X [���ω5.2ӿ�����ѽ�!     