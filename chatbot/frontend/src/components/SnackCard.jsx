import React from 'react';
import './Card.css';

function SnackCard(props) {
  const snack = props['snack'];
  return(
    <div className="card-root">
      <p className="card-name card-detail">{snack['name']}</p>
      <p className="card-detail">$ {snack['price']}</p>
    </div>
  );
}

export default SnackCard;