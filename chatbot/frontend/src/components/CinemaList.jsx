import React from 'react';
import CinemaCard from './CinemaCard';

function CinemaList(props) {
  const cinemas = props['cinemas']
  return (
    <>
    {cinemas.map((cinema) => 
      <CinemaCard cinema={cinema} key={cinema['cinemaId']} actionProvider={props['actionProvider']}/>
    )}
    </>
  );
};

export default CinemaList;