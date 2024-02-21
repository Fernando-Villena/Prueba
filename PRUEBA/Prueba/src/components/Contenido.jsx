import React from 'react';
import styled from 'styled-components';
import LaptopImage from '../assets/Laptop.png';

const ContenidoContainer = styled.div`
  display: flex;
  align-items: center;
  justify-content: center; 
  position: relative;
  width: 100vw;
  overflow-x: hidden;
`;

const Title = styled.p`
  color: #002EFF;
  font-size: 50px;
  font-weight: normal;
  margin-right: 100px; 
  z-index: 1;

  // Reducir el tamaño de la imagen cuando el tamaño de la pantalla sea menor a 1000px
  @media (max-width: 999px) {
    
    font-size: 25px; 
    margin-right: 0;
    padding-left:20px; 
    padding-right:10px; 

    b {
      
        font-size:30px;
      }
  }


  @media (max-width: 430px) {
    padding-right:20px; 
  
  }
  @media (max-width: 390px) {
    padding-right:10px; 
  
  }
    @media (max-width: 375px) {
    
    b {
      
      font-size:28px;
    }
  }

`;

const Line = styled.div`
  height: 1px;
  background-color: #D8D8D8;
  position: absolute;
  top: 79.5%;
  left: 0;
  right: 0;
  z-index: 0;
`;


const Image = styled.img`
  width: 400px; 
  height: auto;
  z-index: 1;
'
  // Reducir el tamaño de la imagen cuando el tamaño de la pantalla sea menor a 1000px
  @media (max-width: 999px) {
    width: 0px;
    margin-right:10px;
  }
`;
const TextContainer = styled.div`
  width: 100%; // Utiliza el 100% del ancho de la pantalla o un valor específico si es necesario
  max-width: 800px; // Establece un ancho máximo para el contenedor del texto si es necesario
  margin:  auto; // Centra el contenedor en la pantalla con márgenes automáticos
  padding: 0 0px; // Añade un poco de padding a los lados si es necesario
  display: flex;
  flex-direction: column;
  align-items: flex-start; 
`;

const Texth2 = styled.h2`
  margin-bottom:10px;

  @media (max-width: 999px) {
    padding-left:20px;
  

  }
`;

const Parrafo= styled.p`
  @media (max-width: 999px) {
    padding-left:20px;
  }
`;





const Contenido = () => {
  return (<>
    <ContenidoContainer>
      <Title>Formulario <b>de Prueba</b></Title>
      <Line />
      <Image src={LaptopImage} alt="Laptop" />
      
    </ContenidoContainer>
    <TextContainer>
        <Texth2>Nuevo formulario</Texth2>
        <Parrafo>
        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the bed industry's standard dummy text ever since.
        </Parrafo>
      </TextContainer>
    </>
    
  );
};

export default Contenido;
