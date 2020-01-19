import React from 'react';
import { Navbar, Form, FormControl, Button } from 'react-bootstrap';
import User from '../../domain/user/User';

type Props = {
    hasSearch: boolean
};

export default class NavBar extends React.Component<Props, any> {
    render() {
        return (
            <Navbar bg="primary" variant="dark">
                <Navbar.Brand href="#home">Social Network</Navbar.Brand>
                { User.loggedUser ?
                    <div>
                        Olá, {User.loggedUser.name}
                    </div>
                : null }
                { this.props.hasSearch ?
                    <Form inline>
                        <FormControl type="text" placeholder="Search" className="mr-sm-2" />
                        <Button variant="outline-light">Search</Button>
                    </Form>
                : null }
            </Navbar>
        );
    }
}