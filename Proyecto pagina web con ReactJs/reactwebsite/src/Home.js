import React from 'react'


import BannerImage from "./hamburguers/gifburgermain.gif";

import "./styles/Home.css";

import {Link} from "react-router-dom";

function Home() {
  return (
    <div className="home" style={{ backgroundImage: `url(${BannerImage})` }}>
    <div className="headerContainer">
      <h1> BURGUER SHOTS </h1>
      <p> HAMBURGUER TO FIT ANY TASTE</p>
      <Link to="/menu">
        <button> ORDER NOW </button>
      </Link>
    </div>
  </div>
  )
}

export default Home
