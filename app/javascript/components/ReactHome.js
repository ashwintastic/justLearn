import React from "react"
import PropTypes from "prop-types"
import { BrowserRouter as Router, Route, Link } from 'react-router-dom'
import Header from './Header';
import Cards from './Cards';
class ReactHome extends React.Component {
    render () {
        return (
            <Router >
                <div>
                    <Header>
                        <Route path="/abc" component={Cards}/>
                    </Header>
                </div>
            </Router>

        );
    }

}

export default ReactHome
