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

function creaetTWID(){

}
function createTWIDByArea(area){

}
function createTWIDByGender(gender) {

}
function createTWIDByAll(area,gender) {
    area=document.getElementById("area").value;
    gender = document.querySelector('input[name="gender"]:checked').value;
    let n = [];
    //document.getElementById("id").value=area+ gender;
    let newID= area+gender;
    do{
        for (let i=0;i<8;i++){
        n[i]=parseInt(Math.random()*10);
        newID+=n[i];
        //document.getElementById("id").value+=n[i]; 
        }
    }while(checkIDTW(newID)==true);
        document.getElementById("id").value=newID;
    

    // while(checkIDTW){

    // }
    
    

    return; 
}