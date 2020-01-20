import { StyleSheet } from "react-native";

const Colors = {
    backgroundColor: '#f4f4f4',
    borderColor: '#cacaca',
    textColor: '#212529',
    textFieldBorderColor: '#ced4da',
    textFieldColor: '#495057',
    primaryColor: '#037afb',
    primaryTextColor: '#037afb',
    buttonColor: '#fff',
    sectionBackgroundColor: '#fefefe',
    errorBackgroundColor: '#f8d7da',
    errorTextColor: '#721c24',
    errorBorderColor: '#f5c6cb',
    warningBackgroundColor: '#fff3cd',
    warningTextColor: '#856404',
    warningBorderColor: '#ffeeba',
}

const Styles = StyleSheet.create({
    container: {
      flex: 1,
      backgroundColor: Colors.backgroundColor,
      justifyContent: 'center',
    },

    horizontal: {
        flexDirection: 'row',
    },

    marginRight: {
        marginEnd: 12,
    },

    marginTop: {
        marginTop: 6,
    },

    fill: {
        flexGrow: 1,
    },

    centerContent: {
        justifyContent: 'center',
    },

    section: {
        borderColor: Colors.borderColor,
        borderWidth: 1,
        borderStyle: 'solid',
        backgroundColor: '#fefefe',
        paddingTop: 12,
        paddingBottom: 12,
        paddingEnd: 12,
        paddingStart: 12,
        marginTop: 12,
        marginBottom: 12,
        marginStart: 12,
        marginEnd: 12,
    },

    button: {
        alignSelf: 'center',
        backgroundColor: Colors.primaryColor,
        color: Colors.buttonColor,
        borderWidth: 1,
        borderColor: Colors.primaryColor,
        paddingTop: 6,
        paddingBottom: 6,
        paddingStart: 12,
        paddingEnd: 12,
        marginBottom: 8,
    },

    textField: {
        backgroundColor: Colors.buttonColor,
        borderColor: Colors.textFieldBorderColor,
        borderWidth: 1,
        color: Colors.textFieldColor,
        paddingTop: 6,
        paddingBottom: 6,
        paddingStart: 12,
        paddingEnd: 12,
        marginBottom: 8,
    },

    text: {
        color: Colors.textColor,
        marginBottom: 8,
    },

    textButton: {
        alignSelf: 'center',
        color: Colors.buttonColor,
    },

    primaryText: {
        alignSelf: 'center',
        color: Colors.primaryTextColor,
        marginBottom: 8,
    },

    largeText: {
        fontSize: 28,
        marginBottom: 8,
    },

    errorText: {
        paddingTop: 12,
        paddingBottom: 12,
        paddingStart: 20,
        paddingEnd: 20,
        marginBottom: 16,
        backgroundColor: Colors.errorBackgroundColor,
        borderColor: Colors.errorBorderColor,
        borderWidth: 1,
        color: Colors.errorTextColor,
    },

    warning: {
        paddingTop: 12,
        paddingBottom: 12,
        paddingStart: 20,
        paddingEnd: 20,
        backgroundColor: Colors.warningBackgroundColor,
        borderColor: Colors.warningBorderColor,
        borderWidth: 1,
        color: Colors.warningTextColor,
    },

    hr: {
        backgroundColor: Colors.textFieldBorderColor,
        height: 1,
        marginStart: 12,
        marginEnd: 12,
    }
});

export { Styles, Colors };