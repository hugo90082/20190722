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


