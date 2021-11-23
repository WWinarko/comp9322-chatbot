import React from "react";

import "./DayOptions.css";

const DayOptions = (props) => {
  const days =["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

  const handleDaySelect = (day) => {
    console.log(props);
    const studio = props['studio'];
    return props.actionProvider.handleExpression(`Show timeslot of movie ${studio['movieId']} at studio ${studio['studioId']} on ${day}`);
  }

  const optionsMarkup = days.map((day) => (
    <button
      className="day-option-button"
      key={day}
      onClick={() => handleDaySelect(day)}
    >
      {day}
    </button>
  ));

  return <div className="day-options-container">{optionsMarkup}</div>;
};

export default DayOptions;