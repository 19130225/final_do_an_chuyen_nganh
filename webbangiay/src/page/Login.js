

import React, { useState, useEffect } from 'react'
import Stack from '@mui/material/Stack';
import Button from '@mui/material/Button';
import Snackbar from '@mui/material/Snackbar';
import MuiAlert from '@mui/material/Alert';
import Backdrop from '@mui/material/Backdrop';
import CircularProgress from '@mui/material/CircularProgress';
import axios from "axios";
import Home from "./Home";
import Header from "../layout/Header";
import { useNavigate } from 'react-router-dom';
import Product from '../layout/Product';
import MegaMenu from '../layout/MegaMenu';
import Footer from '../layout/Footer';
import { Link } from 'react-router-dom';
import Dialog from '@mui/material/Dialog';
import DialogActions from '@mui/material/DialogActions';
import DialogContent from '@mui/material/DialogContent';
import DialogContentText from '@mui/material/DialogContentText';
import DialogTitle from '@mui/material/DialogTitle';
import GoogleLogin from 'react-google-login';

const Alert = React.forwardRef(function Alert(props, ref) {
  return <MuiAlert elevation={6} ref={ref} variant="filled" {...props} />;
});
export default function Login({ cartItemCount }) {
  const [openD, setOpenD] = React.useState(false);

  const handleClickOpenD = () => {
    setOpenD(true);
  };

  const handleCloseD = () => {
    setOpenD(false);
  };
  let navigate = useNavigate();
  const handleDB = () => {
    navigate("/doakboard")
  };
  const [open, setOpen] = React.useState(false);
  const [openSucess, setOpenSucess] = React.useState(false);
  const handleClick = () => {
    setOpen(true);
  };
  const handleClose = (event, reason) => {
    if (reason === 'clickaway') {
      return;
    }

    setOpen(false);
  };

  const handleOpen = () => {
    setOpenSucess(true);
  };
  const handleCloseS = () => {
    setOpenSucess(false);
  };
  const [user, setUser] = useState({
    email: "",
    password: "",
    isLogin: localStorage.getItem("token") != null

  });
  //   const{email,password,isLogin}=user
  const logout = () => {
    localStorage.removeItem("token");
    localStorage.removeItem("nameuser");
    localStorage.removeItem("id");
    this.onLogout();
  }
  const onLogout = () => {
    setUser({ isLogin: false })
  }

  // const handleChange = (e) => {
  //     setUser({
  //         [e.target.name]: e.target.value,
  //     })
  // }
  const { email, password, isLogin } = user
  const onInputChange = (e) => {
    setUser({ ...user, [e.target.name]: e.target.value });

  }

  const login = () => {
    handleOpen()

    axios(`http://localhost:9200/api/v1/auth/authenticate`, {
      method: "POST",
      data: {
        email: email,
        password: password
      }
    })

      .then(response => {

        localStorage.setItem('token', response.data.token);
        localStorage.setItem('nameuser', response.data.lastname + response.data.firstname);
        localStorage.setItem('id', response.data.id);
        localStorage.setItem('roles', JSON.stringify(response.data.roles));
        const roles = JSON.parse(localStorage.getItem('roles'));

        // Kiểm tra giá trị roles
        if (roles && roles.length > 0 && roles[0].authority === 'USER') {
          // Trường hợp roles có giá trị và authority là 'USER'
          // Thực hiện các công việc cần thiết ở đây
          navigate("/")
        } else {
          // Trường hợp khác

          setOpenD(true)
        }


        // setUser({isLogin : true})
      })
      .catch(error => {
        handleCloseS();
        handleClick();
        console.log(error)
      })
  }

  useEffect(() => {
    const urlParams = new URLSearchParams(window.location.search);
    const encodedCode = urlParams.get('code');
    const encodedEmail = urlParams.get('email');
    
    const code = decodeURIComponent(encodedCode);
    const email = decodeURIComponent(encodedEmail);

    if (code && email) {
      getAccessToken(code);
    }
  }, []);

  const getAccessToken = (code) => {
    // Thay thế clientID theo config google api và client_secret.

    const googleApiUrl = `https://oauth2.googleapis.com/token`;

    axios.post(googleApiUrl, {
      code: code,
      client_id: '94313690600-mgb7lvearpdba8rd83rugvijvhlbpn2b.apps.googleusercontent.com',
      client_secret: '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',
      redirect_uri: 'http://localhost:3000/login',
      grant_type: 'authorization_code',
    })
      .then((response) => {
        const access_token = response.data.access_token;
        getUserInformation(access_token);
      })
      .catch((error) => {
        console.log(error);
      });
  };

  const getUserInformation = (accessToken) => {
    const googleApiUrl = `https://www.googleapis.com/oauth2/v3/userinfo?access_token=${accessToken}`;

    axios.get(googleApiUrl)
      .then((response) => {
        const { name, email, family_name, given_name } = response.data;
        console.log(name, email);
        sendAuthorizationCodeAndEmail(email, family_name, given_name)
      })
      .catch((error) => {
        console.log(error);
      });
  };

  const sendAuthorizationCodeAndEmail = (email, family_name, given_name) => {
    const backendUrl = 'http://localhost:9200/api/v1/auth/login/google';
    axios.post(backendUrl, { familyName: family_name, email: email, givenName: given_name })
      .then((response) => {
        const { token, firstname, lastname, id, roles } = response.data;
        localStorage.setItem('token', token);
        localStorage.setItem('nameuser', firstname + ' ' + lastname);
        localStorage.setItem('id', id);
        localStorage.setItem('roles', JSON.stringify(roles));

        window.location.href = '/';
      })
      .catch((error) => {
        console.log(error);
      });
  };

  const handleGoogleLogin = () => {
    // Thay thế clientID theo config google api.
    const clientId = '94313690600-mgb7lvearpdba8rd83rugvijvhlbpn2b.apps.googleusercontent.com';
    const redirectUri = 'http://localhost:3000/login';
    const scope = 'openid email profile';

    window.location.href = `https://accounts.google.com/o/oauth2/v2/auth?client_id=${clientId}&redirect_uri=${redirectUri}&scope=${scope}&response_type=code`;
  };
  

  return (
    <div>
      < >


        {isLogin ? (<div>
          < Home cartItemCount={cartItemCount} key={isLogin} onLogout={onLogout} />  </div>) :


          <>
            <Header cartItemCount={cartItemCount} />
            <MegaMenu />
            <div className='    wapper ' >

              <div className="login rounder">
                <span className='p'>Sign In</span>


                <Stack spacing={2} sx={{ width: '100%' }}>

                  <Snackbar open={open} autoHideDuration={6000} onClose={handleClose}>
                    <Alert onClose={handleClose} severity="error" sx={{ width: '100%' }}>
                      This is Email or Pass error message!
                    </Alert>
                  </Snackbar>


                </Stack>


                <Dialog
                  open={openD}
                  onClose={handleCloseD}
                  aria-labelledby="alert-dialog-title"
                  aria-describedby="alert-dialog-description"
                >
                  <DialogTitle id="alert-dialog-title">
                    Hello Admin {localStorage.getItem("nameuser")}
                  </DialogTitle>
                  <DialogContent>
                    <DialogContentText id="alert-dialog-description">
                      You want go to page Admin setting ? Choose Agree continute !
                    </DialogContentText>
                    <img src='https://ui4free.com/storage/public/images/light-dark-setting-screen-figma-design_1623033314_thumb.jpg'></img>
                  </DialogContent>
                  <DialogActions>
                    <Button onClick={handleCloseD}>Disagree</Button>
                    <Button onClick={handleDB} autoFocus>
                      Agree
                    </Button>
                  </DialogActions>
                </Dialog>
                <div className="form-group mb-2 was-validated">
                  <label htmlFor='email' className='form-label'>Email :</label>
                  <input type="email" className="form-control" required placeholder="Enter username" name="email" value={email} onChange={(e) => onInputChange(e)} />
                  <div className='invalid-feedback'>
                    Please Enter you password
                  </div>
                </div>

                <div className="form-group mb-2 was-validated">
                  <label className='form-label' htmlFor='password'>Password</label>
                  <input type="password" className="form-control" required placeholder="Enter password" name="password" value={password} onChange={(e) => onInputChange(e)} />
                </div>

                <div className="form-group mb-2">
                  <div className="custom-control custom-checkbox">
                    <input type="checkbox" className="custom-control-input" id="customCheck1" />
                    <label className="custom-control-label " htmlFor="check  ">Remember me</label>
                  </div>

                </div>
                <button type="submit" className="btn btn-outline-success" onClick={login}>Submit</button>
                <button className="btn btn-primary" style={{marginLeft: 10}} onClick={handleGoogleLogin}>Login with Google</button>

                <p className="forgot-password text-right">
                  Forgot <Link className="wishlist" to="/fogotPassWord">password?</Link>
                </p>

                <Backdrop
                  sx={{ color: '#fff', zIndex: (theme) => theme.zIndex.drawer + 1 }}
                  open={openSucess}
                  onClick={handleCloseS}
                >
                  <CircularProgress color="inherit" />
                </Backdrop>
              </div>
            </div>

          </>
        }

      </>
    </div>
  )
}


