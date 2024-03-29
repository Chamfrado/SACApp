/* eslint-disable react/prop-types */
/* eslint-disable no-unused-vars */
import React, { useEffect, useState } from "react"
import { Button, Col, Label, Modal, ModalBody, ModalFooter, ModalHeader, Row, Table } from "reactstrap"
import SacfullnetAPI from "../../Services/SacfullnetApi";

const FaqDetail = ({selectedFaq, isOpen, onDismiss}) => {

    const [modal, setModal] = useState(false);

    useEffect(() => {
        
          
          setModal(isOpen);
        
        
    },[isOpen])


    const [equipamentos, setEquipamentos] = useState([{
      descricao: "",
      nome: "",
      id: ""
    }]);

    


    const toggle = () => {
      onDismiss();
      let newEquipamentos =[ { 
        descricao: "",
        nome: "",
        id: ""
      },{
        descricao: "",
        nome: "",
        id: ""
      }]
      setEquipamentos(newEquipamentos);
    }

    

    return(
        <Modal size="xl" isOpen={modal} toggle={toggle} >
        <ModalHeader className="bg-primary" toggle={toggle} >
            {selectedFaq.titulo}
        </ModalHeader>
        <ModalBody>
            <Row>
                <Col>
                {selectedFaq.solucao}
                </Col>

            </Row>
            <Row style={{paddingTop: 20}}>
              <Col >
              <Label tag="h5">Lista de Equipamentos para a solução</Label>
              <Table hover responsive>
                <thead>
                <tr>
                  <th>Id do equipamento</th>
                  <th>Nome</th>
                </tr>
                </thead>
                
                <tbody>
                 {selectedFaq.equipamentosRelacionados != null && selectedFaq.equipamentosRelacionados.map((equipamento) => (
                  <tr key={equipamento.id_equipamento}>
                    
                      <td>
                      {equipamento.id_equipamento}
                      </td>
                      <td>
                      {equipamento.nome}
                    </td>
                        
                    
                    
                  </tr>
                 ))}
                </tbody>
              </Table>
              </Col>
              
            </Row>
            
          
        </ModalBody>
        <ModalFooter>
          <Button color="primary" onClick={toggle}>
            Voltar
          </Button>{' '}
        </ModalFooter>
      </Modal>
    )
}

export default  FaqDetail