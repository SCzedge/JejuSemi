﻿-----------------삭제------------------
--접속유저의 모든테이블 및 제약조건 삭제
BEGIN
    FOR C IN (SELECT TABLE_NAME FROM USER_TABLES) LOOP
    EXECUTE IMMEDIATE ('DROP TABLE '||C.TABLE_NAME||' CASCADE CONSTRAINTS');
    END LOOP;
END;
/
--접속유저의 모든 시퀀스 삭제
BEGIN
FOR C IN (SELECT * FROM USER_SEQUENCES) LOOP
  EXECUTE IMMEDIATE 'DROP SEQUENCE '||C.SEQUENCE_NAME;
END LOOP;
END;
/
---------------------------------------

CREATE TABLE "NATION" (
	"NATION_CODE"	NUMBER		NOT NULL,
	"NATION_NAME"	VARCHAR2(3)	NOT NULL,
	"IMG_PATH"	VARCHAR2(300)	NOT NULL
);

COMMENT ON COLUMN "NATION"."NATION_CODE" IS '국가코드';

COMMENT ON COLUMN "NATION"."NATION_NAME" IS '국가명';

COMMENT ON COLUMN "NATION"."IMG_PATH" IS '이미지경로';




CREATE TABLE "MEMBER" (
	"MEM_NUM"	NUMBER		NOT NULL,
	"MEM_ID"		VARCHAR2(50)	NOT NULL,
	"MEM_PWD"	VARCHAR2(20)	NOT NULL,
	"MEM_NAME"	VARCHAR2(20)	NULL,
	"MEM_GENDER"	VARCHAR2(1)	CHECK(MEM_GENDER IN('M','F')),
	"MEM_PHONE"	VARCHAR2(15)	NULL,
	"NATION_CODE"	NUMBER		NOT NULL,
	"MEM_POINT"	NUMBER		NULL,
	"MEM_TYPE"	VARCHAR2(1)	CHECK(MEM_TYPE IN('A','O','U')),
	"MEM_STATUS"	VARCHAR2(1)	DEFAULT 'Y'	CHECK(MEM_STATUS IN('Y','N')),
	"ENROLL_DATE"	DATE		DEFAULT SYSDATE	NOT NULL,
	"OUT_DATE"	DATE		NULL,
	"NOSHOW"	NUMBER		DEFAULT 0 NOT NULL
);

COMMENT ON COLUMN "MEMBER"."MEM_NUM" IS '회원번호';

COMMENT ON COLUMN "MEMBER"."MEM_ID" IS '회원아이디';

COMMENT ON COLUMN "MEMBER"."MEM_PWD" IS '비밀번호';

COMMENT ON COLUMN "MEMBER"."MEM_NAME" IS '이름';

COMMENT ON COLUMN "MEMBER"."MEM_GENDER" IS '성별';

COMMENT ON COLUMN "MEMBER"."MEM_PHONE" IS '휴대폰';

COMMENT ON COLUMN "MEMBER"."NATION_CODE" IS '국가코드';

COMMENT ON COLUMN "MEMBER"."MEM_POINT" IS '포인트';

COMMENT ON COLUMN "MEMBER"."MEM_TYPE" IS '관리자A/오너O/사용자U';

COMMENT ON COLUMN "MEMBER"."MEM_STATUS" IS '상태(y/n)';

COMMENT ON COLUMN "MEMBER"."ENROLL_DATE" IS '가입일';

COMMENT ON COLUMN "MEMBER"."OUT_DATE" IS '탈퇴일(정지일)';

COMMENT ON COLUMN "MEMBER"."NOSHOW" IS '노쇼누적횟수';





CREATE TABLE "ACCOMMODATION" (
	"ACM_NUM"		NUMBER		NOT NULL,
	"ACM_NAME"		VARCHAR2(100)	NOT NULL,
	"MEM_NUM"		NUMBER		NOT NULL,
	"ACM_PHONE"		VARCHAR2(15)	NOT NULL,
	"ACM_ADDRESS"		VARCHAR2(100)	NOT NULL,
	"ACM_TYPE"		VARCHAR2(1)	CHECK(ACM_TYPE IN('H','R','C','G','M')),
	"ACM_GRADE"		NUMBER		CHECK(ACM_GRADE IN(1,2,3,4,5)),
	"ACM_DESCRIPT_A"	VARCHAR2(1000)	NOT NULL,
	"ACM_DESCRIPT_B"	VARCHAR2(1000)	NULL,
	"ACM_COORD_X"		VARCHAR2(30)	NOT NULL,
	"ACM_CCORD_Y"		VARCHAR2(30)	NOT NULL,
	"ACM_DISTRICT"		VARCHAR2(20)	NOT NULL,
	"ACM_POWER"		VARCHAR2(1)	DEFAULT 'N' CHECK(ACM_POWER IN('Y','N')),
	"ACM_STATUS"		VARCHAR2(1)	DEFAULT 'N' CHECK(ACM_STATUS IN('Y','N'))
);

