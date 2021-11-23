import React from 'react';
import './Card.css';

function MovieCard(props) {
  const movie = props['movie'];

  const handleSelect = () => {
    const message = props.actionProvider.createChatBotMessage("Please select a day", {
      widget: "dayOptions",
      delay: 500,
    })
    return  props.actionProvider.setState((prevState) => ({
      ...prevState,
      studio: movie,
      messages: [...prevState.messages, message],
    }));
  }
  return(
    <div className="card-root">
      <p className="card-name card-detail movie-title">{movie['title']}</p>
      <p className="card-detail movie-description">{movie['description']}</p>
      <p className={movie['type'] === 'original' ? "movie-original": "movie-vmax"}>{movie['type']}</p>
      <button className="card-select" onClick={handleSelect}>Select</button>
    </div>
  );
}

export default MovieCard;