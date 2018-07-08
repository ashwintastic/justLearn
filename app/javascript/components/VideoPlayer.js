import React from "react";
import PropTypes from "prop-types";
import { Player } from 'video-react';
import Cards from './Cards'
class VideoPlayer extends React.Component {

    constructor(props){
        super(props)

    }



    render () {
        const {videoHostUri, videoName } = this.props;
        return (
            <div className="container-fluid">
                <div className="col-sm-8 offset-sm-2">
                    <div className="container custom-row video-top-margin">
                        <Player
                            playsInline
                            src='https://media.w3.org/2010/05/sintel/trailer_hd.mp4'
                            poster="https://www.planwallpaper.com/static/images/2015-wallpaper_111525594_269.jpg"
                        />
                    </div>
                </div>
            </div>

        );
    }

}

export default VideoPlayer

VideoPlayer.propTypes = {
    videoHostUri: PropTypes.string,
    videoName: PropTypes.string
};
// https://github.com/video-react/video-react/blob/master/src/components/Player.js

/*
 * VIDEO_HOST_URI: http://localhost:4000/videos/

 VIDEO_DIR: /home/ashwinik/Downloads/test
 IMAGES_DIR: /home/ashwinik/Downloads/test/img

 IMAGE_HOST_URL: http://localhost:4000/images/
 *
 * */



