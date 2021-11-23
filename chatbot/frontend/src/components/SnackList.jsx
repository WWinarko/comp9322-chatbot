import React from 'react';
import SnackCard from './SnackCard';

function Snack({snacks}) {
  return (
    <>
    {snacks.map((snack) => 
      <SnackCard snack={snack} key={snack['snackId']} />
    )}
    </>
  );
};

export default Snack;