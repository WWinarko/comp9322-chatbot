import { createChatBotMessage } from 'react-chatbot-kit';
import CinemaList  from './CinemaList';
import SnackList  from './SnackList';
import MovieList  from './MovieList';
import CinemaCard from './CinemaCard';
import DayOptions from './DayOptions';

const botName = 'CinemaBookingBot';

const config = {
  initialMessages: [createChatBotMessage(`Hi! I'm ${botName}`)],
  botName: botName,
  customStyles: {
    botMessageBox: {
      backgroundColor: '#376B7E',
      height: '50vh'
    },
    chatButton: {
      backgroundColor: '#5ccc9d',
    },
  },
  state: {
    cinemas: [],
    cinema: {},
    snacks: [],
    movies: [],
    studio: {},
  },
  widgets: [
    {
      widgetName: "cinemaList",
      widgetFunc: (props) => <CinemaList {...props} />,
      mapStateToProps: ['cinemas']
    },
    {
      widgetName: "cinemaCard",
      widgetFunc: (props) => <CinemaCard {...props} />,
      mapStateToProps: ['cinema']
    },
    {
      widgetName: "snackList",
      widgetFunc: (props) => <SnackList {...props} />,
      mapStateToProps: ['snacks']
    },
    {
      widgetName: "movieList",
      widgetFunc: (props) => <MovieList {...props} />,
      mapStateToProps: ['movies']
    },
    {
      widgetName: "dayOptions",
      widgetFunc: (props) => <DayOptions {...props} />,
      mapStateToProps: ['studio']
    },
  ],
};

export default config;