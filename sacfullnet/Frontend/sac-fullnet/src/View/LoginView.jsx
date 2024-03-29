/* eslint-disable no-unused-vars */
/* eslint-disable react/prop-types */
import React, { useState } from "react";
import LogoPng from "../Resources/logo.jpeg";
import { Alert, Button, Card, CardBody, Col, Form, FormGroup, Input, Label, Row, Spinner } from "reactstrap";
import { useNavigate } from "react-router-dom";
import SacfullnetAPI from "../Services/SacfullnetApi";

import { getToken, isAuthenticated, logout, reset, setUserRole } from "../Services/TokenService";


const Login = ({ handleLogin, handleLougout }) => {
    const navigate = useNavigate();
    const [user, setUser] = useState({
        login: "",
        password: ""
    });

    const [token, setToken] = useState(null);


    const [invalidUser, setInvalidUser] = useState(false);

    const [loading, setLoading] = useState(false)

    const onDismissInvalid = () => { setInvalidUser(!invalidUser); };

    const handleChange = (event) => {
        const { name, value } = event.target;


        setUser((prevUser) => ({
            ...prevUser,
            [name]: value
        }));


    };


    const handleSubmit =  async () =>  {
        console.log(JSON.stringify(user))
        setLoading(true)
        SacfullnetAPI.post("auth/login", {
            login: user.login,
            password: user.password
        })
            .then(({ data }) => {
                setToken(data.token);
                SacfullnetAPI.post("auth/user", {
                    login: user.login
                }).then((role) => {
                    handleLogin(user, data.token, role.data.role)
                    setLoading(false);
                    navigate("/home");
                    

                }).catch(error => alert(error))

            }).catch(error => {
                console.log(error);
                setInvalidUser(true);
                setLoading(false);
            })

    };

    return (
        <Row style={{ marginLeft: 10 }} id="LoginContainer">

            <Col style={{ marginTop: 20, marginRight: 20, marginBottom: 10 }} >

                <div
                    style={{
                        borderRadius: 20,
                        display: "flex",
                        justifyContent: "center",
                        alignItems: "center",
                        height: "100vh"
                    }}
                    className="bg-primary"
                >

                    <Card
                        style={{
                            width: "20rem",
                            borderRadius: "8px",
                            boxShadow: "0 2px 10px rgba(0, 0, 0, 0.15)"
                        }}
                    >
                        {invalidUser && <Alert style={{ margin: 20 }} id="incorrectAlert" isOpen={invalidUser} toggle={onDismissInvalid} color="danger">Usuario ou senha invalido!</Alert>}
                        <CardBody>
                            <img style={{ marginBottom: 15 }} alt="Card cap" src={LogoPng} width="100%" />

                            <Form>
                                <Row>
                                    <Col>
                                        <FormGroup floating>
                                            <Input
                                                id="login"
                                                name="login"
                                                onChange={handleChange}
                                                placeholder="Digite seu Login"
                                                type="username"
                                                value={user.login}
                                            />
                                            <Label for="username">Usuário</Label>
                                        </FormGroup>
                                    </Col>
                                </Row>
                                <Row>
                                    <Col>
                                        <FormGroup floating>
                                            <Input
                                                id="password"
                                                name="password"
                                                onChange={handleChange}
                                                placeholder="Password"
                                                type="password"
                                                value={user.password}
                                            />
                                            <Label for="password">Senha</Label>
                                        </FormGroup>
                                    </Col>
                                </Row>
                                <Row>
                                    <Col className="d-flex align-items-center justify-content-center">
                                        <Button id="btnLogin" color="primary" onClick={handleSubmit}>
                                            {loading ? <Spinner color="light" /> : "Acessar"}
                                        </Button>
                                    </Col>

                                </Row>

                            </Form>


                        </CardBody>
                    </Card>
                </div>

            </Col>

        </Row>

    );
};

export default Login;