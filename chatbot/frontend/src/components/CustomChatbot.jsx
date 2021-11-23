/* eslint-disable no-unused-vars */
import React from 'react';
import Chatbot from 'react-chatbot-kit';
import ActionProvider from './ActionProvider';
import MessageParser from './MessageParser';
import config from './config';

function CustomChatbot() {

  return (
    <Chatbot config={config} actionProvider={ActionProvider} 	    messageParser={MessageParser} />
  )
}

export default CustomChatbot;