COMMENT ON COLUMN "ACCOMMODATION"."ACM_NUM" IS '숙소번호';

COMMENT ON COLUMN "ACCOMMODATION"."ACM_NAME" IS '숙소이름';

COMMENT ON COLUMN "ACCOMMODATION"."MEM_NUM" IS '오너의 회원번호';

COMMENT ON COLUMN "ACCOMMODATION"."ACM_PHONE" IS '숙소연락처';

COMMENT ON COLUMN "ACCOMMODATION"."ACM_ADDRESS" IS '주소';

COMMENT ON COLUMN "ACCOMMODATION"."ACM_TYPE" IS '숙소타입(H/R/C/G/M)';

COMMENT ON COLUMN "ACCOMMODATION"."ACM_GRADE" IS '몇성급인지';

COMMENT ON COLUMN "ACCOMMODATION"."ACM_DESCRIPT_A" IS '설명1';

COMMENT ON COLUMN "ACCOMMODATION"."ACM_DESCRIPT_B" IS '설명2';

COMMENT ON COLUMN "ACCOMMODATION"."ACM_COORD_X" IS 'X좌표';

COMMENT ON COLUMN "ACCOMMODATION"."ACM_CCORD_Y" IS 'Y좌표';

COMMENT ON COLUMN "ACCOMMODATION"."ACM_DISTRICT" IS '구역(제주/서귀포)';

COMMENT ON COLUMN "ACCOMMODATION"."ACM_POWER" IS '파워등록여부(Y/N)';

COMMENT ON COLUMN "ACCOMMODATION"."ACM_STATUS" IS '숙소상태(Y:등록/N:등록대기중or삭제)';







CREATE TABLE "ACMIMG" (
	"IMG_NUM"	VARCHAR(255)	NOT NULL,
	"IMG_PATH"	VARCHAR2(300)	NOT NULL,
	"ACM_NUM"	NUMBER		NOT NULL,
	"STATUS"	NUMBER		CHECK(STATUS IN(0,1))
);

COMMENT ON COLUMN "ACMIMG"."IMG_NUM" IS '이미지번호';

COMMENT ON COLUMN "ACMIMG"."IMG_PATH" IS '이미지경로';

COMMENT ON COLUMN "ACMIMG"."ACM_NUM" IS '숙소번호';

COMMENT ON COLUMN "ACMIMG"."STATUS" IS '0 = 대표사진 / 1';







CREATE TABLE "ROOM" (
	"ROOM_NUM"	NUMBER		NOT NULL,
	"ACM_NUM"	NUMBER		NOT NULL,
	"ROOM_NAME"	VARCHAR2(20)	NOT NULL,
	"ROOM_PRICE"	NUMBER		NOT NULL,
	"ROOM_PAX"	NUMBER		NOT NULL,
	"ROOM_TYPE"	VARCHAR2(1)	CHECK(ROOM_TYPE IN('S','D','T','O')),
	"ROOM_DESCRIPT"	VARCHAR2(100)	NULL,
	"ROOM_SMOKE"	VARCHAR2(1)	CHECK(ROOM_SMOKE IN('Y','N'))
);

COMMENT ON COLUMN "ROOM"."ROOM_NUM" IS '룸번호';

COMMENT ON COLUMN "ROOM"."ACM_NUM" IS '숙소번호';

COMMENT ON COLUMN "ROOM"."ROOM_NAME" IS '룸이름';

COMMENT ON COLUMN "ROOM"."ROOM_PRICE" IS '1박가격';

COMMENT ON COLUMN "ROOM"."ROOM_PAX" IS '룸정원';

COMMENT ON COLUMN "ROOM"."ROOM_TYPE" IS '룸타입(싱글s/더블d/트리플(트윈)t/도미토리o)';

COMMENT ON COLUMN "ROOM"."ROOM_DESCRIPT" IS '룸설명';

COMMENT ON COLUMN "ROOM"."ROOM_SMOKE" IS '흡연가능여부(y/n)';








CREATE TABLE "ROOMIMG" (
	"IMG_NUM"	NUMBER		NOT NULL,
	"IMG_PATH"	VARCHAR2(300)	NOT NULL,
	"ROOM_NUM"	NUMBER		NOT NULL,
	"STATUS"	NUMBER		CHECK(STATUS IN(0,1))
);

COMMENT ON COLUMN "ROOMIMG"."IMG_NUM" IS '이미지번호';

COMMENT ON COLUMN "ROOMIMG"."IMG_PATH" IS '이미지경로';

COMMENT ON COLUMN "ROOMIMG"."ROOM_NUM" IS '룸번호';

COMMENT ON COLUMN "ROOMIMG"."STATUS" IS '0 = 대표사진 / 1';







CREATE TABLE "REVIEW" (
	"REVIEW_NUM"		NUMBER		NOT NULL,
	"MEM_NUM"		NUMBER		NOT NULL,
	"ACM_NUM"		NUMBER		NOT NULL,
	"REVIEW_SCORE"		NUMBER		NULL,
	"REVIEW_CONTENT"	VARCHAR2(300)	NOT NULL,
	"REVIEW_DATE"		DATE		DEFAULT SYSDATE NOT NULL
);

