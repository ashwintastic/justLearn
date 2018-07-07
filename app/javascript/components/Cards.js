import React from "react";
import PropTypes from "prop-types";
import { Link } from 'react-router-dom'
import {Grid,Row, Col, Thumbnail, Button } from 'react-bootstrap'

class Cards extends React.Component {

    constructor(props){
        super(props)

    }


    screeWidth(){
        screen = window.screen.width;
            if (screen > 200 && screen < 700) {
                return {xs: 15, md: 10}
            }
            else if (screen > 700 && screen < 1000) {
                return {xs: 5, md: 7}
            }
            else if (screen > 1000 && screen < 1500 ) {
                return {xs: 4, md: 4}
            }

            else if (screen > 1500) {
                return {xs: 3, md: 3}
            }

            else {
                return {xs: 4, md: 4}
            }

    }

    grid(){
       let customXsMd = this.screeWidth();
      let  url = this.props.videoUrl;
        if (screen > 200 && screen < 700) {
            url = 'http://192.168.43.124:3000/videos/'
        }

        return  this.props.cardInfo.map( (card) => {
            console.log(card)
            return (
                <a href = {url+card.token} key={card.id}>
                <Col xs={customXsMd.xs} md={customXsMd.md} key={card.token}>
                    <Thumbnail src='http://fioextremadura.es/wp-content/uploads/placeholder-blue-800x600px.png'
                               >
                        <h4>Thumbnail label</h4>
                        <p>Description</p>
                    </Thumbnail>
                </Col>
                </a>
            )
        })
    }

    render () {
        let cards = this.grid();
        return (
            <div className="cards">
            <Grid>
                <Row> {cards}</Row>
            </Grid>
            </div>
        );
    }

}

export default Cards

Cards.propTypes = {
    cardInfo: PropTypes.array,
    imgPath: PropTypes.string,
    videoUrl: PropTypes.string
};

window.onresize = resize;

function resize()
{
    console.log("resize event detected!", screen.width, screen.height);
}


