FasdUAS 1.101.10   ��   ��    k             l      �� ��   � paste.applescript
 * 
 * Created by Jacob Rus on 2006-05-26.
 * Additional work by Allan Odgaard
 * 
 * This script sets up a list of options, allows TextMate to paste the
 * selected text to a pastebin, sets up a list of possible actions to
 * perform with the link, depending on what applications are available,
 * and carries those actions out.  Some options include:
 * 
 *   - Copy the URL to the clipboard
 *   - Send the URL to Quicksilver
 *   - Open the URL in the default browser
 *   - Paste the URL to an open IRC channel in Colloquy
 *   - Paste the URL to an open chat in Adium
 *   - Paste the URL to a chat in iChat
 *   
 * Note that for these last two, if multiple channels or chats are open with
 * the same name, this Applescript will not attempt to distinguish between
 * them, and will paste to the first available channel or chat which matches
 * the user's choice.
 * 
        	  l     ������  ��   	  
  
 l     ������  ��        l     �� ��    !  ==========================         l     �� ��    !  = SET UP LIST OF OPTIONS =         l     �� ��    !  ==========================         l     ������  ��        l     �� ��      initialize the list         l     ��  r         J     ����    o      ���� 0 the_list  ��         l     ������  ��      ! " ! l     �� #��   # N H get a list of open applications, so that we can decide which actions to    "  $ % $ l     �� &��   &   present as options    %  ' ( ' l    )�� ) O     * + * r   	  , - , n   	  . / . 1    ��
