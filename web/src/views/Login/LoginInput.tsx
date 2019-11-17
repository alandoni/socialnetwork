import React from 'react';

type Props = {
    label: string;
    value: string;
    onChange: Function
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
            <div>
                <p>{this.props.label}</p>
                <input type="text" value={this.props.value} onChange={this.onChange}/>
            </div>
        )
    }
}