function checkIDTW(id) {
    let ret = false;
    let regex = /^[A-Z][12][0-9]{8}$/;
    let letters='ABCDEFGHJKLMNPQRSTUVXYWZIO';


    if(id.match(regex)!=null){
        //ret = true;
        let c1 = id.charAt(0);
        let n12 = letters.indexOf(c1)+10;
        let n1=parseInt(n12/10);
        let n2 = n12%10;
        let n3 = parseInt(id.substr(1, 1));
        let n4 = parseInt(id.substr(2, 1));
        let n5 = parseInt(id.substr(3, 1));
        let n6 = parseInt(id.substr(4, 1));
        let n7 = parseInt(id.substr(5, 1));
        let n8 = parseInt(id.substr(6, 1));
        let n9 = parseInt(id.substr(7, 1));
        let n10 = parseInt(id.substr(8, 1));
        let n11 = parseInt(id.substr(9, 1));
        let sum = n1*1+n2*9+n3*8+n4*7+n5*6+n6*5+n7*4+n8*3+n9*2+n10*1+n11*1;
        ret = sum % 10==0;
    };
return ret;
}

function creaetTWID(){//都不選
    gender = parseInt(Math.random() * 2 + 1);
    let letters = 'ABCDEFGHJKLMNPQRSTUVXYWZIO';
    area = letters.substr(parseInt(Math.random() * 26), 1);
    let newID = createTWIDByAll(area, gender);
    return newID;
}

function createTWIDByArea(area){//只有選地區
    gender = parseInt(Math.random() * 2 + 1);
    let newID = createTWIDByAll(area, gender);
    return newID;
}

function createTWIDByGender(gender) {//只有選性別
    let letters = 'ABCDEFGHJKLMNPQRSTUVXYWZIO';
    area = letters.substr(parseInt(Math.random() * 26), 1);//創造一個亂數地區
    let newID = createTWIDByAll(area, gender);
    return newID;
}

function createTWIDByAll(area,gender) {//地區性別都有選
    let n = [];
    let sum2=0;
    let genderNum= parseInt(gender);
    let letters = 'ABCDEFGHJKLMNPQRSTUVXYWZIO';
    let change = letters.indexOf(area) + 10; //第一碼英文交換成數字
    n[0] = parseInt(change / 10);
    n[1] = change % 10;
    for (let i=2;i<=9;i++){
        n[i]=parseInt(Math.random()*10);
    }
    sum2 = n[0] * 1 + n[1] * 9 + genderNum * 8 + n[2] * 7 + n[3] * 6 + n[4] * 5 + n[5]* 4 + n[6] * 3 + n[7] * 2 + n[8] * 1;
    
    if (sum2 % 10 == 0){
        n[9]=0;
    }else{
        n[9] = 10 - (sum2 % 10);
    }
    //補mod數讓他被10整除 若已經是0則不管她

    let newID= area+gender;
    for (let j =2;j<=9;j++){
        newID+=n[j];
    }
    return newID; 
}