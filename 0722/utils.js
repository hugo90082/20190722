function checkID(id) {
    let ret = false;
    let regex = /^[A-Z][12][0-9]{8}$/;
    if(id.match(regex)!=null){
        ret = true;

    };
return ret;

}