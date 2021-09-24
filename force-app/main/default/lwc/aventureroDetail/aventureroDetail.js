import { LightningElement,api } from 'lwc';

export default class AventureroDetail extends LightningElement {
    @api aventurero;


    changeName(value){
    var evt = new CustomEvent('namechanged',{
        detail:{
               aventureroId: aventurero.Id,
               aventureroName: aventurero.Name, 

        }

    });
    this.dispatchEvent(evt);
}
}