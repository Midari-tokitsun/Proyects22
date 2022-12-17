import React from 'react'
import {MenuList} from "./MenuList";
import MenuItem from "./MenuItem"
import "./styles/Menu.css";
import BannerImage2 from "./hamburguers/menu.jpg"


function menu() {
  return (
    <div className="menu"  style={{backgroundImage: `url(${BannerImage2})`  }}>
    <h1 className="menuTitle">Our Menu</h1>
    <div className="menuList">
      {MenuList.map((menuItem, key) => {
        return (
          <MenuItem
            key={key}
            image={menuItem.image}
            name={menuItem.name}
            price={menuItem.price}
          />
        );
      })}
    </div>
  </div>
);
}

export default menu