COMMENT ON COLUMN "REVIEW"."REVIEW_NUM" IS '후기번호';

COMMENT ON COLUMN "REVIEW"."MEM_NUM" IS '회원번호';

COMMENT ON COLUMN "REVIEW"."ACM_NUM" IS '숙소번호';

COMMENT ON COLUMN "REVIEW"."REVIEW_SCORE" IS '후기점수';

COMMENT ON COLUMN "REVIEW"."REVIEW_CONTENT" IS '후기내용';

COMMENT ON COLUMN "REVIEW"."REVIEW_DATE" IS '작성날짜';








CREATE TABLE "RESERVATION" (
	"RESREV_NUM"		NUMBER		NOT NULL,
	"MEM_NUM"		NUMBER		NOT NULL,
	"ROOM_NUM"		NUMBER		NOT NULL,
	"RESERV_PAX"		NUMBER		NOT NULL,
	"CHECKIN_DATE"		DATE		NOT NULL,
	"CHECKOUT_DATE"		DATE		NOT NULL,
	"RESERV_PRICE"		NUMBER		NOT NULL,
	"RESERV_CANCEL"		VARCHAR2(1)	DEFAULT 'N' CHECK(RESERV_CANCEL IN('Y','N')),
	"RESERV_DATE"		DATE		DEFAULT SYSDATE NOT NULL,
	"CANCEL_DATE"		DATE		NULL,
	"RESERV_REQUIRE"	VARCHAR2(200)	NULL,
	"NOSHOW"		VARCHAR2(1)	DEFAULT 'N' CHECK(NOSHOW IN('Y','N')),
	"STATUS"		VARCHAR2(1)	DEFAULT 'Y' CHECK(STATUS IN('Y','N'))

);

COMMENT ON COLUMN "RESERVATION"."RESREV_NUM" IS '예약번호';

COMMENT ON COLUMN "RESERVATION"."MEM_NUM" IS '회원번호';

COMMENT ON COLUMN "RESERVATION"."ROOM_NUM" IS '룸번호';

COMMENT ON COLUMN "RESERVATION"."RESERV_PAX" IS '예약한인원수';

COMMENT ON COLUMN "RESERVATION"."CHECKIN_DATE" IS '체크인날짜';

COMMENT ON COLUMN "RESERVATION"."CHECKOUT_DATE" IS '체크아웃날짜';

COMMENT ON COLUMN "RESERVATION"."RESERV_PRICE" IS '결제예상금액';

COMMENT ON COLUMN "RESERVATION"."RESERV_CANCEL" IS '예약취소';

COMMENT ON COLUMN "RESERVATION"."RESERV_DATE" IS '예약한날짜';

COMMENT ON COLUMN "RESERVATION"."CANCEL_DATE" IS '예약취소날짜';

COMMENT ON COLUMN "RESERVATION"."RESERV_REQUIRE" IS '고객요청사항';

COMMENT ON COLUMN "RESERVATION"."NOSHOW" IS '노쇼여부(y/n)';

COMMENT ON COLUMN "RESERVATION"."STATUS" IS '예약활성화상태(Y/N)';










CREATE TABLE "PAYMENT" (
	"PAY_NUM"	NUMBER		NOT NULL,
	"RESERV_NUM"	NUMBER		NOT NULL,
	"PAY_PRICE"	NUMBER		NOT NULL,
	"PAY_METHOD"	VARCHAR2(1)	NOT NULL,
	"PAY_CANCEL"	VARCHAR2(1)	DEFAULT 'N' CHECK(PAY_CANCEL IN('Y','N')),
	"PAY_DATE"	DATE		DEFAULT SYSDATE NOT NULL,
	"CANCEL_DATE"	DATE		NULL
);

COMMENT ON COLUMN "PAYMENT"."PAY_NUM" IS '결제번호';

COMMENT ON COLUMN "PAYMENT"."RESERV_NUM" IS '예약번호';

COMMENT ON COLUMN "PAYMENT"."PAY_PRICE" IS '실제결제가격';

COMMENT ON COLUMN "PAYMENT"."PAY_METHOD" IS '결제방법';

COMMENT ON COLUMN "PAYMENT"."PAY_CANCEL" IS '결제취소';

COMMENT ON COLUMN "PAYMENT"."PAY_DATE" IS '결제날짜';

COMMENT ON COLUMN "PAYMENT"."CANCEL_DATE" IS '결제취소날짜';









CREATE TABLE "TOURSPOT" (
	"SPOT_NUM"	NUMBER		NOT NULL,
	"SPOT_NAME"	VARCHAR2(30)	NOT NULL,
	"SPOT_COORD_X"	VARCHAR2(30)	NOT NULL,
	"SPOT_COORD_Y"	VARCHAR2(30)	NOT NULL,
	"SPOT_ADDRESS"	VARCHAR2(50)	NULL,
	"SPOT_DESCRIPT"	VARCHAR2(300)	NULL
);

