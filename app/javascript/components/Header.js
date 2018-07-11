import React from "react"
import PropTypes from "prop-types"
import { BrowserRouter, Route, Link, Router } from 'react-router-dom'
import { Async } from 'react-select';
import callApi from '../helper/fetch'



class Header extends React.Component {

    getOptions(e){
        console.log("hi", e)
        if (e === '')
         return
        callApi('http://localhost:3000/search?'+'name='+e).then( (resp)=>{
           console.log('heheh', resp)
        })
    }

    render () {
        return (
            <nav className="navbar navbar-default navbar-fixed-top navbar-burger">
                <div className="container-fluid">
        
                        <a className="navbar-brand" href={this.props.homeUri}>Web name</a>
                
                    <Async
                        name="form-field-name"
                        value="one"
                        loadOptions={this.getOptions.bind(this)}
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
