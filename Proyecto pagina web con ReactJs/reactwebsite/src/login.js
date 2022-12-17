import React from 'react'

import "./styles/Login.css";
import BannerImage from "./hamburguers/aboutlogo.jpg";

function login() {
  return (
    <div className='contact'>
      <div className='leftSide'
      style={{ backgroundImage: `url(${BannerImage})` }} ></div>

<div className="rightSide">
        <h1> Login </h1>

        <form id="contact-form" method="POST">
          <label htmlFor="name">Full Name</label>
          <input name="name" placeholder="Enter full name..." type="text" />
          <label htmlFor="email">Email</label>
          <input name="email" placeholder="Enter email..." type="email" />
          <label htmlFor="password">Password</label>
          <input name="password" placeholder="Enter your password..." type="Password" />

          <button type="submit"> Login</button>
        </form>
      </div>




    </div>
  )
}

export default login
