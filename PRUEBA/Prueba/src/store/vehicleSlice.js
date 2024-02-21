import { createSlice, createSelector } from '@reduxjs/toolkit';

const vehicleSlice = createSlice({
  name: 'vehicle',
  initialState: {
    vehicles: []
  },
  reducers: {
    addVehicle: (state, action) => {
      state.vehicles.unshift(action.payload);
  
    },
    removeVehicle: (state, action) => {
      state.vehicles.splice(action.payload, 1);
    }
  }
});

export const { addVehicle, removeVehicle } = vehicleSlice.actions;

export const selectVehicles = state => state.vehicle.vehicles;


export const selectRecentVehicles = createSelector(
  [selectVehicles],
  (vehicles) => vehicles.slice(0, 10) // Devuelve solo los primeros 10 vehículos
);

export default vehicleSlice.reducer;