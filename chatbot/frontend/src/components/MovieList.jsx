import React from 'react';
import MovieCard from './MovieCard';

function MovieList(props) {
  const movies = props['movies']
  return (
    <>
    {movies.map((movie, index) => 
      <MovieCard movie={movie} key={index} actionProvider={props['actionProvider']}/>
    )}
    </>
  );
};

export default MovieList;