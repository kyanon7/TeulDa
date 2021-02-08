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
        <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.6.0/dist/lux/bootstrap.min.css" integrity="sha256-n1LAsYCohTi3YOpx8/Jhgf1i6BLuraa4Bnx/qTd4Vs0=" crossorigin="anonymous"> -->

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

    .colorSquare {
      box-shadow: 0px 0px 25px 0px #333;
      width: 242px;
      height: 242px;
      margin-bottom: 15px;
    }

    .colorArea input {
      padding: 10px;
      font-size: 16px;
      border: 2px solid #CCC;
    }

    .colorArea button {
      padding: 10px;
      font-size: 16px;
      margin: 10px;
      background-color: #666;
      color: #FFF;
      border: 2px solid #666;
    }

    .colorArea button:hover {
      background-color: #111;
      border-color: #111;
      cursor: pointer;
    }

    #colorHeading {
      padding: 0;
      margin: 50px;
      margin-bottom: -20px;
      font-family: sans-serif;
    }
</style>

        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha256-7dA7lq5P94hkBsWdff7qobYkp9ope/L5LQy2t/ljPLo=" crossorigin="anonymous"></script> -->
        <script src="https://cdn.jsdelivr.net/npm/react@17.0.1/umd/react.development.js" integrity="sha256-vgei20o/SJ6umW3ivqyJho3ehzJtQ0/7RXS6Z17uC9A=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/react-dom@17.0.1/umd/react-dom.development.js" integrity="sha256-qMfhc+Y8DYwzdUxp1SsKc0nlW57lOIeoPaZ5pZs+MqA=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/babel-standalone@6.26.0/babel.min.js" integrity="sha256-FiZMk1zgTeujzf/+vomWZGZ9r00+xnGvOgXoj0Jo1jA=" crossorigin="anonymous"></script>

        <script defer type="text/babel">
            const destination = document.querySelector("#container");

            class Colorizer extends React.Component {
                
                constructor(props, context) { super(props, context);

                this.state = {
                    color: "",
                    bgColor: "white"
                }

                this.colorValue = this.colorValue.bind(this);
                this.setNewColor = this.setNewColor.bind(this);
                }

                colorValue(e) {
                    this.setState({color: e.target.value});
                }
            
                setNewColor(e){
                    this.setState({
                        bgColor: this.state.color
                    });

                    this._input.focus();
                    this._input.value = "";

                    e.preventDefault();
                }

                render() {
                    const squareStyle = {
                        backgroundColor: this.state.bgColor
                    };

                    const self = this;

                    return (
                        <div className="colorArea">
                            <div style={squareStyle} className="colorSquare"></div>

                            <form onSubmit={this.setNewColor}>
                                <input onChange={this.colorValue} 
                                        ref={
                                            function(el) {
                                                self._input = el;
                                            }
                                        }
                                        placeholder="Enter a color value"></input>
                                <button type="submit">go</button>
                            </form>
                            <ColorLabel color={this.state.bgColor}/>
                        </div>
                    );
                }
            }

            const heading = document.querySelector("#colorHeading");

            class ColorLabel extends React.Component {
                render() {
                    return ReactDOM.createPortal(
                        ": " + this.props.color,
                        heading
                    );
                }
            }

            ReactDOM.render(
                <div>
                    <Colorizer/>
                </div>,
                destination
            );            

        </script>

    </head>
    <body>
        <h1 id="colorHeading">Colorizer</h1>
        <div id="container"></div>
    </body>
</html>
