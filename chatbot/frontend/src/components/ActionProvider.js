// ActionProvider starter code
import PropTypes from 'prop-types';
import axios from 'axios';

class ActionProvider {
  constructor(
   createChatBotMessage,
   setStateFunc,
   createClientMessage,
   stateRef,
   createCustomMessage,
   ...rest
 ) {
   this.createChatBotMessage = createChatBotMessage;
   this.setState = setStateFunc;
   this.createClientMessage = createClientMessage;
   this.stateRef = stateRef;
   this.createCustomMessage = createCustomMessage;
 }
 
  handleExpression(message) {
    axios.get('http://localhost:5000/v1/ask', {
      params: {
        expression: message,
      },
    })
    .then((res) => {
      const {type, message} = res.data;
      let reply = '';
      if (type === 'unknown') {
        reply = this.createChatBotMessage(message);
      } else if (type === 'showCinemas') {
        this.setState((prevState) => ({
          ...prevState,
          cinemas: message,
        }));
        reply = this.createChatBotMessage("This is the Cinema List", 
        {
          widget: "cinemaList",
          delay: 500,
        }
        );
      } else if (type === 'showGreetings') {
        reply = this.createChatBotMessage(message);
      } else if (type === 'showCinemaDetails') {
        this.setState((prevState) => ({
          ...prevState,
          cinema: message,
        }));
        reply = this.createChatBotMessage("This is the Cinema Info", 
        {
          widget: "cinemaCard",
          delay: 500,
        }
        );
      } else if (type === 'showCinemaSnacks') {
        this.setState((prevState) => ({
          ...prevState,
          snacks: message,
        }));
        reply = this.createChatBotMessage("This is the Snack List", 
        {
          widget: "snackList",
          delay: 500,
        }
        );
      } else if (type === 'showCinemaMovies') {
        console.log(message);
        this.setState((prevState) => ({
          ...prevState,
          movies: message,
        }));
        reply = this.createChatBotMessage("Now Showing Movies", 
        {
          widget: "movieList",
          delay: 500,
        }
        );
      }
      this.updateChatbotState(reply)
    })
  }
  updateChatbotState(message) {
    this.setState((prevState) => ({
      ...prevState,
      messages: [...prevState.messages, message],
    }));
  }
};

export default ActionProvider;

ActionProvider.propTypes = {
  createChatBotMessage: PropTypes.func,
};