COMMENT ON COLUMN "TOURSPOT"."SPOT_NUM" IS '관광지번호';

COMMENT ON COLUMN "TOURSPOT"."SPOT_NAME" IS '관광지이름';

COMMENT ON COLUMN "TOURSPOT"."SPOT_COORD_X" IS 'x좌표';

COMMENT ON COLUMN "TOURSPOT"."SPOT_COORD_Y" IS 'y좌표';

COMMENT ON COLUMN "TOURSPOT"."SPOT_ADDRESS" IS '관광지주소';

COMMENT ON COLUMN "TOURSPOT"."SPOT_DESCRIPT" IS '관광지설명';









CREATE TABLE "TOURSPOTIMG" (
	"IMG_NUM"	NUMBER		NOT NULL,
	"IMG_PATH"	VARCHAR2(300)	NOT NULL,
	"SPOT_NUM"	NUMBER		NOT NULL,
	"STATUS"	NUMBER		CHECK(STATUS IN(0,1))
);

COMMENT ON COLUMN "TOURSPOTIMG"."IMG_NUM" IS '이미지번호';

COMMENT ON COLUMN "TOURSPOTIMG"."IMG_PATH" IS '이미지경로';

COMMENT ON COLUMN "TOURSPOTIMG"."SPOT_NUM" IS '관광지번호';

COMMENT ON COLUMN "TOURSPOTIMG"."STATUS" IS '0 = 대표사진 / 1';









CREATE TABLE "REPLY" (
	"REPLY_NUM"	NUMBER		NOT NULL,
	"REVIEW_NUM"	NUMBER		NOT NULL,
	"MEM_NUM"	NUMBER		NOT NULL,
	"REPLY_CONTENT"	VARCHAR2(300)	NOT NULL,
	"REPLY_DATE"	DATE		DEFAULT SYSDATE NOT NULL
);

COMMENT ON COLUMN "REPLY"."REPLY_NUM" IS '댓글번호';

COMMENT ON COLUMN "REPLY"."REVIEW_NUM" IS '후기번호';

COMMENT ON COLUMN "REPLY"."MEM_NUM" IS '회원번호';

COMMENT ON COLUMN "REPLY"."REPLY_CONTENT" IS '댓글내용';

COMMENT ON COLUMN "REPLY"."REPLY_DATE" IS '작성날짜';









CREATE TABLE "WISHLIST" (
	"MEM_NUM"	NUMBER		NOT NULL,
	"ACM_NUM"	NUMBER		NOT NULL,
	"WISH_DATE"	DATE		DEFAULT SYSDATE NOT NULL
);

COMMENT ON COLUMN "WISHLIST"."MEM_NUM" IS '회원번호';

COMMENT ON COLUMN "WISHLIST"."ACM_NUM" IS '숙소번호';

COMMENT ON COLUMN "WISHLIST"."WISH_DATE" IS '찜한날짜';









CREATE TABLE "QNA" (
	"QNA_NUM"	NUMBER		NOT NULL,
	"MEM_NUM"	NUMBER		NOT NULL,
	"QNA_TITLE"	VARCHAR2(30)	NOT NULL,
	"QNA_CONTENT"	VARCHAR2(300)	NOT NULL,
	"QNA_DATE"	DATE		DEFAULT SYSDATE NOT NULL,
	"QNA_STATUS"	VARCHAR2(1)	DEFAULT 'N' CHECK(QNA_STATUS IN('Y','N'))
);

COMMENT ON COLUMN "QNA"."QNA_NUM" IS '문의번호';

COMMENT ON COLUMN "QNA"."MEM_NUM" IS '회원번호';

COMMENT ON COLUMN "QNA"."QNA_TITLE" IS '문의제목';

COMMENT ON COLUMN "QNA"."QNA_CONTENT" IS '문의내용';

COMMENT ON COLUMN "QNA"."QNA_DATE" IS '문의한날짜';

COMMENT ON COLUMN "QNA"."QNA_STATUS" IS '답변상태';









CREATE TABLE "ANSWER" (
	"ANS_NUM"	NUMBER		NOT NULL,
	"QNA_NUM"	NUMBER		NOT NULL,
	"ANS_CONTENT"	VARCHAR2(300)	NOT NULL,
	"ANS_DATE"	DATE		DEFAULT SYSDATE NOT NULL
);

COMMENT ON COLUMN "ANSWER"."ANS_NUM" IS '답변번호';

COMMENT ON COLUMN "ANSWER"."QNA_NUM" IS '문의번호';

COMMENT ON COLUMN "ANSWER"."ANS_CONTENT" IS '답변내용';

COMMENT ON COLUMN "ANSWER"."ANS_DATE" IS '작성날짜';









CREATE TABLE "POWER" (
	"POWER_NUM"	NUMBER		NOT NULL,
	"ACM_NUM"	NUMBER		NOT NULL,
	"PAY_NUM"	NUMBER		NOT NULL,
	"START_DATE"	DATE		NULL,
	"END_DATE"	DATE		NULL,
	"POWER_STATUS"	VARCHAR2(1)	DEFAULT 'Y' CHECK(POWER_STATUS IN('Y','N'))
);

