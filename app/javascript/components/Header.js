import React from "react"
import PropTypes from "prop-types"
import { BrowserRouter, Route, Link, Router } from 'react-router-dom'

class Header extends React.Component {
    render () {
        return (
            <nav className="navbar navbar-inverse">
                <div className="container-fluid">
                    <div className="navbar-header">
                        <a className="navbar-brand" href="#">WebSiteName</a>
                    </div>

                    <form className="navbar-form navbar-left" action="/action_page.php">
                        <div className="input-group">
                            <input type="text" className="form-control" placeholder="Search" name="search"/>
                                <div className="input-group-btn">
                                    <button className="btn btn-default" type="submit">
                                        <i className="glyphicon glyphicon-search"></i>
                                    </button>
                                </div>
                        </div>
                    </form>
                </div>
            </nav>


        );
    }

}

export default Header
