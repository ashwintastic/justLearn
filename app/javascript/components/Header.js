import React from "react"
import PropTypes from "prop-types"
import { BrowserRouter, Route, Link, Router } from 'react-router-dom'
import { Async } from 'react-select';
import callApi from '../helper/fetch'



class Header extends React.Component {

    constructor(props){
        super(props)
        this.state ={
            options: null
        }
    }

    getOptions(e){
        console.log("hi", e)
        if (e === ''){
         return null
        }
      
        return callApi('http://172.19.19.59:4000/auto_suggestions/'+e).then( (resp)=>{
           console.log('heheh', resp)
           //this.setState({options: resp.options})
           return {options: resp.options}
        })
    
    }

    handleOnChange(e){
     // test
     window.history.pushState("", "", "videos/?q="+e.value);
     window.location.reload();

    }

    render () {
        console.log("render called")
        return (
            <nav className="navbar navbar-default navbar-fixed-top navbar-burger">
                <div className="container-fluid">
        
                        <a className="navbar-brand" href={this.props.homeUri}>Web name</a>
                
                    <Async
                        name="form-field-name"
                        loadOptions={this.getOptions.bind(this)}
                        onChange = {this.handleOnChange}
                        placeholder = 'Search'
                
                    />

                </div>
            </nav>


        );
    }

}

export default Header

Header.propTypes = {
    homeUri: PropTypes.string
};

/*

 <div className="input-group" style={{top:'9px'}}>
 <input type="text" className="form-control" placeholder="Search" name="search"/>
 <div className="input-group-btn">
 <button className="btn btn-default" type="submit">
 <i className="glyphicon glyphicon-search"></i>
 </button>
 </div>
 </div>*/