COMMENT ON COLUMN "POWER"."POWER_NUM" IS '파워등록번호';

COMMENT ON COLUMN "POWER"."ACM_NUM" IS '숙소번호';

COMMENT ON COLUMN "POWER"."PAY_NUM" IS '결제번호';

COMMENT ON COLUMN "POWER"."START_DATE" IS '시작일';

COMMENT ON COLUMN "POWER"."END_DATE" IS '종료일';

COMMENT ON COLUMN "POWER"."POWER_STATUS" IS '파워등록상태(y/n)';










-- PK

ALTER TABLE "NATION" ADD CONSTRAINT "PK_NATION" PRIMARY KEY ("NATION_CODE");

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY ("MEM_NUM");

ALTER TABLE "ACCOMMODATION" ADD CONSTRAINT "PK_ACCOMMODATION" PRIMARY KEY ("ACM_NUM");

ALTER TABLE "ACMIMG" ADD CONSTRAINT "PK_ACMIMG" PRIMARY KEY ("IMG_NUM");

ALTER TABLE "ROOM" ADD CONSTRAINT "PK_ROOM" PRIMARY KEY ("ROOM_NUM");

ALTER TABLE "ROOMIMG" ADD CONSTRAINT "PK_ROOMIMG" PRIMARY KEY ("IMG_NUM");

ALTER TABLE "REVIEW" ADD CONSTRAINT "PK_REVIEW" PRIMARY KEY ("REVIEW_NUM");

ALTER TABLE "RESERVATION" ADD CONSTRAINT "PK_RESERVATION" PRIMARY KEY ("RESREV_NUM");

ALTER TABLE "PAYMENT" ADD CONSTRAINT "PK_PAYMENT" PRIMARY KEY ("PAY_NUM");

ALTER TABLE "TOURSPOT" ADD CONSTRAINT "PK_TOURSPOT" PRIMARY KEY ("SPOT_NUM");

ALTER TABLE "TOURSPOTIMG" ADD CONSTRAINT "PK_TOURSPOTIMG" PRIMARY KEY ("IMG_NUM");

ALTER TABLE "REPLY" ADD CONSTRAINT "PK_REPLY" PRIMARY KEY ("REPLY_NUM");

ALTER TABLE "WISHLIST" ADD CONSTRAINT "PK_WISHLIST" PRIMARY KEY ("MEM_NUM",	"ACM_NUM");

ALTER TABLE "QNA" ADD CONSTRAINT "PK_QNA" PRIMARY KEY ("QNA_NUM");

ALTER TABLE "ANSWER" ADD CONSTRAINT "PK_ANSWER" PRIMARY KEY ("ANS_NUM");

ALTER TABLE "POWER" ADD CONSTRAINT "PK_POWER" PRIMARY KEY ("POWER_NUM");



-- FK

ALTER TABLE "MEMBER" ADD CONSTRAINT "FK_NATION_TO_MEMBER_1" FOREIGN KEY ("NATION_CODE")
REFERENCES "NATION" ("NATION_CODE");

ALTER TABLE "ACCOMMODATION" ADD CONSTRAINT "FK_MEMBER_TO_ACCOMMODATION_1" FOREIGN KEY ("MEM_NUM")
REFERENCES "MEMBER" ("MEM_NUM");

ALTER TABLE "ACMIMG" ADD CONSTRAINT "FK_ACCOMMODATION_TO_ACMIMG_1" FOREIGN KEY ("ACM_NUM")
REFERENCES "ACCOMMODATION" ("ACM_NUM");

ALTER TABLE "ROOM" ADD CONSTRAINT "FK_ACCOMMODATION_TO_ROOM_1" FOREIGN KEY ("ACM_NUM")
REFERENCES "ACCOMMODATION" ("ACM_NUM");

ALTER TABLE "ROOMIMG" ADD CONSTRAINT "FK_ROOM_TO_ROOMIMG_1" FOREIGN KEY ("ROOM_NUM")
REFERENCES "ROOM" ("ROOM_NUM");

ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_MEMBER_TO_REVIEW_1" FOREIGN KEY ("MEM_NUM")
REFERENCES "MEMBER" ("MEM_NUM");

ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_ACCOMMODATION_TO_REVIEW_1" FOREIGN KEY ("ACM_NUM")
REFERENCES "ACCOMMODATION" ("ACM_NUM");

ALTER TABLE "RESERVATION" ADD CONSTRAINT "FK_MEMBER_TO_RESERVATION_1" FOREIGN KEY ("MEM_NUM")
REFERENCES "MEMBER" ("MEM_NUM");

ALTER TABLE "RESERVATION" ADD CONSTRAINT "FK_ROOM_TO_RESERVATION_1" FOREIGN KEY ("ROOM_NUM")
REFERENCES "ROOM" ("ROOM_NUM");

