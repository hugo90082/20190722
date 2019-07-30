SELECT year( from_days( datediff( now( ), 生日 ))) FROM userinfo WHERE uid='A01'
-- 算幾歲

SELECT * FROM bill WHERE dd NOT
Between adddate(now(),INTERVAL -6 month) And now() -- 印出六個月以前資料

SELECT * FROM bill WHERE date_format(dd, '%Y%m')='201901'-- 印出特定時間資料

SELECT concat(date_format(now(), '西元%Y'),'第',quarter(now()),'季')
-- 組合字串用concat 不能用+號
SELECT quarter(now()) -- 第幾季

SELECT date_format(now(), '西元%Y')
-- 
CREATE VIEW vw_hugo as 
SELECT tel,aa.SUM_Fee 
FROM(
    SELECT sum(fee) as SUM_Fee from bill
    GROUP BY tel
    ORDER BY SUM_Fee DESC
    limit 1
    )as aa ,(
        SELECT tel , sum(fee) as SUM_Fee
	    from bill
	    GROUP BY tel
    )as bb
    WHERE aa.SUM_Fee = bb.SUM_Fee



SELECT uid,maxN
FROM(
    SELECT MAX(n) as maxN
    FROM(
        SELECT userinfo.uid,count(phone.tel)as n
        FROM userinfo LEFT JOIN live ON
            userinfo.uid=live.uid
            LEFT JOIN phone ON
            live.hid = phone.hid
        GROUP BY userinfo.uid
        )as a
)as aa,(
        SELECT userinfo.uid,count(phone.tel)as n
        FROM userinfo LEFT JOIN live ON
            userinfo.uid=live.uid
            LEFT JOIN phone ON
            live.hid = phone.hid
        GROUP BY userinfo.uid
)as bb
where aa.maxN=bb.n





SELECT tel,max_SUM
FROM(
	SELECT max(SUM) as max_SUM
	from (
    	SELECT tel,SUM(fee) as SUM -- 先抓到表
    	from bill
    	GROUP BY tel) as a
    )as aa,(
    	SELECT tel,SUM(fee) as SUM-- 取到它最大值 之後再去join 這樣才會避免極端值重複 未被抓出來
		from bill
		GROUP BY tel
    )as bb
WHERE aa.max_SUM = bb.SUM



SELECT max(SUM)
from (
    SELECT tel,SUM(fee) as SUM 
    from bill
    GROUP BY tel) as a


SELECT *
from (
    SELECT tel,SUM(fee) as SUM -- 巢狀查詢
    from bill
    GROUP BY tel) as a
WHERE SUM>=1000
-- 拿底下的表 列出大於一千的 


SELECT tel,SUM(fee) as SUM
from bill
GROUP BY tel


SELECT tel,SUM(fee)
from bill
GROUP BY tel


SELECT bill.tel,round(avg(fee),0)as'平均金額' ,address
-- 算出來的 所以要group by 且上面有幾個下面就有幾個
from bill ,phone,house
WHERE bill.hid=phone.hid and phone.hid=house.hid 
GROUP BY bill.tel,address



SELECT tel,round(avg(fee),0)as'平均金額' from bill GROUP BY tel
--各自電話平均 round小數點下幾位


SELECT tel,sum(fee) from bill GROUP BY tel --各自電話加總


SELECT sum(fee) from bill;-- sum加總


SELECT DISTINCT a.uid as '帳號',cname as '姓名',address as '住址'
FROM userinfo as a,live as b,house as c,phone as d
WHERE a.uid=b.uid AND
	b.hid=c.hid AND
    c.hid=d.hid 
-- 刪除電話後 出來的資料重複 拿掉其一 用distinct



SELECT a.uid as '帳號',cname as '姓名',address as '住址',tel as '電話'
FROM userinfo as a,live as b,house as c,phone as d
WHERE a.uid=b.uid AND
	b.hid=c.hid AND
    c.hid=d.hid 



SELECT a.uid,cname,address,tel
FROM userinfo as a,live as b,house as c,phone as d
WHERE a.uid=b.uid AND
	b.hid=c.hid AND
    c.hid=d.hid 
-- 取別名



SELECT house.hid,address,cname
FROM userinfo right join live on 
    userinfo.uid = live.uid
    right JOIN house ON
    live.hid=house.hid
-- 印出所有房子的住戶清單




SELECT userinfo.uid,cname,address,tel
FROM userinfo left join live on 
    userinfo.uid = live.uid
    left JOIN house ON
    live.hid=house.hid
    left JOIN phone ON
    house.hid=phone.hid



SELECT live.uid,cname,address,tel
FROM userinfo inner join live on 
    userinfo.uid = live.uid
    inner join house on
    live.hid=house.hid
    inner join phone on
    house.hid=phone.hid
WHERE cname = '王大明'

-- 兩種方式相同

SELECT live.uid,cname,address,tel
FROM userinfo,live,house,phone
WHERE userinfo.uid=live.uid AND
	live.hid=house.hid AND
    house.hid=phone.hid AND
    cname = '王大明'


