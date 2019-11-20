import React from "react"
// import logo from './logo.svg';
import "./App.css"
import axios from "axios"
import config from "./config"

class App extends React.Component {
  state = {
    persons: []
  }
  
  componentDidMount() {
    axios.get(config.BACKEND).then(res => {
      const persons = res.data
      console.log("res", res.data)
      this.setState({ persons })
    })
    console.log("here")
    if(config.BRAND){
      console.log("window",config.BRAND);
    }
    
  }
  // let videoToken = await axios.get(`http://localhost:8080`);
  // console.log("videoToken", videoToken)
  render() {
    return (
      <div>
        <p>testing</p>
        <p>{config.BRAND}</p>
        <p>{config.BACKEND}</p>
        <p>{this.state.persons.message}</p>
      </div>
    )
  }
}

export default App
