import React from 'react';
import styled, { css } from 'styled-components';

const StyledNavbar = styled.nav`
  background-color: #ffffff;
  box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
  padding: 10px 20px;
  margin: 0 -20px;
`;

const StyledUl = styled.ul`
  list-style-type: none;
  padding: 0;
  margin-right: 350px;
  text-align: right;
  @media (max-width: 1400px) {
    margin-right: 0px;
  }
`;

const StyledLi = styled.li`
  display: inline-block;
  margin: 20px 10px 20px 0px;
  cursor: pointer;
  color: #002EFF;
  padding: 12px 15px; 
  border-radius: 20px; 
  font-weight: bold;

  ${props => props.active && css`
    background-color: #F3F5FF; 
    color: #002EFF;
    
    @media (max-width: 999px) {
      text-decoration: underline;
      margin: 0px;
    }
  `}

  @media (min-width: 999px) {
    &:hover {
      background-color: #F3F5FF; 
    }
  }

  @media (max-width: 999px) {
    background-color: white; 
    margin: 10px 10px;
    color:black;
    margin: 10px 0px;
  }
`;

const Separator = styled.span`
  color: black;
  font-weight: normal;


  @media (min-width: 999px) {
    display: none; 
  }
`;

const Navbar = ({ setActiveTab, activeTab }) => {
  return (
    <StyledNavbar>
      <StyledUl>
        <StyledLi
          active={activeTab === 'form'}
          onClick={() => setActiveTab('form')}
        >
          Formulario
        </StyledLi>

        <StyledLi
         
        >  <Separator>|</Separator></StyledLi>
      
        <StyledLi
          active={activeTab === 'list'}
          onClick={() => setActiveTab('list')}
        >
          Lista Formulario
        </StyledLi>
      </StyledUl>
    </StyledNavbar>
  );
};

export default Navbar;


