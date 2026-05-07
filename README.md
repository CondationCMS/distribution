# CondationCMS

CondationCMS is a powerful and flexible content management system designed specifically for developers. 
It enables dynamic content creation and management through a modular architecture, powerful template engines, and flexible extensibility.

## Getting started

Getting started is realy simple

To use the manager application, create an .env file in the servers root folder and add something like
```
CMS_UI_SECRET=xnK82mcK7I9s_K3j-L8vK9L2m_N3o_P4q_R5s_T6u_V7w_X8y_Z9a_B0c_D1e
```

Add manager user
```
server.sh server add-user -r=manager-users -ro=manager <usename> <password> <mail>
```

The demo setup uses some modules, these modules have to been installed first:
```
server.sh module get-all
```

After all modules are installed, or if you don't use the demo set, start the server
```
server.sh server start
```

Navigate with your browser to http://localhost:2020

Or the manager under http://localhost:2020/manager/login

## Documentation

Detailed information on how to use and extend CondationCMS can be found in the official [documentation](https://condation.com/documentation).

## Changelog

[Changelog](CHANGELOG.md).
