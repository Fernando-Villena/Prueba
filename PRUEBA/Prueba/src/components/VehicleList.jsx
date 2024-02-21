import React from 'react';
import styled from 'styled-components';
import deleteIconSrc from '../assets/Eliminar.png';
import { useDispatch, useSelector } from 'react-redux';
import { removeVehicle, selectRecentVehicles, selectVehicles } from '../store/vehicleSlice';

const Container = styled.div`
  width: 100%;
  max-width: 1024px;
  margin: auto;
  padding: 20px;
  display: flex;
  flex-direction: column;
  align-items: flex-start;
`;

const Th = styled.th`
  text-align: center;
  border-bottom: 1px solid #ddd;
  padding: 8px;
  white-space: nowrap; 
  color: #363636; 
`;

const Td = styled.td`
  text-align: center;
  border-bottom: 1px solid #ddd;
  padding: 8px;
  margin: 8px;
  color: #363636; 
  white-space: nowrap; 
`;

const Table = styled.table`
  width: 100%;
  border-collapse: collapse;
  margin-top: 20px;
`;

const Button = styled.button`
  background: none;
  border: none;
  cursor: pointer;
  padding: 0;
`;

const PaginationText = styled.div`
  margin-top: 20px;
  text-align: center; 
  width: 100%;
`;

const TwoLineHeader = ({ children }) => {
  const words = children.split(' ');
  return (
    <Th>
      {words.map((word, index) => (
        <div key={index}>{word}</div>
      ))}
    </Th>
  );
};

const VehicleList = () => {
  const dispatch = useDispatch();
  const vehicles = useSelector(selectVehicles); 
  const recentVehicles = useSelector(selectRecentVehicles);

  const handleRemove = (index) => {
    dispatch(removeVehicle(index));
  };

  return (
    <Container>
      <h2>Lista formulario</h2>
      <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the bed industry's standard dummy text ever since.</p>
      <Table>
        <thead>
          <tr>
            <TwoLineHeader>Nombre</TwoLineHeader>
            <TwoLineHeader>Rut vendedor</TwoLineHeader>
            <TwoLineHeader>Patente vehículo</TwoLineHeader>
            <TwoLineHeader>Marca vehículo</TwoLineHeader>
            <TwoLineHeader>Modelo vehículo</TwoLineHeader>
            <TwoLineHeader>Precio vehículo</TwoLineHeader>
            <Th>Eliminar</Th>
          </tr>
        </thead>
        <tbody>
          {recentVehicles.map((vehicle, index) => (
            <tr key={index}>
              <Td>{vehicle.name}</Td>
              <Td>{vehicle.rut}</Td>
              <Td>{vehicle.licensePlate}</Td>
              <Td>{vehicle.brand}</Td>
              <Td>{vehicle.model}</Td>
              <Td>{vehicle.price}</Td>
              <Td>
                <Button onClick={() => handleRemove(index)}>
                  <img src={deleteIconSrc} alt="Delete" />
                </Button>
              </Td>
            </tr>
          ))}
        </tbody>
      </Table>
      <PaginationText>
        Mostrando registros del 1 al 10 de un total de {vehicles.length} registros.
      </PaginationText>
    </Container>
  );
};

export default VehicleList;
