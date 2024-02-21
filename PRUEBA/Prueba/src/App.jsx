import React, { useState } from 'react';
import { useSelector } from 'react-redux';
import { selectVehicles } from './store/vehicleSlice';
import VehicleForm from './components/VehicleForm';
import Navbar from './components/Navbar';
import Contenido from './components/Contenido';
import VehicleList from './components/VehicleList'; 
import './App.css'


const App = () => {
  const vehicles = useSelector(selectVehicles); 
  const [activeTab, setActiveTab] = useState('form');

  return (
    <div>
      <Navbar activeTab={activeTab} setActiveTab={setActiveTab} />
      {activeTab === 'form' && <Contenido />}
      {activeTab === 'form' && <VehicleForm />}
      {activeTab === 'list' && <VehicleList vehicles={vehicles} />} 
    </div>
  );
};

export default App;
