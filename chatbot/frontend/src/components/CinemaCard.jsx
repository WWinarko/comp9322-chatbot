import React from 'react';
import './Card.css';

function CinemaCard(props) {
  const cinema = props['cinema'];

  const handleSnacks = () => {
    props.actionProvider.setState((prevState) => ({
      ...prevState,
      cinema: cinema,
    }));
    return props.actionProvider.handleExpression(`Show snacks at cinemas with id ${cinema['cinemaId']}`);
  }

  const handleMovies = () => {
    props.actionProvider.setState((prevState) => ({
      ...prevState,
      cinema: cinema,
    }));
    return props.actionProvider.handleExpression(`Show movies at cinemas with id ${cinema['cinemaId']}`);
  }
  return(
    <div className="card-root">
      <p className="card-name card-detail">{cinema['name']}</p>
      <p className="card-detail">{cinema['address']}</p>
      <p className="card-detail">{cinema['phone']}</p>
      <button className="card-button" onClick={handleMovies}>Now Showing Movies</button>
      <button className="card-button" onClick={handleSnacks}>Snacks</button>
    </div>
  );
}

export default CinemaCard;