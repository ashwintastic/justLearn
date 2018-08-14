import React from "react"
import PropTypes from "prop-types"
import SearchComponent from './SearchComponent';


class Header extends React.Component {

    constructor(props){
        super(props)
        this.state ={
            options: null
        }
    }

    render () {
        return (
            <nav className="navbar navbar-default navbar-fixed-top navbar-burger">
                <div className="container-fluid">

                    <a className="navbar-brand" href={this.props.homeUri}>Web name</a>
                    <div className="pull-right col-md-3 col-lg-5 col-xs-12 col-sm-3 search-mobile-view"  ref={"searchmobileview"}>
                        <div className="search">
                            <i className="fa fa-times search-close hidden-md hidden-lg" aria-hidden="true" onClick={this.hideMobileSearchBar}></i>
                            <SearchComponent/>
                        </div>
                    </div>


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