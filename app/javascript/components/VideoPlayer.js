import React from "react";
import PropTypes from "prop-types";
import { Player } from 'video-react';

class VideoPlayer extends React.Component {

    constructor(props){
        super(props)

    }



    render () {
        const {videoHostUri, videoName } = this.props;
        return (
            <div>
                <Player
                    playsInline
                    poster="/assets/poster.png"
                    src={videoHostUri+videoName}
                />
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