import React from 'react'
import "./styles/Sign.css";
import BannerImage from "./hamburguers/solohamburguer.jpg";

function sign() {
  return (
    <div className='sign'>
       <div className='leftSide'
      style={{ backgroundImage: `url(${BannerImage})` }} ></div>

<div className="rightSide">
        <h1> Sign In </h1>

        <form id="contact-form" method="POST">
          <label htmlFor="name">Full Name</label>
          <input name="name" placeholder="Enter full name..." type="text" />
          <label htmlFor="email">Email</label>
          <input name="email" placeholder="Enter email..." type="email" />
          <label htmlFor="password">Password</label>
          <input name="password" placeholder="Enter your password..." type="Password" />

          <button type="submit"> Sign in</button>
        </form>
      </div>
    </div>

      
    
  )
}

export default sign
