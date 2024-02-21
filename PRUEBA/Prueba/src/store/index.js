import { configureStore } from '@reduxjs/toolkit';
import vehicleReducer from './vehicleSlice';

export default configureStore({
  reducer: {
    vehicle: vehicleReducer
  }
});
