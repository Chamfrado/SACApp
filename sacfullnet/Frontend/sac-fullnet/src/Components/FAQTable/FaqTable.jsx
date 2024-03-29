/* eslint-disable react/prop-types */
/* eslint-disable react/jsx-key */
/* eslint-disable no-unused-vars */
import React, { useEffect, useState } from "react"
import { Badge, Button, Col, Container, Input, InputGroup, Label, Row, Spinner, Table, UncontrolledTooltip } from "reactstrap"
import { BsFillPatchPlusFill, BsFillTrashFill, BsPencilSquare, BsPersonPlus, BsSearch } from "react-icons/bs";
import SacfullnetAPI from "../../Services/SacfullnetApi";
import FaqDetail from "../FaqDetail/FaqDetail";
import FaqAddCard from "../FAQCard/FaqAddCard";
import FaqUpdateCard from "../FAQCard/FaqUpdateCard";
import FaqDeleteCard from "../FAQCard/FaqDeleteCard";
import { getUserRole } from "../../Services/TokenService";

const FaqTable = ({ onSaveSucess, onDeleteSucess, onAddSucess, onRefresh }) => {
    const [error, setError] = useState();
    const [tableData, setTableData] = useState([]);
    const [productNames, setProductNames] = useState({
        id: -1
    });
    const [isLoading, setIsLoading] = useState(true);
    const [selectedFaq, setSelectedFaq] = useState({

        id: -1

    });

    //Cuidando da pesquisa 
    const [searchQuery, setSearchQuery] = useState("");
    const handleSearchChange = (event) => {
        const { value } = event.target;
        setSearchQuery(value);
    };

    const [updateFaq, setUpdateFaq] = useState(false);
    const [deleteFaq, setDeleteFaq] = useState(false);

    const [toggleModal, setToggleModal] = useState(false);




    const [addModal, setAddModal] = useState(false);
    const toggleAddModal = () => setAddModal(!addModal);

    const [updateModal, setUpdateModal] = useState(false);
    const toggleUpdateModal = (faq) => {
        setUpdateFaq(faq)
        setUpdateModal(!updateModal);

    }

    const [deleteModal, setDeleteModal] = useState(false);
    const toggleDeleteModal = (faq) => {
        setDeleteFaq(faq)
        setDeleteModal(!deleteModal)
    }


    const toggle = () => {
        setToggleModal(!toggleModal);

    }
    const dismiss = () => {
        setToggleModal(false);
        setSelectedFaq({ id: -1 });
    }
    const addSucess = () => {
        onAddSucess();
        fetchTableData();
        setAddModal(false);
    }

    const saveSucess = () => {
        onSaveSucess();
        fetchTableData();
    }

    const deleteSucess = () => {

        onDeleteSucess();
        fetchTableData();
    }

    const onCancel = () => {
        setAddModal(false);
        setDeleteModal(false);
        setUpdateModal(false);
    }

    // Function to fetch product names
    async function fetchEquipament(productId) {
        try {
            const url = "equipamento/" + productId;
            const response = await SacfullnetAPI.get(url);
            return response.data.nome;
        } catch (error) {
            setError(error.message);
            setIsLoading(false);
            return ""; // Return an empty string on error
        }
    }


    const fetchTableData = () => {
        const url = "faq?search=" + searchQuery;
        SacfullnetAPI.get(url)
            .then(({ data }) => {
                setTableData(data);
                setIsLoading(false);
            })
            .catch((error) => {
                setError(error.message);
                setIsLoading(false);
            });
    };



    useEffect(() => {
        fetchTableData();
    }, [addModal, updateModal, deleteModal, searchQuery, onRefresh]);

    useEffect(() => {

        if (selectedFaq.id !== -1 && selectedFaq !== null) {
            toggle();
        }

    }, [selectedFaq])

    if (error) {
        return <p>Error: {error}</p>;
    }

    return (
        <Container fluid>
            <Row style={{ paddingTop: 30 }}>
                <Col xs="5">
                    <InputGroup>
                        <Input
                            id="search"
                            name="searchQuery"
                            placeholder="Digite sua duvida aqui."
                            onChange={handleSearchChange}
                            type="search"
                        />
                        <Button color="primary">
                            <BsSearch />
                        </Button>
                    </InputGroup>
                </Col>
                {getUserRole() === "ADMIN" ?
                    <Col>
                        <Button color="primary" onClick={toggleAddModal}><BsFillPatchPlusFill /> Adicionar FAQ</Button>
                    </Col> : null}

            </Row>
            <Row style={{ paddingTop: 20 }}>
                <Table responsive hover>
                    <thead>
                        <tr>
                            <th>Título</th>
                            <th>Equipamentos</th>
                            {getUserRole() == "ADMIN" ? <th>Ações</th> : null}

                        </tr>
                    </thead>
                    <tbody>
                        {isLoading ? (
                            <Label> Carregando Informações <Spinner color="primary" style={{ alignSelf: "center" }} /> </Label>
                        ) : (
                            tableData.map(item => (
                                <tr style={{ cursor: "pointer" }} key={item.id}>
                                    <td onClick={() => setSelectedFaq(item)}>{item.titulo}</td>
                                    <td onClick={() => setSelectedFaq(item)}>
                                        {item.equipamentosRelacionados.map((produto) => (
                                            <Badge key={produto.id_equipamento} style={{ margin: 2 }} color="primary">
                                                {produto.nome} {/* Display product name from state */}
                                            </Badge>
                                        ))}
                                    </td>
                                    {getUserRole() == "ADMIN" ? <td>
                                        <Button id="updateButton" onClick={() => toggleUpdateModal(item)} color="primary"> <BsPencilSquare /></Button>
                                        {'   '}
                                        <Button id="deleteButton" onClick={() => toggleDeleteModal(item)} color="primary"> <BsFillTrashFill /></Button>
                                    </td> : null}
                                </tr>
                            ))
                        )}

                    </tbody>
                </Table>
            </Row>
            {selectedFaq !== -1 ? <FaqDetail selectedFaq={selectedFaq} productNames={productNames} isOpen={toggleModal} onDismiss={dismiss} /> : <></>}
            {addModal && <FaqAddCard onAddSucess={addSucess} open={addModal} onCancel={onCancel} />}
            {updateModal && <FaqUpdateCard onUpdateSucess={saveSucess} open={updateModal} faq={updateFaq} onCancel={onCancel}/>}
            {deleteModal && <FaqDeleteCard onDeleteSucess={deleteSucess} open={deleteModal} faq={deleteFaq} onCancel={onCancel}/>}

        </Container>
    );
}

export default FaqTable;
