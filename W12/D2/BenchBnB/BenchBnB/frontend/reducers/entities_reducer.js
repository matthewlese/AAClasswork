import { combineReducers } from "redux";
import users_reducer from "./users_reducer";

const entitiesReducer = combineReducers({
  users: usersReducer
});

export default entitiesReducer;