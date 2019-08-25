--jeju_script_002
SET DEFINE OFF;

ALTER TABLE ACCOMMODATION MODIFY(ACM_ADDRESS VARCHAR2(100));

ALTER TABLE ACCOMMODATION MODIFY(ACM_DESCRIPT_A VARCHAR2(1000));
ALTER TABLE ACCOMMODATION MODIFY(ACM_DESCRIPT_B VARCHAR2(1000));
ALTER TABLE ACCOMMODATION MODIFY(ACM_DISTRICT VARCHAR2(20));
ALTER TABLE ACCOMMODATION MODIFY(ACM_NAME VARCHAR2(100));


INSERT INTO NATION VALUES (NATION_SEQ.NEXTVAL,'KOR','https://upload.wikimedia.org/wikipedia/commons/0/09/Flag_of_South_Korea.svg');
INSERT INTO NATION VALUES (NATION_SEQ.NEXTVAL,'MEX','https://upload.wikimedia.org/wikipedia/commons/f/fc/Flag_of_Mexico.svg');
INSERT INTO NATION VALUES (NATION_SEQ.NEXTVAL,'DNK','https://upload.wikimedia.org/wikipedia/commons/9/9c/Flag_of_Denmark.svg');
INSERT INTO NATION VALUES (NATION_SEQ.NEXTVAL,'USA','https://upload.wikimedia.org/wikipedia/commons/a/a4/Flag_of_the_United_States.svg');
INSERT INTO NATION VALUES (NATION_SEQ.NEXTVAL,'RUS','https://upload.wikimedia.org/wikipedia/commons/f/f3/Flag_of_Russia.svg');
INSERT INTO NATION VALUES (NATION_SEQ.NEXTVAL,'CHE','https://upload.wikimedia.org/wikipedia/commons/0/08/Flag_of_Switzerland_%28Pantone%29.svg');
INSERT INTO NATION VALUES (NATION_SEQ.NEXTVAL,'CHN','https://upload.wikimedia.org/wikipedia/commons/f/fa/Flag_of_the_People%27s_Republic_of_China.svg');

INSERT INTO MEMBER VALUES (MEMBER_SEQ.NEXTVAL,'admin','admin','ADMIN','M','01012340001',1,0,'A','Y',SYSDATE,NULL,0);
INSERT INTO MEMBER VALUES (MEMBER_SEQ.NEXTVAL,'owner','owner','OWNER','M','01012340002',2,0,'O','Y',SYSDATE,NULL,0);
INSERT INTO MEMBER VALUES (MEMBER_SEQ.NEXTVAL,'user','user','USER','M','01012340003',1,0,'U','Y',SYSDATE,NULL,0);
INSERT INTO MEMBER VALUES (MEMBER_SEQ.NEXTVAL,'admin@example.com','admin','ADMIN','M','01012340004',1,0,'A','Y',SYSDATE,NULL,0);
INSERT INTO MEMBER VALUES (MEMBER_SEQ.NEXTVAL,'owner@example.com','owner','OWNER','M','01012340005',1,0,'O','Y',SYSDATE,NULL,0);
INSERT INTO MEMBER VALUES (MEMBER_SEQ.NEXTVAL,'user@example.com','user','USER','M','01012340006',1,0,'O','Y',SYSDATE,NULL,0);
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

INSERT INTO ROOM VALUES (ROOM_SEQ.NEXTVAL,1,'1번방',629200,2,'D','와이파이, 티비, 냉장고','N');
INSERT INTO ROOM VALUES (ROOM_SEQ.NEXTVAL,1,'2번방',669199,2,'T','와이파이, 티비, 냉장고','N');
INSERT INTO ROOM VALUES (ROOM_SEQ.NEXTVAL,2,'3번방',274999,2,'D','와이파이, 티비, 냉장고','N');
INSERT INTO ROOM VALUES (ROOM_SEQ.NEXTVAL,2,'4번방',296999,2,'D','와이파이, 티비, 냉장고','N');
INSERT INTO ROOM VALUES (ROOM_SEQ.NEXTVAL,3,'5번방',83805,2,'D','와이파이, 티비, 냉장고','N');
INSERT INTO ROOM VALUES (ROOM_SEQ.NEXTVAL,3,'6번방',108700,2,'D','와이파이, 티비, 냉장고','N');


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

INSERT INTO REVIEW VALUES (REVIEW_SEQ.NEXTVAL,1,1,4,'리뷰내용1',SYSDATE);
INSERT INTO REVIEW VALUES (REVIEW_SEQ.NEXTVAL,2,2,5,'리뷰내용2',SYSDATE);
INSERT INTO REVIEW VALUES (REVIEW_SEQ.NEXTVAL,3,3,3,'리뷰내용3',SYSDATE);
INSERT INTO REVIEW VALUES (REVIEW_SEQ.NEXTVAL,4,4,4,'리뷰내용4',SYSDATE);
INSERT INTO REVIEW VALUES (REVIEW_SEQ.NEXTVAL,5,5,2,'리뷰내용5',SYSDATE);

INSERT INTO REPLY VALUES (REPLY_SEQ.NEXTVAL,1,1,'좋아요1',SYSDATE);
INSERT INTO REPLY VALUES (REPLY_SEQ.NEXTVAL,1,2,'좋아요2',SYSDATE);
INSERT INTO REPLY VALUES (REPLY_SEQ.NEXTVAL,3,3,'좋아요3',SYSDATE);
INSERT INTO REPLY VALUES (REPLY_SEQ.NEXTVAL,2,4,'좋아요4',SYSDATE);
INSERT INTO REPLY VALUES (REPLY_SEQ.NEXTVAL,3,5,'좋아요5',SYSDATE);


