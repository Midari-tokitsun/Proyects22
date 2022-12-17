
import './App.css';

import { Suspense } from 'react';
import {BrowserRouter as Router, Route, Switch} from 'react-router-dom';
import Login from "./login";
import Navbar from './navbar';
import Home from './Home';
import Footer from './footer';
import Menu from './menu';
import Sign from './sign';
import About from './about';
import Ubication from './ubication';

function App() {
  return (

   
    <div className="App">
      
    <Router>
          <Navbar />
          <Suspense fallback={<p>Loading......</p>}>
        <Switch>
    <Route path="/" exact component={Home} />
    <Route path="/Login" exact component={Login} />
    <Route path="/Ubication" exact component={Ubication} />
    <Route path="/Menu" exact component={Menu} />
    <Route path="/sign in" exact component={Sign} />
    <Route path="/About" exact component={About} />
        </Switch>
        <Footer/>
        </Suspense>
    </Router>

    </div>


    
  );
}

export default App;
