import Header from "../layout/Header";
import MegaMenu from '../layout/MegaMenu';
import Backdrop from '@mui/material/Backdrop';
import axios from "axios";

import Footer from '../layout/Footer';
import { useState } from "react";

export default function Info({ cartItemCount }) {

    const [id, setId] = useState('')
    const [name, setName] = useState('')
    const [address, setAddress] = useState('')
    const [mobile, setMobile] = useState('')
    const [yearBirth, setYearBirth] = useState('')

    async function save(event) {
        event.preventDefault();
        try {
            axios(`http://localhost:8080/api/v1/profile/save`, {
                method: "POST",
                data: {
                    profilename: name,
                    address: address,
                    mobile: mobile,
                    yearBirth: yearBirth
                }

            });
            alert("Profile update success");
            setId("");
            setName("");
            setAddress("");
            setMobile("");
            setYearBirth("")
        } catch (err) {
            alert("Profile update failed")
        }
    }
    return ( <>
        < Header cartItemCount = { cartItemCount }/> 
         <MegaMenu/>
        <div className = 'wapper' >

        <div className = "login rounder" >
        <span className = 'p' > ProFile </span>



        <div className = "form-group mb-2 was-validated" >
        <label htmlFor = 'text'
        className = 'form-label' > Name: </label> <
        input type = "text"
        className = "form-control"
        required placeholder = "Enter Name"
        name = "name"
        value = { name }
        onChange = {
            (event) => {
                setName(event.target.value);
            }
        }
        /> 
        <div className = 'invalid-feedback' >
        Please Enter you Name </div>
         </div>


        <div className = "form-group mb-2 was-validated" >
        <label htmlFor = 'email'
        className = 'form-label' > Address: </label> <
        input type = "email"
        className = "form-control"
        required placeholder = "Enter address"
        name = "address"
        value = { address }
        onChange = {
            (event) => {
                setAddress(event.target.value)
            }
        }
        /> 
        <div className = 'invalid-feedback'>
        Please Enter you Address 
        </div> 
        </div>

        <div className = "form-group mb-2 was-validated" >
        <label className = 'form-label'
        htmlFor = 'password' > Mobile </label>
        <input type = "password"
        className = "form-control"
        required placeholder = "Enter number phone"
        name = "password"
        value = { mobile }
        onChange = {
            (event) => {
                setMobile(event.target.value)
            }
        }
        />

        </div> <
        div className = "form-group mb-2 was-validated" >
        <label className = 'form-label'
        htmlFor = 'password' > Year BirthDay </label> 
        <input id = "confirm-password-input"
        type = "password"
        className = "form-control"
        required placeholder = "Enter Year BirthDay"
        value = { yearBirth }
        onChange = {
            (event) => {
                setYearBirth(event.target.value)
            }
        }
        />

        </div>

        <button className = "btn btn-outline-success"
        onClick = { save } > Update </button>



        </div> 
        </div>

        </>
    )
}