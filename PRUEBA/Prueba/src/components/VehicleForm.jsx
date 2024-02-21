import React, { useState } from 'react';
import { useDispatch } from 'react-redux';
import { addVehicle } from '../store/vehicleSlice';
import styled from 'styled-components';


const FormContainer = styled.div`
  display: flex;
  flex-direction: column;
  max-width:800px;
  margin: 40px auto;
  background: #fff;
  padding: 20px;
  overflow: visible; 
`;

const StyledForm = styled.form`
  display: flex;
  flex-direction: column;
  overflow: visible; 
`;

const FormGroup = styled.div`
  display: flex;
  position: relative;
  margin-bottom: 15px;
  flex-direction: column;
  margin-bottom: 15px;
  flex-basis: ${props => props.flexBasis || '100%'};
  overflow: visible; 

  @media (max-width: 768px) {
    flex-basis: 100%;
  }
`;

const FormLabel = styled.label`
  margin-bottom: 5px;
  font-weight: bold;
  overflow: visible; 
`;


const StyledSelect = styled.select`
  padding: 18px;
  border: 2px solid blue; 
  border-radius: 10px;
  margin-bottom: 15px;
  overflow: visible; 
  &:focus {
    border-color: blue; 
    outline: none; 
  }
  
`;

const SubmitButton = styled.button`
  padding: 10px 15px; 
  width: 100%; 
  max-width: 140px; 
  height: 45px; 
  color: white;
  background-color: blue;
  border: none;
  border-radius: 25px;
  cursor: pointer;
  font-size: px; 
  &:hover {
    background-color: #001A91;
  }
  @media (max-width: 768px) {
    max-width: 240px;
  }
 
`;


const InlineGroup = styled.div`
  display: flex;
  justify-content: space-between;
  gap: 10px; 

  @media (max-width: 768px) {
    flex-direction: column;
  }
`;

const ActiveLabel = styled(FormLabel)`
  position: absolute;
  left: 16px;
  top: 6px; 
  background-color: white;
  padding: 0 8px;
  
  font-size: 0.75em; 
  color: blue; 
  z-index: 10;
  pointer-events: none;
 
  transform: translateY(-50%); 
  overflow: visible; 
  transition: transform 0.3s, font-size 0.3s; 
`;

const StyledInput = styled.input`
  padding: 20px 10px 18px; 
  border: 2px solid blue;
  border-radius: 10px;

  overflow: visible; 
  &:focus {
    border-color: #0000D4; 
    outline: none; 
  }
`;

const RequiredAsterisk = styled.span`
  color: red;
  margin-left: 4px;
`;



const Titulos = styled.h3`
margin-bottom:20px;
`


const Divider = styled.hr`
  border: none;
  height: 1px;
  background-color: #D3D3D3; /* O el color gris que prefieras */
  margin: 20px 0; /* Ajusta el margen como sea necesario */
`;


const ButtonContainer = styled.div`
  display: flex;
  justify-content: end; 
  padding: 10px 0;

  @media (max-width: 768px) {
    justify-content: center; 
  }
`;