INSERT INTO QNA VALUES (QNA_SEQ.NEXTVAL,1,'제목1','내용1',SYSDATE,'N');
INSERT INTO QNA VALUES (QNA_SEQ.NEXTVAL,2,'제목2','내용2',SYSDATE,'N');
INSERT INTO QNA VALUES (QNA_SEQ.NEXTVAL,3,'제목3','내용3',SYSDATE,'N');
INSERT INTO QNA VALUES (QNA_SEQ.NEXTVAL,4,'제목4','내용4',SYSDATE,'N');
INSERT INTO QNA VALUES (QNA_SEQ.NEXTVAL,5,'제목5','내용5',SYSDATE,'N');
INSERT INTO QNA VALUES (QNA_SEQ.NEXTVAL,6,'제목6','내용6',SYSDATE,'N');


INSERT INTO TOURSPOT VALUES (TOURSPOT_SEQ.NEXTVAL,'주상절리','33.237786','126.425085','서귀포시 중문동','단면의 모양이 육각형, 오각형 등 다각형으로 긴 기둥 모양을 이루고 있는 절리를 말한다');
INSERT INTO TOURSPOT VALUES (TOURSPOT_SEQ.NEXTVAL,'그랑블루요트투어','33.238414','126.439684',' 서귀포시 대포동 대포로 172-7','대포항 앞 제주바다에서 누비는 요트체험');
INSERT INTO TOURSPOT VALUES (TOURSPOT_SEQ.NEXTVAL,'낙타트래킹','33.402655','126.778638','서귀포시 표선면 번영로 2564-21','kbs 인간극장, sbs 동물농장, kbs 배틀트립, 생생정보통, vj특공대, 굿모닝대한민국, sbs 좋은아침, kbs 귀농이 대박이다 등 다수 출연');
INSERT INTO TOURSPOT VALUES (TOURSPOT_SEQ.NEXTVAL,'마라도','33.121139','126.267292','서귀포시 대정읍','난대성 해양 동식물이 풍부하고 경관이 아름다운 유인도 중에 국토 최남단인 섬, 천연기념물 제423호');
INSERT INTO TOURSPOT VALUES (TOURSPOT_SEQ.NEXTVAL,'비자림','33.484433','126.806458',' 제주시 구좌읍 비자숲길 55','오래된 비자나무 2,800여 그루가 지키는 단일 수종 세계 최대 규모의 숲');
INSERT INTO TOURSPOT VALUES (TOURSPOT_SEQ.NEXTVAL,'사려니숲길','33.424731','126.626848',' 제주시 조천읍','제주 숨은 비경 31, 삼나무 향기에 취하며 걷는 아름답고 청정한 숲길');
INSERT INTO TOURSPOT VALUES (TOURSPOT_SEQ.NEXTVAL,'제주서핑스쿨','33.26034','126.413361',' 서귀포시 색달동 일주서로 914','제주 중문에서 진행되는 전문적이고 체계적인 입문자, 초보, 중급 서핑강습을 프로그램');
INSERT INTO TOURSPOT VALUES (TOURSPOT_SEQ.NEXTVAL,'섭지코지','33.424281','126.93109',' 서귀포시 성산읍 섭지코지로 262','아름다운 해안이 일품인 섭지');


INSERT INTO WISHLIST VALUES (3,3,SYSDATE);
INSERT INTO WISHLIST VALUES (4,4,SYSDATE);
INSERT INTO WISHLIST VALUES (5,5,SYSDATE);
INSERT INTO WISHLIST VALUES (1,4,SYSDATE);
INSERT INTO WISHLIST VALUES (2,4,SYSDATE);


INSERT INTO TOURSPOTIMG VALUES (TOURSPOTIMG_SEQ.NEXTVAL,'WebContent/resources/images',1,0);
INSERT INTO TOURSPOTIMG VALUES (TOURSPOTIMG_SEQ.NEXTVAL,'WebContent/resources/images',1,0);
INSERT INTO TOURSPOTIMG VALUES (TOURSPOTIMG_SEQ.NEXTVAL,'WebContent/resources/images',1,0);
INSERT INTO TOURSPOTIMG VALUES (TOURSPOTIMG_SEQ.NEXTVAL,'WebContent/resources/images',1,0);
INSERT INTO TOURSPOTIMG VALUES (TOURSPOTIMG_SEQ.NEXTVAL,'WebContent/resources/images',1,0);
INSERT INTO TOURSPOTIMG VALUES (TOURSPOTIMG_SEQ.NEXTVAL,'WebContent/resources/images',1,0);
INSERT INTO TOURSPOTIMG VALUES (TOURSPOTIMG_SEQ.NEXTVAL,'WebContent/resources/images',1,0);


INSERT INTO POWER VALUES (POWER_SEQ.NEXTVAL,1,1,SYSDATE,SYSDATE+7,'N');
INSERT INTO POWER VALUES (POWER_SEQ.NEXTVAL,2,2,SYSDATE,SYSDATE+7,'N');
INSERT INTO POWER VALUES (POWER_SEQ.NEXTVAL,3,3,SYSDATE,SYSDATE+7,'N');
INSERT INTO POWER VALUES (POWER_SEQ.NEXTVAL,4,4,SYSDATE,SYSDATE+7,'N');
INSERT INTO POWER VALUES (POWER_SEQ.NEXTVAL,5,5,SYSDATE,SYSDATE+7,'N');

