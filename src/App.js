import React from "react"
// import logo from './logo.svg';
import "./App.css"
import axios from "axios"
import {MEDIA_SERVER, BACKEND} from "./config"

class App extends React.Component {
  state = {
    persons: []
  }
  
  componentDidMount() {
    axios.get(BACKEND).then(res => {
      const persons = res.data
      this.setState({ persons })
    })
    console.log("here")
    if(window.REACT_APP_BRAND){
      console.log("window",window.REACT_APP_BRAND);
    }
    console.log("config media server", MEDIA_SERVER)
    
  }
  // let videoToken = await axios.get(`http://localhost:8080`);
  // console.log("videoToken", videoToken)
  render() {
    return (
      <div>
        <p>testing</p>
        <p>{this.state.persons.message}</p>
      </div>
    )
  }
}

export default App
