import React from 'react';
import { Form } from 'react-bootstrap';

type Props = {
    label: string;
    value: string;
    type: string;
    onChange: Function;
};

export default class LoginInput extends React.Component<Props> {
    static defaultProps = {
        label: "",
        value: "",
    };

    onChange = (event: any) => {
        const value = event.target.value;
        this.props.onChange(value);
    }

    render() {
        return (
            <Form.Group>
                <Form.Label>{this.props.label}</Form.Label>
                <Form.Control type={this.props.type} value={this.props.value} onChange={this.onChange}/>
            </Form.Group>
        )
    }
}