import { LightningElement } from 'lwc';

export default class Campamento extends LightningElement {
    nombre='Antonio';
    ubicacion='Internet';
    aventureros=[

       {
            Id: 1,
            Name:'Antonio'
       } 
,
        {
            Id:2,
            Name:'Flores'
        }

    ];
    handlerNameChanged(event){
        let eventDetail = event.detail;
        this.aventureros[eventDetail.aventureroId].Name = eventDetail.aventureroName;


    }

}