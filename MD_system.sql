SELECT 극장이름, 위치 FROM 극장;
SELECT 극장이름 FROM 극장 WHERE 위치 = '서울';
SELECT 극장번호, 상영관번호, 영화제목 FROM 상영관 WHERE 가격 >= 10000;
SELECT 영화제목, COUNT(*) AS 상영관수 FROM 상영관 GROUP BY 영화제목;
SELECT * FROM 예약 WHERE 날짜 = TO_DATE('2024-01-01', 'YYYY-MM-DD');
SELECT 주소, COUNT(*) AS 고객수 FROM 고객 GROUP BY 주소;
SELECT 극장번호, 상영관번호 FROM 상영관 WHERE 좌석수 = (SELECT MAX(좌석수) FROM 상영관);
SELECT 고객번호, COUNT(*) AS 예약횟수 FROM 예약 GROUP BY 고객번호;
SELECT 극장번호, AVG(가격) AS 평균가격 FROM 상영관 GROUP BY 극장번호;
SELECT 이름, 주소 FROM 고객 WHERE 이름 LIKE '김%';

SELECT 극장.극장이름, 상영관.영화제목 FROM 극장 JOIN 상영관 ON 극장.극장번호 = 상영관.극장번호;
SELECT 극장.극장이름, 상영관.영화제목, 예약.날짜 FROM 극장 JOIN 상영관 ON 극장.극장번호 = 상영관.극장번호 JOIN 예약 ON 상영관.극장번호 = 예약.극장번호 AND 상영관.상영관번호 = 예약.상영관번호;SELECT 고객.이름, 예약.날짜
FROM 고객 JOIN 예약 ON 고객.고객번호 = 예약.고객번호;

SELECT 극장.극장이름, 상영관.영화제목, 고객.이름, 예약.좌석번호
FROM 극장
JOIN 상영관 ON 극장.극장번호 = 상영관.극장번호
JOIN 예약  ON 상영관.극장번호 = 예약.극장번호
          AND 상영관.상영관번호 = 예약.상영관번호
JOIN 고객  ON 예약.고객번호 = 고객.고객번호;

SELECT 상영관.영화제목, COUNT(*) AS 총예약수
FROM 상영관
JOIN 예약 ON 상영관.극장번호 = 예약.극장번호
         AND 상영관.상영관번호 = 예약.상영관번호
GROUP BY 상영관.영화제목;

SELECT 상영관.영화제목, 상영관.가격
FROM 극장
JOIN 상영관 ON 극장.극장번호 = 상영관.극장번호
WHERE 극장.위치 = '서울';

SELECT 고객.이름
FROM 고객
LEFT JOIN 예약 ON 고객.고객번호 = 예약.고객번호
WHERE 예약.고객번호 IS NULL;

SELECT 극장.극장이름, COUNT(*) AS 총예약수
FROM 극장
JOIN 상영관 ON 극장.극장번호 = 상영관.극장번호
JOIN 예약  ON 상영관.극장번호 = 예약.극장번호
          AND 상영관.상영관번호 = 예약.상영관번호
GROUP BY 극장.극장이름;

SELECT 예약.고객번호, 상영관.영화제목
FROM 상영관
JOIN 예약 ON 상영관.극장번호 = 예약.극장번호
         AND 상영관.상영관번호 = 예약.상영관번호
WHERE 상영관.가격 >= 15000;

SELECT 고객.이름, COUNT(*) AS 총예약횟수
FROM 극장
JOIN 상영관 ON 극장.극장번호 = 상영관.극장번호
JOIN 예약  ON 상영관.극장번호 = 예약.극장번호
          AND 상영관.상영관번호 = 예약.상영관번호
JOIN 고객  ON 예약.고객번호 = 고객.고객번호
GROUP BY 고객.이름;