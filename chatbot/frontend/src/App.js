import './App.css';
import 'react-chatbot-kit/build/main.css';
import Chatbot from 'react-chatbot-kit';
import ActionProvider from './components/ActionProvider';
import MessageParser from './components/MessageParser';
import config from './components/config';

function App() {
  return (
    <div className="App">
      <div style={{ maxWidth: "300px"}} >
        <Chatbot config={config} actionProvider={ActionProvider} messageParser={MessageParser} />
      </div>
    </div>
  );
}

export default App;
