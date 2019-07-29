SELECT bill.tel,round(avg(fee),0)as'平均金額' ,address-- 算出來的 所以要group by
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


