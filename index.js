const { app, BrowserWindow } = require( 'electron' )

const createWindow = options => {
  return new Promise( ( resolve, _ ) => {
    app.on( 'ready', () => {
      const window = new BrowserWindow( {title: "首都圏電車遅延情報", width: 800, height: 600, resizable: false} )
      resolve( window )
    } )
  } )
}

createWindow()
  .then( window => {
    window.loadURL( `file://${__dirname}/index.html` )
  } )
