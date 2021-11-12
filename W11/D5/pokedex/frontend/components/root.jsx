import React from "react";
import { Provider } from "react-redux";
import App from "./app";

// Root simply wraps the App in the Provider, so it has access to Redux store
const Root = ({ store }) => {
  return (
    <Provider store={store}>
      <App />
    </Provider>
  );
};

export default Root;
