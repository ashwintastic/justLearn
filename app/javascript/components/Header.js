import React from "react"
import PropTypes from "prop-types"
import { BrowserRouter, Route, Link, Router } from 'react-router-dom'

class Header extends React.Component {
    render () {
        return (
            <nav className="navbar navbar-default navbar-fixed-top navbar-burger">
                <div className="container-fluid">
                    <div>
                        <a className="navbar-brand" href="#">name</a>
                    </div>
                        <div className="input-group" style={{top:'9px'}}>
                            <input type="text" className="form-control" placeholder="Search" name="search"/>
                                <div className="input-group-btn">
                                    <button className="btn btn-default" type="submit">
                                        <i className="glyphicon glyphicon-search"></i>
                                    </button>
                                </div>
                        </div>
                </div>
            </nav>


        );
    }

}

export default Header
