DROP TABLE rent;
DROP TABLE member;
DROP TABLE book;
DROP TABLE publisher;

-- 실습 문제
-- 도서관리 프로그램을 만들기 위한 테이블 만들기

-- 1. 출판사들에 대한 데이터를 담기 위한 출판사 테이블(publisher) 
--    컬럼 : pub_no(출판사번호) -- 기본 키
--           pub_name(출판사명) -- NOT NULL
--           phone(전화번호)
DROP TABLE publisher;
CREATE TABLE publisher(
pub_no int primary key, pub_name varchar(20) NOT NULL, phone VARCHAR(15)
);

INSERT INTO publisher VALUES (1, '프리렉', '032-326-7282');
INSERT INTO publisher VALUES (2, '인사이트','02-322-5143');
INSERT INTO publisher VALUES (3, '길벗','02-332-0931');


create table publisher(
pub_no int auto_increment primary key,
pub_name varchar(20) not null,
phone varchar(20) 
);

INSERT INTO publisher(pub_name, phone) VALUES ('프리렉', '032-326-7282');
INSERT INTO publisher(pub_name, phone) VALUES ('인사이트','02-322-5143');
INSERT INTO publisher(pub_name, phone) VALUES ('길벗','02-332-0931');

SELECT * FROM publisher;

-- 2. 도서들에 대한 데이터를 담기 위한 도서 테이블 (book)
--    컬럼 : bk_no (도서번호) -- 기본 키
--           bk_title (도서명) -- NOT NULL
--           bk_author(저자명) -- NOT NULL
--           bk_price(가격)
--           bk_pub_no(출판사 번호) -- 외래 키(publisher 테이블을 참조하도록)
--    조건 : 이때 참조하고 있는 부모 데이터 삭제 시 자식 데이터도 삭제 되도록 옵션 지정
drop table book;
CREATE TABLE book(
bk_no int primary key, 
bk_title varchar(30) NOT NULL, 
bk_author varchar(30) NOT NULL,
bk_price VARCHAR(20),
bk_pub_no INT, foreign key(bk_pub_no) references publisher(pub_no)
);
alter table book rename column bk_pub_no to pub_no;
DELETE FROM book
WHERE bk_pub_no = NULL;

insert INTO book VALUES(1, '개발자를 위한 생각의 정리, 문서 작성법', '카이마이 미즈히로', 20000, 1);
INSERT INTO book VALUES(2, '1일 1로그 100일 완성 IT 지식', '브라이언 w. 커니핸', 200000, 2); 
INSERT INTO book VALUES(3, '개발자가 영어도 잘해야 하나요?', '최희철', 27000, 3);
INSERT INTO book VALUES(4, '피플웨어', '톰 드마르코', 16800, 2);
INSERT INTO book VALUES(5, '그로스 해킹', '라이언 홀리데이', 13800, 3);


CREATE TABLE book(
bk_no int primary key auto_increment, 
bk_title varchar(30) NOT NULL, 
bk_author varchar(30) NOT NULL,
bk_price INT,
bk_pub_no INT, 
constraint pub_no_fk foreign key(bk_pub_no) references publisher(pub_no) on delete cascade
);

insert INTO book(bk_title, bk_author, bk_price, bk_pub_no) 
VALUES('개발자를 위한 생각의 정리, 문서 작성법', '카이마이 미즈히로', 20000, 1);
INSERT INTO book(bk_title, bk_author, bk_price, bk_pub_no) 
VALUES('1일 1로그 100일 완성 IT 지식', '브라이언 w. 커니핸', 200000, 2); 
INSERT INTO book(bk_title, bk_author, bk_price, bk_pub_no) 
VALUES('개발자가 영어도 잘해야 하나요?', '최희철', 27000, 3);
INSERT INTO book(bk_title, bk_author, bk_price, bk_pub_no) 
VALUES('피플웨어', '톰 드마르코', 16800, 2);
INSERT INTO book(bk_title, bk_author, bk_price, bk_pub_no) 
VALUES('그로스 해킹', '라이언 홀리데이', 13800, 3);

SELECT * FROM book;

-- 3. 회원에 대한 데이터를 담기 위한 회원 테이블 (member)
--    컬럼 : member_no(회원번호) -- 기본 키
--           member_id(아이디)   -- 중복 금지
--           member_pwd(비밀번호) -- NOT NULL
--           member_name(회원명) -- NOT NULL
--           gender(성별)        -- 'M' 또는 'F'로 입력되도록 제한
--           address(주소)       
--           phone(연락처)       
--           status(탈퇴여부)     -- 기본값 'N' / 'Y' 혹은 'N'만 입력되도록 제약조건
--           enroll_date(가입일)  -- 기본값 현재날짜

