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
            else if (screen > 1000 && screen < 1500 && this.props.isIndex ) {
                return {xs: 4, md: 4}
            }
            else if (screen > 1000 && screen < 1500 ) {
                return {xs: 10, md: 10}
            }

            else if (screen > 1500) {
                return {xs: 4, md: 4}
            }



    }




    grid(){
       let customXsMd = this.screeWidth();
      let  url = this.props.videoUrl;
        if (screen > 200 && screen < 700) {
            url = 'http://192.168.0.105:3000/videos/'
        }

        return  this.props.cardInfo.map( (card) => {
            return (
                <a href = {url+card.token} key={card.id}>
                <Col xs={customXsMd.xs} md={customXsMd.md} key={card.token}>
                    <Thumbnail src='https://www.planwallpaper.com/static/images/2015-wallpaper_111525594_269.jpg'
                               >
                        <h4>{card.name}</h4>
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
    videoUrl: PropTypes.string,
    isIndex: PropTypes.bool
};

window.onresize = resize;

function resize()
{
    console.log("resize event detected!", screen.width, screen.height);
}