ALTER TABLE "PAYMENT" ADD CONSTRAINT "FK_RESERVATION_TO_PAYMENT_1" FOREIGN KEY ("RESERV_NUM")
REFERENCES "RESERVATION" ("RESREV_NUM");

ALTER TABLE "TOURSPOTIMG" ADD CONSTRAINT "FK_TOURSPOT_TO_TOURSPOTIMG_1" FOREIGN KEY ("SPOT_NUM")
REFERENCES "TOURSPOT" ("SPOT_NUM");

ALTER TABLE "REPLY" ADD CONSTRAINT "FK_REVIEW_TO_REPLY_1" FOREIGN KEY ("REVIEW_NUM")
REFERENCES "REVIEW" ("REVIEW_NUM");

ALTER TABLE "REPLY" ADD CONSTRAINT "FK_MEMBER_TO_REPLY_1" FOREIGN KEY ("MEM_NUM")
REFERENCES "MEMBER" ("MEM_NUM");

ALTER TABLE "WISHLIST" ADD CONSTRAINT "FK_MEMBER_TO_WISHLIST_1" FOREIGN KEY ("MEM_NUM")
REFERENCES "MEMBER" ("MEM_NUM");

ALTER TABLE "WISHLIST" ADD CONSTRAINT "FK_ACCOMMODATION_TO_WISHLIST_1" FOREIGN KEY ("ACM_NUM")
REFERENCES "ACCOMMODATION" ("ACM_NUM");

ALTER TABLE "QNA" ADD CONSTRAINT "FK_MEMBER_TO_QNA_1" FOREIGN KEY ("MEM_NUM")
REFERENCES "MEMBER" ("MEM_NUM");

ALTER TABLE "ANSWER" ADD CONSTRAINT "FK_QNA_TO_ANSWER_1" FOREIGN KEY ("QNA_NUM")
REFERENCES "QNA" ("QNA_NUM");

ALTER TABLE "POWER" ADD CONSTRAINT "FK_ACCOMMODATION_TO_POWER_1" FOREIGN KEY ("ACM_NUM")
REFERENCES "ACCOMMODATION" ("ACM_NUM");

ALTER TABLE "POWER" ADD CONSTRAINT "FK_PAYMENT_TO_POWER_1" FOREIGN KEY ("PAY_NUM")
REFERENCES "PAYMENT" ("PAY_NUM");






-- SEQ

CREATE SEQUENCE NATION_SEQ;
CREATE SEQUENCE MEMBER_SEQ;
CREATE SEQUENCE ACM_SEQ;
CREATE SEQUENCE ACMIMG_SEQ;
CREATE SEQUENCE ROOM_SEQ;
CREATE SEQUENCE ROOMIMG_SEQ;
CREATE SEQUENCE REVIEW_SEQ;
CREATE SEQUENCE RESERVATION_SEQ;
CREATE SEQUENCE PAYMENT_SEQ;
CREATE SEQUENCE TOURSPOT_SEQ;
CREATE SEQUENCE TOURSPOTIMG_SEQ;
CREATE SEQUENCE REPLY_SEQ;
CREATE SEQUENCE WISHLIST_SEQ;
CREATE SEQUENCE QNA_SEQ;
CREATE SEQUENCE ANSWER_SEQ;
CREATE SEQUENCE POWER_SEQ;





-- TRG





-- TEST DATA

-- INSERT INTO MEMBER VALUES(1,'TEST@NAVER.COM','1234','테스트','M','01012345678',1,NULL,'U','Y',SYSDATE,NULL,DEFAULT);

-- INSERT INTO NATION VALUES(1,'KOR','PATH');



-- DATA


INSERT INTO NATION VALUES (NATION_SEQ.NEXTVAL,'KOR','<%=contextPath%>/resources/images/nation/kr.png');
INSERT INTO NATION VALUES (NATION_SEQ.NEXTVAL,'MEX','<%=contextPath%>/resources/images/nation/mx.png');
INSERT INTO NATION VALUES (NATION_SEQ.NEXTVAL,'DNK','<%=contextPath%>/resources/images/nation/dk.png');
INSERT INTO NATION VALUES (NATION_SEQ.NEXTVAL,'USA','<%=contextPath%>/resources/images/nation/us.png');
INSERT INTO NATION VALUES (NATION_SEQ.NEXTVAL,'RUS','<%=contextPath%>/resources/images/nation/ru.png');
INSERT INTO NATION VALUES (NATION_SEQ.NEXTVAL,'BRA','<%=contextPath%>/resources/images/nation/br.png');
INSERT INTO NATION VALUES (NATION_SEQ.NEXTVAL,'CHN','<%=contextPath%>/resources/images/nation/cn.png');