const VehicleForm = () => {
  const dispatch = useDispatch();
  const [form, setForm] = useState({
    rut: '',
    name: '',
    licensePlate: '',
    brand: '',
    model: '',
    price: ''
  });

  const [errors, setErrors] = useState({});


  const brands = ['Toyota', 'Ford', 'Chevrolet', 'Honda', 'Volkswagen'];
  const modelsByBrand = {
    Toyota: ['Corolla', 'Yaris'],
    Ford: ['Fiesta', 'Focus'],
    Chevrolet: ['Cruze', 'Spark'],
    Honda: ['Civic', 'Accord'],
    Volkswagen: ['Golf', 'Polo']
  };

  const handleChange = (e) => {
    const { name, value } = e.target;
    setForm({ ...form, [name]: value });
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    if (validateForm()) {
      dispatch(addVehicle(form));
      setForm({
        rut: '',
        name: '',
        licensePlate: '',
        brand: '',
        model: '',
        price: ''
      });
    }
  };


  const validateForm = () => {
    let errors = {};
    let isValid = true;

    if (!form.rut.trim()) {
      errors.rut = 'RUT del Vendedor es requerido';
      isValid = false;
    }

    if (!form.name.trim()) {
      errors.name = 'Nombre y Apellido es requerido';
      isValid = false;
    }

    if (!form.licensePlate.trim()) {
      errors.licensePlate = 'Patente es requerida';
      isValid = false;
    }

    if (!form.brand.trim()) {
      errors.brand = 'Marca es requerida';
      isValid = false;
    }

    if (!form.model.trim()) {
      errors.model = 'Modelo es requerido';
      isValid = false;
    }

    if (!form.price.trim()) {
      errors.price = 'Precio es requerido';
      isValid = false;
    }

    setErrors(errors);
    return isValid;
  };

  return (
    <FormContainer>
      <StyledForm onSubmit={handleSubmit}>
        <Titulos>Datos del vendedor:</Titulos>
        <InlineGroup>

          <FormGroup flexBasis="66%">
            <StyledInput
              id="name"
              name="name"
              placeholder=" " 
              value={form.name}
              onChange={handleChange}

            />
            <ActiveLabel htmlFor="name" isActive={form.name}>Nombre completo{errors.name && <RequiredAsterisk>*</RequiredAsterisk>}</ActiveLabel>

          </FormGroup>


          <FormGroup flexBasis="33%">

            <StyledInput
              id="rut"
              name="rut"
              placeholder=" "
              value={form.rut}
              onChange={handleChange}


            />
            <ActiveLabel htmlFor="rut" isActive={form.rut}>Rut Vendedor{errors.rut && <RequiredAsterisk>*</RequiredAsterisk>}</ActiveLabel>



          </FormGroup>
        </InlineGroup>
        <Divider />
        <Titulos>Datos del vehículo:</Titulos>
        <InlineGroup>
          <FormGroup>

            <StyledInput
              id="licensePlate"
              name="licensePlate"

              value={form.licensePlate}
              onChange={handleChange}
            />
            <ActiveLabel htmlFor="licensePlate" isActive={form.licensePlate}>Patente del vehículo{errors.licensePlate && <RequiredAsterisk>*</RequiredAsterisk>}</ActiveLabel>

          </FormGroup>

          <FormGroup>

            <StyledSelect
              id="brand"
              name="brand"
              value={form.brand}
              onChange={handleChange}
            >
              <option value=""></option>
              {brands.map((brand, index) => (
                <option key={index} value={brand}>{brand}</option>
              ))}
            </StyledSelect>
            <ActiveLabel htmlFor="brand" isActive={form.brand}>Marca del vehículo{errors.brand && <RequiredAsterisk>*</RequiredAsterisk>}</ActiveLabel>

          </FormGroup>

          <FormGroup>

            <StyledSelect
              id="model"
              name="model"
              value={form.model}
              onChange={handleChange}
              disabled={!form.brand}
            >
              <option value=""></option>
              {form.brand && modelsByBrand[form.brand].map((model, index) => (
                <option key={index} value={model}>{model}</option>
              ))}
            </StyledSelect>
            <ActiveLabel htmlFor="model" isActive={form.model}>Modelo del vehículo{errors.model && <RequiredAsterisk>*</RequiredAsterisk>}</ActiveLabel>

          </FormGroup>

        </InlineGroup>




        <InlineGroup>
          <FormGroup flexBasis="33%">

            <StyledInput
              id="price"
              name="price"
              type="number"

              value={form.price}
              onChange={handleChange}
            />
            <ActiveLabel htmlFor="price" isActive={form.price}>Precio del vehículo {errors.price && <RequiredAsterisk>*</RequiredAsterisk>}</ActiveLabel>

          </FormGroup>
        </InlineGroup>
        <Divider />


        <ButtonContainer>
          <SubmitButton type="submit">Enviar</SubmitButton>
        </ButtonContainer>
      </StyledForm>
    </FormContainer>
  );


};

export default VehicleForm;
