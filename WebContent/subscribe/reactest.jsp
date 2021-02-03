<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>react 적용 연습</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.6.0/dist/lux/bootstrap.min.css" integrity="sha256-n1LAsYCohTi3YOpx8/Jhgf1i6BLuraa4Bnx/qTd4Vs0=" crossorigin="anonymous">

<style>
    #container{
        padding: 50px;
        background-color:  #fff;
    }

    #container h1{
        font-size: 144px;
        font-family: sans-serif;
        color: #0080a8;
    }

    /* .letter {
        padding: 10px;
        margin: 10px;
        background-color: #ffde00;
        color: #333;
        display: inline-block;
        font-family: monospace;
        font-size: 32px;
        text-align: center;
    } */
</style>

        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha256-7dA7lq5P94hkBsWdff7qobYkp9ope/L5LQy2t/ljPLo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/react@17.0.1/umd/react.development.js" integrity="sha256-vgei20o/SJ6umW3ivqyJho3ehzJtQ0/7RXS6Z17uC9A=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/react-dom@17.0.1/umd/react-dom.development.js" integrity="sha256-qMfhc+Y8DYwzdUxp1SsKc0nlW57lOIeoPaZ5pZs+MqA=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/babel-standalone@6.26.0/babel.min.js" integrity="sha256-FiZMk1zgTeujzf/+vomWZGZ9r00+xnGvOgXoj0Jo1jA=" crossorigin="anonymous"></script>

        <script type="text/babel">
            const destination = document.querySelector("#container");

            class Letter extends React.Component {
                render(){
                    let letterStyle = {
                        padding: 10,
                        margin: 10,
                        backgroundColor: this.props.bgcolor,
                        color: "#333",
                        display: "inline-block",
                        fontFamily: "monospace",
                        fontSize: 32,
                        textAlign: "center"
                    };
                    
                    return (
                        <div style={letterStyle}>
                            {this.props.children}
                        </div>
                    )
                }
            }

            class Buttonify extends React.Component {
                render() {
                    return(
                        <div>
                            <button type={this.props.behavior}>{this.props.children}</button>
                        </div>
                    );
                }
            }

            ReactDOM.render(
                <div>
                    <Letter bgcolor="#58b3ff">A</Letter>
                    <Letter bgcolor="#ff605f">E</Letter>
                    <Letter bgcolor="#ffd52e">I</Letter>
                    <Letter bgcolor="#49dd8e">O</Letter>
                    <Letter bgcolor="#ae99ff">U</Letter>
                </div>,
                destination
            );
        </script>

    </head>
    <body>
        <div id="container"></div>
        
    </body>
</html>