INSERT INTO MEMBER VALUES (MEMBER_SEQ.NEXTVAL,'admin','admin','ADMIN','M','01012340001',1,0,'A','Y',SYSDATE,NULL,0);
INSERT INTO MEMBER VALUES (MEMBER_SEQ.NEXTVAL,'owner','owner','OWNER','M','01012340002',2,0,'O','Y',SYSDATE,NULL,0);
INSERT INTO MEMBER VALUES (MEMBER_SEQ.NEXTVAL,'user','user','USER','M','01012340003',1,0,'U','Y',SYSDATE,NULL,0);
INSERT INTO MEMBER VALUES (MEMBER_SEQ.NEXTVAL,'admin@example.com','admin','ADMIN','M','01012340004',1,0,'A','Y',SYSDATE,NULL,0);
INSERT INTO MEMBER VALUES (MEMBER_SEQ.NEXTVAL,'owner@example.com','owner','OWNER','M','01012340005',1,0,'O','Y',SYSDATE,NULL,0);
INSERT INTO MEMBER VALUES (MEMBER_SEQ.NEXTVAL,'user@example.com','user','USER','M','01012340006',1,0,'U','Y',SYSDATE,NULL,0);
INSERT INTO MEMBER VALUES (MEMBER_SEQ.NEXTVAL,'id001@naver.com','pw001','NAME01','F','01012340007',3,350,'O','Y',SYSDATE,NULL,1);
INSERT INTO MEMBER VALUES (MEMBER_SEQ.NEXTVAL,'id002@naver.com','pw002','NAME02','M','01012340008',4,155,'O','Y',SYSDATE,NULL,0);
INSERT INTO MEMBER VALUES (MEMBER_SEQ.NEXTVAL,'id003@naver.com','pw003','NAME03','F','01012340009',5,195,'O','Y',SYSDATE,NULL,2);
INSERT INTO MEMBER VALUES (MEMBER_SEQ.NEXTVAL,'id004@naver.com','pw004','NAME04','F','01012340010',6,483,'O','Y',SYSDATE,NULL,1);
INSERT INTO MEMBER VALUES (MEMBER_SEQ.NEXTVAL,'id005@naver.com','pw005','NAME05','M','01012340011',1,150,'O','Y',SYSDATE,NULL,0);
INSERT INTO MEMBER VALUES (MEMBER_SEQ.NEXTVAL,'id006@naver.com','pw006','NAME06','M','01012340012',3,200,'U','Y',SYSDATE,NULL,1);
INSERT INTO MEMBER VALUES (MEMBER_SEQ.NEXTVAL,'id007@naver.com','pw007','NAME07','M','01012340013',3,424,'U','Y',SYSDATE,NULL,2);
INSERT INTO MEMBER VALUES (MEMBER_SEQ.NEXTVAL,'id008@naver.com','pw008','NAME08','M','01012340014',4,133,'U','Y',SYSDATE,NULL,0);
INSERT INTO MEMBER VALUES (MEMBER_SEQ.NEXTVAL,'id009@naver.com','pw009','NAME09','F','01012340015',1,92,'U','Y',SYSDATE,NULL,1);
INSERT INTO MEMBER VALUES (MEMBER_SEQ.NEXTVAL,'id010@naver.com','pw010','NAME10','F','01012340016',2,0,'U','Y',SYSDATE,NULL,0);

INSERT INTO ACCOMMODATION VALUES (ACM_SEQ.NEXTVAL,'제주 신라호텔',2,'064-735-5114','중문관광로72번길 75, 서귀포, 제주도, 대한민국','H',5,'429개의 금연 객실마리나해변 근처카지노3개','429개의 금연 객실마리나해변 근처카지노3개','33.247636','126.407962','서귀포','N','Y');
INSERT INTO ACCOMMODATION VALUES (ACM_SEQ.NEXTVAL,'히든 클리프 호텔네이쳐',5,'064-752-7777','예래해안로 542, 서귀포, 제주도, 대한민국','H',5,'250개의 금연 객실3 개 레스토랑','250개의 금연 객실3 개 레스토랑','33.25515','126.402353','서귀포','N','Y');
INSERT INTO ACCOMMODATION VALUES (ACM_SEQ.NEXTVAL,'베스트웨스턴 제주호텔',6,'064-797-6000?','도령로 27, 제주, 제주도, 대한민국','H',4,'363개의 객실 레스토랑 아침 식사 가능','363개의 객실 레스토랑 아침 식사 가능','33.487903','126.481906','제주','N','Y');
INSERT INTO ACCOMMODATION VALUES (ACM_SEQ.NEXTVAL,'호텔 리젠트 마린 더 블루',7,'02-777-5080','서부두2길 20, 제주, 제주도, 대한민국','H',4,'327개의 금연 객실 레스토랑 야외 수영장','327개의 금연 객실 레스토랑 야외 수영장','33.517717','126.526809','제주','N','Y');
INSERT INTO ACCOMMODATION VALUES (ACM_SEQ.NEXTVAL,'엠스테이 호텔 제주',8,'064-800-6000?','제주특별자치도 서귀포시 서귀동 829-5','H',4,'test','test','33.247083','126.56089','서귀포','N','Y');