drop table member;
CREATE TABLE member(
member_no int primary key,
member_id varchar(20) UNIQUE,
member_pwd varchar(30) NOT NULL,
member_name varchar(20) NOT NULL,
gender char(3),
address varchar(40),
phone VARCHAR(20),
status char(3),
enroll_date date,
constraint gender_chk check(gender IN('M','F')),
constraint status_chk check(status in('N','Y'))
);

insert INTO member
VALUES(1, 'user01', 'pass01', '가나다', 'M', '서울시 강남구', '010-1111-2222', 'N', current_date());
insert INTO member 
VALUES(2, 'user02', 'pass02', '라마바', 'M', '서울시 서초구', '010-3333-4444', 'N', current_date());
insert INTO member
VALUES(3, 'user03', 'pass03', '사아자', 'F', '경기도 광주시', '010-4444-5555', 'N', current_date());

drop table member;
CREATE TABLE member(
member_no int primary key auto_increment,
member_id varchar(20) UNIQUE not null,
member_pwd varchar(30) NOT NULL,
member_name varchar(20) NOT NULL,
gender char(3) check (gender in ('M','F')),
address varchar(40),
phone VARCHAR(20),
status char(3) check(status in ('Y','N')) default 'N',
enroll_date date default (current_date)
);

insert INTO member(member_id, member_pwd, member_name, gender, address, phone)
VALUES('user01', 'pass01', '가나다', 'M', '서울시 강남구', '010-1111-2222');
insert INTO member(member_id, member_pwd, member_name, gender, address, phone) 
VALUES('user02', 'pass02', '라마바', 'M', '서울시 서초구', '010-3333-4444');
insert INTO member(member_id, member_pwd, member_name, gender, address, phone)
VALUES('user03', 'pass03', '사아자', 'F', '경기도 광주시', '010-4444-5555');

SELECT * FROM member;

-- 4. 도서를 대여한 회원에 대한 데이터를 담기 위한 대여 목록 테이블(rent)
--    컬럼 : rent_no(대여번호) -- 기본 키
--           rent_mem_no(대여 회원번호) -- 외래 키(member와 참조)
--           rent_book_no(대여 도서번호) -- 외래 키(book와 참조)
--           rent_date(대여일) -- 기본값 현재날짜
--    조건 : 이때 부모 데이터 삭제 시 NULL 값이 되도록 옵션 설정

drop table rent;
CREATE TABLE rent(
rent_no int primary key,
rent_mem_no int, foreign key(rent_mem_no) references member(member_no),
rent_book_no int, foreign key (rent_book_no) references book(bk_no),
rent_date date
);

alter table rent rename column rent_mem_no to member_no;
alter table rent rename column rent_book_no to bk_no;

delete from rent
where rent = null;

insert into rent values(1, 1, 2, current_date());
insert into rent values(2, 1, 3, current_date());
insert into rent values(3, 2, 1, current_date());
insert into rent values(4, 2, 2, current_date());
insert into rent values(5, 1, 5, current_date());


CREATE TABLE rent(
rent_no int primary key auto_increment,
rent_mem_no int, 
rent_book_no int,
rent_date date default (current_date)
);
alter table rent add constraint member_no_fk
foreign key(rent_mem_no) references member (member_no) on delete set null;
alter table rent add constraint book_no_fk
foreign key(rent_book_no) references book(bk_no) on delete set null;

insert into rent(rent_mem_no, rent_book_no) values(1, 2);
insert into rent(rent_mem_no, rent_book_no) values(1, 3);
insert into rent(rent_mem_no, rent_book_no) values(2, 1);
insert into rent(rent_mem_no, rent_book_no) values(2, 2);
insert into rent(rent_mem_no, rent_book_no) values(1, 5);

select * from rent;

-- ALTER로 FOREIGN KEY만 관리

-- 5. 2번 도서를 대여한 회원의 이름, 아이디, 대여일, 반납 예정일(대여일 + 7일)을 조회하시오.
select member_name 회원이름, member_id 아이디, rent_date 대여일, adddate(rent_date, interval 7 day) "반납 예정일" from rent join member on (member_no = rent_mem_no)
where rent_book_no = 2;

-- 6. 회원번호가 1번인 회원이 대여한 도서들의 도서명, 출판사명, 대여일, 반납예정일을 조회하시오.
select bk_title 도서명, pub_name 출판사명, rent_date 대여일, adddate(rent_date, interval 7 day) "반납예정일" from rent join book on (rent_book_no = bk_no)
join publisher on (bk_pub_no = pub_no)
where rent_mem_no = 1;
