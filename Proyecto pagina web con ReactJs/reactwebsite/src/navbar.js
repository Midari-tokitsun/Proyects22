import React , {useState} from 'react'
import Logo from './hamburguers/logo.PNG';

import {Link} from "react-router-dom";

import './styles/navbar.css';
import Login from "./login";


function navbar() {



  return (
    <div className="navbar">
      <div className='leftSide'>
       <img src={Logo}/>
      </div>


      <div className='rightSide'>
<Link to="/login">login</Link>        
<Link to="/">Home</Link>
<Link to="/sign in">Sign In</Link>
<Link to="/menu">Menu</Link>
<Link to="/about">About</Link>
<Link to="/ubication">Ubication</Link>
      </div>

    </div>
  )
}

export default navbar