INSERT INTO ACMIMG VALUES (ACMIMG_SEQ.NEXTVAL,'https://search.pstatic.net/common/?src=https://edge.media.datahc.com/HI574124994.jpg&type=ofullfill692_336_2A2B2C',1,0);
INSERT INTO ACMIMG VALUES (ACMIMG_SEQ.NEXTVAL,'https://search.pstatic.net/common/?src=https://edge.media.datahc.com/HI511798801.jpg&type=ofullfill692_336_2A2B2C',2,0);
INSERT INTO ACMIMG VALUES (ACMIMG_SEQ.NEXTVAL,'https://search.pstatic.net/common/?src=https://edge.media.datahc.com/HI402149146.jpg&type=ofullfill692_336_2A2B2C',3,0);

INSERT INTO ROOM VALUES (ROOM_SEQ.NEXTVAL,1,'1번방',629200,2,'D','와이파이,티비,냉장고','N');
INSERT INTO ROOM VALUES (ROOM_SEQ.NEXTVAL,1,'2번방',669199,2,'T','와이파이,티비,냉장고','N');
INSERT INTO ROOM VALUES (ROOM_SEQ.NEXTVAL,2,'3번방',274999,2,'D','와이파이,티비,냉장고','N');
INSERT INTO ROOM VALUES (ROOM_SEQ.NEXTVAL,2,'4번방',296999,2,'D','와이파이,티비,냉장고','N');
INSERT INTO ROOM VALUES (ROOM_SEQ.NEXTVAL,3,'5번방',83805,2,'D','와이파이,티비,냉장고','N');
INSERT INTO ROOM VALUES (ROOM_SEQ.NEXTVAL,3,'6번방',108700,2,'D','와이파이,티비,냉장고','N');


INSERT INTO ROOMIMG VALUES (ROOMIMG_SEQ.NEXTVAL,'https://search.pstatic.net/common/?src=https://edge.media.datahc.com/HI569101878.jpg&type=ofullfill692_336_2A2B2C',1,0);
INSERT INTO ROOMIMG VALUES (ROOMIMG_SEQ.NEXTVAL,'https://search.pstatic.net/common/?src=https://edge.media.datahc.com/HI569101878.jpg&type=ofullfill692_336_2A2B2C',1,1);
INSERT INTO ROOMIMG VALUES (ROOMIMG_SEQ.NEXTVAL,'https://search.pstatic.net/common/?src=https://edge.media.datahc.com/HI403463897.jpg&type=ofullfill692_336_2A2B2C',2,0);
INSERT INTO ROOMIMG VALUES (ROOMIMG_SEQ.NEXTVAL,'https://search.pstatic.net/common/?src=https://edge.media.datahc.com/HI403463916.jpg&type=ofullfill692_336_2A2B2C',2,1);
INSERT INTO ROOMIMG VALUES (ROOMIMG_SEQ.NEXTVAL,'https://search.pstatic.net/common/?src=https://edge.media.datahc.com/HI402148417.jpg&type=ofullfill692_336_2A2B2C',3,0);
INSERT INTO ROOMIMG VALUES (ROOMIMG_SEQ.NEXTVAL,'https://search.pstatic.net/common/?src=https://edge.media.datahc.com/HI402149151.jpg&type=ofullfill692_336_2A2B2C',3,1);


INSERT INTO RESERVATION VALUES (RESERVATION_SEQ.NEXTVAL,1,1,2,SYSDATE+1,SYSDATE+3,629200,'N',SYSDATE,NULL,NULL,'N','Y');
INSERT INTO RESERVATION VALUES (RESERVATION_SEQ.NEXTVAL,1,2,2,SYSDATE+1,SYSDATE+3,669199,'N',SYSDATE,NULL,NULL,'N','Y');
INSERT INTO RESERVATION VALUES (RESERVATION_SEQ.NEXTVAL,1,3,2,SYSDATE+1,SYSDATE+3,274999,'N',SYSDATE,NULL,NULL,'N','Y');
INSERT INTO RESERVATION VALUES (RESERVATION_SEQ.NEXTVAL,1,4,2,SYSDATE+1,SYSDATE+3,296999,'N',SYSDATE,NULL,NULL,'N','Y');
INSERT INTO RESERVATION VALUES (RESERVATION_SEQ.NEXTVAL,1,5,2,SYSDATE+1,SYSDATE+3,83805,'N',SYSDATE,NULL,NULL,'N','Y');


INSERT INTO PAYMENT VALUES (PAYMENT_SEQ.NEXTVAL,1,629200,'C','N',SYSDATE,NULL);
INSERT INTO PAYMENT VALUES (PAYMENT_SEQ.NEXTVAL,2,669199,'C','N',SYSDATE,NULL);
INSERT INTO PAYMENT VALUES (PAYMENT_SEQ.NEXTVAL,3,274999,'C','N',SYSDATE,NULL);
INSERT INTO PAYMENT VALUES (PAYMENT_SEQ.NEXTVAL,4,296999,'C','N',SYSDATE,NULL);
INSERT INTO PAYMENT VALUES (PAYMENT_SEQ.NEXTVAL,5,83805,'C','N',SYSDATE,NULL);






COMMIT;
