import React from 'react';

interface Observable {
    setState(newState: any, callback?: () => void): void;
    getState(): any;
}

class Observer {
    observables: Observable[] = [];

    notifyChanges(newState: any, callback: (state: any) => void) {
        for (let observable of this.observables) {
            observable.setState(newState, () => {
                callback(observable.getState());
            });
        }
    }
}

export default class ViewModel extends Observer {
    state: any;

    setState(newState: any) {
        this.notifyChanges(newState, (state: any) => {
            this.state = state;
        });
    }
}

export class ViewModelComponent<T extends ViewModel, P = {}, S = {}> extends React.Component<P, S> implements Observable {
    viewModel: T;

    constructor(props: any, viewModel: T) {
        super(props);
        this.viewModel = viewModel;
        viewModel.observables.push(this);
        this.state = viewModel.state;
    }

    setState(newState: any, callback?: () => void) {
        super.setState(newState, callback);
    }

    getState(): any {
        return this.state;
    }
}