�� 
pnam / 2  	 ��
�� 
pcap - o      ���� 0 openapps openApps + m     0 0�null     ߀��  �System Events.app�]��bp����   �    )       ��(�\�x��� �sevs   alis    �  Ladybird                   ���BH+    �System Events.app                                                k��d�        ����  	                CoreServices    ���"      �c��      �  �  �  6Ladybird:System:Library:CoreServices:System Events.app  $  S y s t e m   E v e n t s . a p p    L a d y b i r d  -System/Library/CoreServices/System Events.app   / ��  ��   (  1 2 1 l     ������  ��   2  3 4 3 l     �� 5��   5 9 3 get open IRC channels from Colloquy, if it is open    4  6 7 6 l   ^ 8�� 8 Z    ^ 9 :���� 9 E     ; < ; o    ���� 0 openapps openApps < m     = =  Colloquy    : k    Z > >  ? @ ? O   * A B A r    ) C D C l 	  ' E�� E l   ' F�� F b    ' G H G n    ! I J I 1    !��
�� 
pnam J 2   ��
�� 
dchM H n   ! & K L K 1   $ &��
�� 
pnam L 2  ! $��
�� 
crmM��  ��   D o      ���� 0 colloquy_channels   B m     M M�null     ߀��  *Colloquy.app�   �]��bp���    � 4   )       ��(�\�x���0�coRC   alis    H  Ladybird                   ���BH+    *Colloquy.app                                                    R���{\        ����  	                Applications    ���"      ��_<      *  "Ladybird:Applications:Colloquy.app    C o l l o q u y . a p p    L a d y b i r d  Applications/Colloquy.app   / ��   @  N O N Z   + ; P Q���� P >  + / R S R o   + ,���� 0 colloquy_channels   S J   , .����   Q r   2 7 T U T b   2 5 V W V o   2 3���� 0 the_list   W m   3 4 X X  Paste to Colloquy:    U o      ���� 0 the_list  ��  ��   O  Y�� Y X   < Z Z�� [ Z r   L U \ ] \ b   L S ^ _ ^ o   L M���� 0 the_list   _ J   M R ` `  a�� a b   M P b c b m   M N d d   	    c o   N O���� 0 each_channel  ��   ] o      ���� 0 the_list  �� 0 each_channel   [ o   ? @���� 0 colloquy_channels  ��  ��  ��  ��   7  e f e l     ������  ��   f  g h g l     �� i��   i / ) get open chats from Adium, if it is open    h  j k j l  _ � l�� l Z   _ � m n���� m E   _ b o p o o   _ `���� 0 openapps openApps p m   ` a q q  Adium    n k   e � r r  s t s O  e y u v u r   k x w x w l  k t y�� y n   k t z { z 1   p t��
�� 
AchN { 2  k p��
�� 
Acht��   x o      ���� 0 adium_chats   v m   e h | |�null     ߀��  *	Adium.app����   �]��bp���    � 4   )       ��(�\�x���0�AdIM   alis    <  Ladybird                   ���BH+    *	Adium.app                                                       F���`��        ����  	                Applications    ���"      �`m�      *  Ladybird:Applications:Adium.app    	 A d i u m . a p p    L a d y b i r d  Applications/Adium.app  / ��   t  } ~ } Z   z �  �����  >  z � � � � o   z }���� 0 adium_chats   � J   } ����   � r   � � � � � b   � � � � � o   � ����� 0 the_list   � m   � � � �  Paste to Adium:    � o      ���� 0 the_list  ��  ��   ~  ��� � X   � � ��� � � r   � � � � � b   � � � � � o   � ����� 0 the_list   � J   � � � �  ��� � b   � � � � � m   � � � � 	   	    � o   � ����� 0 	each_chat  ��   � o      ���� 0 the_list  �� 0 	each_chat   � o   � ����� 0 adium_chats  ��  ��  ��  ��   k  � � � l     ������  ��   �  � � � l     �� ���   � 8 2 get all online accounts from iChat, if it is open    �  � � � l  �) ��� � Z   �) � ����� � E   � � � � � o   � ����� 0 openapps openApps � m   � � � �  iChat    � k   �% � �  � � � O  � � � � � r   � � � � � 6 � � � � � n   � � � � � 1   � ���
�� 
pnam � 2  � ���
�� 
pres � F   � � � � � >  � � � � � 1   � ���
�� 
stat � m   � ���
�� pstaoffl � >  � � � � � 1   � ���
�� 
stat � m   � ���
�� pstaunkn � o      ���� 0 ichat_accounts   � m   � � � ��null     ߀��  *	iChat.app����   �]��bp���    � 4   )       ��(�\�x���0�fez!   alis    <  Ladybird                   ���BH+    *	iChat.app                                                       A�d<        ����  	                Applications    ���"      �d,      *  Ladybird:Applications:iChat.app    	 i C h a t . a p p    L a d y b i r d  Applications/iChat.app  / ��   �  � � � Z   � � ����� � >  � � � � � o   � ����� 0 ichat_accounts   � J   � �����   � r   � � � � � b   � � � � � o   � ����� 0 the_list   � m   � � � �  Paste to iChat:    � o      ���� 0 the_list  ��  ��   �  ��� � X  % ��� � � r    � � � b   � � � o  ���� 0 the_list   � J   � �  ��� � b   � � � m   � � 
    	    � o  ���� 0 	each_chat  ��   � o      ���� 0 the_list  �� 0 	each_chat   � o  	���� 0 ichat_accounts  ��  ��  ��  ��   �  � � � l     ������  ��   �  � � � l     �� ���   �   add singular actions    �  � � � l *1 ��� � r  *1 � � � b  */ � � � o  *+���� 0 the_list   � m  +. � �  Open in Browser    � o      ���� 0 the_list  ��   �  � � � l 29 ��� � r  29 � � � b  27 � � � o  23���� 0 the_list   � m  36 � �  Copy Link to Clipboard    � o      ���� 0 the_list  ��   �  � � � l :M ��� � Z  :M � ����� � E  :? � � � o  :;���� 0 openapps openApps � m  ;> � �  Quicksilver    � r  BI � � � b  BG � � � o  BC���� 0 the_list   � m  CF � �  Send to Quicksilver    � o      ���� 0 the_list  ��  ��  ��   �  � � � l     ������  ��   �  � � � l NW ��� � r  NW � � � I  NS��������  0 defaultchoices defaultChoices��  ��   � o      ���� 0 default_items  ��   �  � � � l X� ��� � O  X� � � � r  ^� � � � I ^��� � �
�� .gtqpchltns    @   @ ns   � l 
^_ ��� � o  ^_���� 0 the_list  ��   � �� � �
�� 
okbt � m  be � �  Paste    � � 
� 
prmp  l 	hk�~ m  hk   Pick destinations for URL:   �~   �}
�} 
appr l 	nq�| m  nq ! Paste Selection to Pastebin   �|   �{	
�{ 
inSL o  tw�z�z 0 default_items  	 �y
�x
�y 
mlsl
 m  z{�w
�w boovtrue�x   � o      �v�v 0 the_choices   � m  X[�null     ߀�� �vTextMate.app�   ��]�0�bp����   �    )       ��(�\�x��� �TxMt   alis    �  Ladybird                   ���BH+   �vTextMate.app                                                    RW����Q        ����  	                Deployment (ppc)    ���"      ���1     �v Q c�  k�  5Ladybird:Users:duff:Oak:Deployment (ppc):TextMate.app     T e x t M a t e . a p p    L a d y b i r d  ,Users/duff/Oak/Deployment (ppc)/TextMate.app  /    ��  ��   �  l     �u�t�u  �t    l     �s�r�s  �r    l     �q�q   %  ==============================     l     �p�p   %  = PASTE TEXT TO THE PASTEBIN =     l     �o�o   %  ==============================     l     �n�m�n  �m    l ���l r  �� m  ��         o      �k�k 0 the_url  �l   !"! l ��#�j# Z  ��$%�i�h$ > ��&'& o  ���g�g 0 the_choices  ' m  ���f
�f boovfals% k  ��(( )*) I  ���e+�d�e 0 savechoices saveChoices+ ,�c, o  ���b�b 0 the_choices  �c  �d  * -�a- r  ��./. I ���`0�_
�` .sysoexecTEXT���     TEXT0 l 	��1�^1 m  ��22 - '"$TM_BUNDLE_SUPPORT/paste_to_pastie.rb"   �^  �_  / o      �]�] 0 the_url  �a  �i  �h  �j  " 343 l     �\�[�\  �[  4 565 l     �Z7�Z  7 $  =============================   6 898 l     �Y:�Y  : $  = PERFORM REQUESTED OPTIONS =   9 ;<; l     �X=�X  = $  =============================   < >?> l     �W�V�W  �V  ? @A@ l ��B�UB Z  ��CD�T�SC > ��EFE o  ���R�R 0 the_url  F m  ��GG      D I  ���QH�P�Q 0 actonurl actOnURLH IJI o  ���O�O 0 the_url  J K�NK o  ���M�M 0 the_choices  �N  �P  �T  �S  �U  A LML l     �L�K�L  �K  M NON l     �J�I�J  �I  O PQP i     RSR I      �HT�G�H 0 actonurl actOnURLT UVU o      �F�F 0 the_url  V W�EW o      �D�D 0 the_choices  �E  �G  S X    X�CYX k   	ZZ [\[ r    ]^] c    _`_ o    �B�B 0 each_action  ` m    �A
�A 
TEXT^ o      �@�@ 0 each_action  \ aba l   �?�>�?  �>  b cdc l   �=e�=  e "  send the URL to Quicksilver   d f�<f Z   	ghi�;g l   j�:j =   klk o    �9�9 0 each_action  l m    mm  Send to Quicksilver   �:  h k    .nn opo O    ,qrq k     +ss tut I    %�8�7�6
�8 .miscactvnull��� ��� null�7  �6  u v�5v r   & +wxw o   & '�4�4 0 the_url  x 1   ' *�3
�3 
sele�5  r m    yy�null     ߀��  *Quicksilver.app  �]�    ����   � H   )       ��(�\�x����daed   alis    T  Ladybird                   ���BH+    *Quicksilver.app                                                 K	-����        ����  	                Applications    ���"      ����      *  %Ladybird:Applications:Quicksilver.app      Q u i c k s i l v e r . a p p    L a d y b i r d  Applications/Quicksilver.app  / ��  p z{z l  - -�2�1�2  �1  { |�0| l  - -�/}�/  } $  send the URL to the clipboard   �0  i ~~ =  1 4��� o   1 2�.�. 0 each_action  � m   2 3��  Copy Link to Clipboard    ��� k   7 >�� ��� I  7 <�-��,
�- .JonspClpnull���     ****� o   7 8�+�+ 0 the_url  �,  � ��� l  = =�*�)�*  �)  � ��(� l  = =�'��'  � * $ open the URL in the default browser   �(  � ��� =  A D��� o   A B�&�& 0 each_action  � m   B C��  Open in Browser   � ��� k   G N�� ��� I  G L�%��$
�% .GURLGURLnull��� ��� TEXT� o   G H�#�# 0 the_url  �$  � ��� l  M M�"�!�"  �!  � �� � l  M M���  � 6 0 paste the URL to the requested IRC channel/chat   �   � ��� C   Q T��� o   Q R�� 0 each_action  � m   R S��   	   � ��� k   W ��� ��� r   W `��� I   W ^���� 0 striplength  � ��� o   X Y�� 0 each_action  � ��� m   Y Z�� �  �  � o      �� 0 each_action  � ��� O   a ���� k   e ��� ��� r   e ~��� n   e |��� 1   x |�
� 
trgA� n   e x��� 4   u x��
� 
cobj� m   v w�� � l  e u��� 6  e u��� 2  e h�
� 
chvC� =  k t��� 1   l p�
� 
pnam� o   q s�� 0 each_action  �  � o      �� 0 the_channel  � ��� I   ����
� .ccoRsCmXnull���     TEXT� l   ���� b    ���� m    ���  pasted    � o   � ��� 0 the_url  �  � ���
� 
sCm1� o   � ��
�
 0 the_channel  � �	��
�	 
sCm3� m   � ��
� savoyes �  �  � m   a b M� ��� l  � ����  �  � ��� l  � ����  � * $ paste the URL to the requested chat   �  � ��� C   � ���� o   � ��� 0 each_action  � m   � ��� 	   	   � ��� k   � ��� ��� r   � ���� I   � ���� � 0 striplength  � ��� o   � ����� 0 each_action  � ���� m   � ����� ��  �   � o      ���� 0 each_action  � ��� O  � ���� l 	 � ����� O  � ���� l 	 � ����� I  � ������
�� .AdIMsndMnull���    cobj��  � �����
�� 
TO  � o   � ����� 0 the_url  ��  ��  � n   � ���� 4   � ����
�� 
cobj� m   � ����� � l  � ����� 6  � ���� 2  � ���
�� 
Acht� =  � ���� 1   � ���
�� 
AchN� o   � ����� 0 each_action  ��  ��  � m   � � |� ��� l  � �������  ��  � ���� l  � ������  � * $ paste the URL to the requested chat   ��  � ��� C   � ���� o   � ����� 0 each_action  � m   � ��� 
    	   � ���� k   ��� ��� r   � ���� I   � �������� 0 striplength  � � � o   � ����� 0 each_action    �� m   � ����� ��  ��  � o      ���� 0 each_action  �  O  � l 	 ��� I  ���
�� .ichtsendnull���    obj  o   � ����� 0 the_url   ��	��
�� 
TO  	 l  � �
��
 4   � ���
�� 
pres o   � ����� 0 each_action  ��  ��  ��   m   � � � �� l ������  ��  ��  ��  �;  �<  �C 0 each_action  Y o    ���� 0 the_choices  Q  l     ������  ��    l     ������  ��    l     ����     load default choices     i     I      ��������  0 defaultchoices defaultChoices��  ��   k     ;  Q     8 k    (   r    !"! b    #$# l 	  %��% l   &��& I   ��'(
�� .earsffdralis        afdr' m    ��
�� afdmpref( ��)*
�� 
from) m    ��
�� fldmfldu* ��+��
�� 
rtyp+ m    ��
�� 
ctxt��  ��  ��  $ l 	  ,��, m    -- 7 1com.macromates.textmate.paste_to_server.as_record   ��  " o      ���� 0 
prefs_file    ./. r    010 I   ��2��
�� .rdwropenshor       file2 o    ���� 0 
prefs_file  ��  1 o      ���� 0 f  / 343 r    "565 I    ��78
�� .rdwrread****        ****7 o    ���� 0 f  8 ��9��
�� 
as  9 m    ��
�� 
list��  6 o      ���� 0 the_list  4 :��: I  # (��;��
�� .rdwrclosnull���     ****; o   # $���� 0 f  ��  ��   R      ������
�� .ascrerr ****      � ****��  ��   k   0 8<< =>= l  0 0��?��  ? / ) either one could be the name in Colloquy   > @��@ r   0 8ABA J   0 6CC DED m   0 1FF   	#textmate   E G��G m   1 4HH   	##textmate   ��  B o      ���� 0 the_list  ��   IJI l  9 9������  ��  J K��K L   9 ;LL o   9 :���� 0 the_list  ��   MNM l     ������  ��  N OPO l     ������  ��  P QRQ l     ��S��  S   save choices   R TUT i    VWV I      ��X���� 0 savechoices saveChoicesX Y��Y o      ���� 0 the_list  ��  ��  W k     %ZZ [\[ r     ]^] b     _`_ l 	   	a��a l    	b��b I    	��cd
�� .earsffdralis        afdrc m     ��
�� afdmprefd ��ef
�� 
frome m    ��
�� fldmflduf ��g��
�� 
rtypg m    ��
�� 
ctxt��  ��  ��  ` l 	 	 
h��h m   	 
ii 7 1com.macromates.textmate.paste_to_server.as_record   ��  ^ o      ���� 0 
prefs_file  \ jkj r    lml I   ��no
�� .rdwropenshor       filen o    ���� 0 
prefs_file  o ��p��
�� 
permp m    ��
�� boovtrue��  m o      ���� 0 f  k qrq I   ��st
�� .rdwrwritnull���     ****s o    ���� 0 the_list  t ��u��
�� 
refnu o    ���� 0 f  ��  r v��v I    %��w��
�� .rdwrclosnull���     ****w o     !���� 0 f  ��  ��  U xyx l     ������  ��  y z{z l     ������  ��  { |}| l     ��~��  ~ O I strip the first 'num' characters from 'longstring', returning the result   } �� i    ��� I      ������� 0 striplength  � ��� o      �� 0 
longstring  � ��~� o      �}�} 0 num  �~  ��  � L     �� c     ��� l    ��|� n     ��� 7  �{��
�{ 
cha � l   	��z� [    	��� o    �y�y 0 num  � m    �x�x �z  � l  
 ��w� n   
 ��� 1    �v
�v 
leng� o   
 �u�u 0 
longstring  �w  � o     �t�t 0 
longstring  �|  � m    �s
�s 
TEXT��       �r�������������q �p�o�n�m�l�k�j�r  � �i�h�g�f�e�d�c�b�a�`�_�^�]�\�[�Z�Y�X�W�V�i 0 actonurl actOnURL�h  0 defaultchoices defaultChoices�g 0 savechoices saveChoices�f 0 striplength  
�e .aevtoappnull  �   � ****�d 0 the_list  �c 0 openapps openApps�b 0 colloquy_channels  �a 0 adium_chats  �` 0 ichat_accounts  �_ 0 default_items  �^ 0 the_choices  �] 0 the_url  �\  �[  �Z  �Y  �X  �W  �V  � �US�T�S���R�U 0 actonurl actOnURL�T �Q��Q �  �P�O�P 0 the_url  �O 0 the_choices  �S  � �N�M�L�K�N 0 the_url  �M 0 the_choices  �L 0 each_action  �K 0 the_channel  � #�J�I�H�Gmy�F�E��D��C��B M�A��@�?��>�=�<�;�:� |�9�8�7�6� ��5�4
�J 
kocl
�I 
cobj
�H .corecnte****       ****
�G 
TEXT
�F .miscactvnull��� ��� null
�E 
sele
�D .JonspClpnull���     ****
�C .GURLGURLnull��� ��� TEXT�B 0 striplength  
�A 
chvC�  
�@ 
pnam
�? 
trgA
�> 
sCm1
�= 
sCm3
�< savoyes �; 
�: .ccoRsCmXnull���     TEXT
�9 
Acht
�8 
AchN
�7 
TO  
�6 .AdIMsndMnull���    cobj
�5 
pres
�4 .ichtsendnull���    obj �R�[��l kh ��&E�O��  � *j O�*�,FUOPY ڢ�  �j 	OPY ʢ�  �j OPY ��� E*�ll+ E�O� 1*�-a [a ,\Z�81�k/a ,E�Oa �%a �a a a  UOPY q�a  :*�ml+ E�Oa  $*a -a [a ,\Z�81�k/ *a �l UUOPY 1�a  (*�a l+ E�Oa   �a *a !�/l "UOPY h[OY�� �3�2�1���0�3  0 defaultchoices defaultChoices�2  �1  � �/�.�-�/ 0 
prefs_file  �. 0 f  �- 0 the_list  � �,�+�*�)�(�'�&-�%�$�#�"�!� �FH
�, afdmpref
�+ 
from
�* fldmfldu
�) 
rtyp
�( 
ctxt�' 
�& .earsffdralis        afdr
�% .rdwropenshor       file
�$ 
as  
�# 
list
�" .rdwrread****        ****
�! .rdwrclosnull���     ****�   �  �0 < *������ �%E�O�j E�O���l E�O�j W X  �a lvE�O�� �W������ 0 savechoices saveChoices� ��� �  �� 0 the_list  �  � ���� 0 the_list  � 0 
prefs_file  � 0 f  � �������i�����

� afdmpref
� 
from
� fldmfldu
� 
rtyp
� 
ctxt� 
� .earsffdralis        afdr
� 
perm
� .rdwropenshor       file
� 
refn
� .rdwrwritnull���     ****
�
 .rdwrclosnull���     ****� &������ �%E�O��el 	E�O��l O�j � �	�������	 0 striplength  � ��� �  ��� 0 
longstring  � 0 num  �  � ��� 0 
longstring  � 0 num  � � ����
�  
cha 
�� 
leng
�� 
TEXT� �[�\[Z�k\Z��,2�&� �����������
�� .aevtoappnull  �   � ****� k    ���  ��  '��  6��  j��  ���  ���  ���  ���  ���  ��� �� !�� @����  ��  ��  � ������ 0 each_channel  �� 0 	each_chat  � 9�� 0������ = M������ X������ d q |������ � � � ������������ � � � � � ������� ��������������� ����2��G���� 0 the_list  
�� 
pcap
�� 
pnam�� 0 openapps openApps
�� 
dchM
�� 
crmM�� 0 colloquy_channels  
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
Acht
�� 
AchN�� 0 adium_chats  
�� 
pres
�� 
stat
�� pstaoffl
�� pstaunkn�� 0 ichat_accounts  ��  0 defaultchoices defaultChoices�� 0 default_items  
�� 
okbt
�� 
prmp
�� 
appr
�� 
inSL
�� 
mlsl�� 

�� .gtqpchltns    @   @ ns  �� 0 the_choices  �� 0 the_url  �� 0 savechoices saveChoices
�� .sysoexecTEXT���     TEXT�� 0 actonurl actOnURL���jvE�O� 	*�-�,E�UO�� G� *�-�,*�-�,%E�UO�jv 
��%E�Y hO �[��l kh  ��%kv%E�[OY��Y hO�� Qa  *a -a ,E` UO_ jv �a %E�Y hO !_ [��l kh �a �%kv%E�[OY��Y hO�a  la  **a -�,a [[a ,\Za 9\[a ,\Za 9A1E` UO_ jv �a %E�Y hO !_ [��l kh �a �%kv%E�[OY��Y hO�a  %E�O�a !%E�O�a " �a #%E�Y hO*j+ $E` %Oa & )�a 'a (a )a *a +a ,a -_ %a .ea / 0E` 1UOa 2E` 3O_ 1f *_ 1k+ 4Oa 5j 6E` 3Y hO_ 3a 7 *_ 3_ 1l+ 8Y h� ����� �   X���� ������� � � ��    	JEG2                  � '  	caprica_six                  � $ 
 	nickserv                  � %  	#textmate                  � (    	James Gray                  � 0    	Jeroen van der Ham                  � *    	DetronnorteD                  � +    	drunkenbatman                  � +    	Allan Odgaard                  � .    	Nicholas Jitkoff                  � ����� �  �������������������������������� ���  l o g i n w i n d o w� ���  D o c k� ���  S y s t e m U I S e r v e r� ���  F i n d e r� ���  S S H K e y c h a i n� ���  R e m i n d e r M a t e� ���  i T u n e s H e l p e r� ���  E y e T V   H e l p e r� ���  Q u i c k s i l v e r� ���  G e e k T o o l� ���  i T u n e s� ���  D a s h b o a r d C l i e n t� ���  D a s h b o a r d C l i e n t� ���  D a s h b o a r d C l i e n t� ���  D a s h b o a r d C l i e n t� ���  D a s h b o a r d C l i e n t� ���   t e x t p a n d e r d a e m o n� ���  S y s t e m   E v e n t s� ���  M a i l� ���  C o l l o q u y� ���  O m n i W e b� ���  T e r m i n a l� ���  i C h a t A g e n t� ��� 
 A d i u m� ���  P l a y e r� �    C o n s o l e� � 
 X c o d e� �  U n i v e r s a l A c c e s s� �  T e x t M a t e� � 
 i C h a t� �  S c r i p t   E d i t o r� ����   	
 �  J E G 2 �  c a p r i c a _ s i x	 �  n i c k s e r v
 �  # t e x t m a t e� ����     � ����    �  J a m e s   G r a y � $ J e r o e n   v a n   d e r   H a m �  D e t r o n n o r t e D �  d r u n k e n b a t m a n �  A l l a n   O d g a a r d �   N i c h o l a s   J i t k o f f� ����    +    	Allan Odgaard                  
�q boovfals�p  �o  �n  �m  �l  �k  �j   ascr  ��ޭ