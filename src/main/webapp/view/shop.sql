
CREATE TABLE shop_t	(
idx	 number(4)		Not Null    primary key,
category	 varchar2(10)		Not Null,
p_num		 varchar2(10)		Not Null,
p_name		 varchar2(50)		Not Null,
p_company varchar2(50)		Not Null,
p_price		 number(10)			Not Null,
p_saleprice number(10)			Not Null,
p_image_s	 varchar2(50)		Null,
p_image_l	 varchar2(50)		Null,
p_content	 varchar2(4000)	Not Null,
p_date		 date	Not Null	) ;

create sequence shop_seq
increment by 1
start with 1;

insert into shop_t values(shop_seq.nextVal,'sp003', 'RC-113',
'로체스 인라인','로체스',3200,1150,'pds1.jpg','pds1_z.jpg',
'바이오맥스 통풍 나일론-HGPU SHELL * 특수 충격 흡수 밑창 * 신발끈 메모리 버클 * 힐 락에 의한 신속한 신발끈 시스템 * 느린 메모리 포말에 의한 편안한 통풍성의 숨쉬는 라이너 * 쿨 통풍 시스템 * 통풍성의 인체공학적 신발밑창 * 손쉬운 엔트리 시스템(신기 편한 입구) * 몰디드 알루미늄 프레임 * 80mm 82a hyper dubbs 휠 * 강철 스페이서 * ABEC-5 베어링',sysdate);

insert into shop_t values(shop_seq.nextVal,'ele002', 'vC-13',
'사니PDP-TV','사니',9200,4750,'pds4.jpg','pds4_z.jpg',
'질러~ 질러! 무조건 질러봐~ 후회 하지 않아~~',sysdate);





