function _toConsumableArray(e){if(Array.isArray(e)){for(var t=0,n=Array(e.length);t<e.length;t++)n[t]=e[t];return n}return Array.from(e)}function _classCallCheck(e,t){if(!(e instanceof t))throw new TypeError("Cannot call a class as a function")}function _inherits(e,t){if("function"!=typeof t&&null!==t)throw new TypeError("Super expression must either be null or a function, not "+typeof t);e.prototype=Object.create(t&&t.prototype,{constructor:{value:e,enumerable:!1,writable:!0,configurable:!0}}),t&&(Object.setPrototypeOf?Object.setPrototypeOf(e,t):e.__proto__=t)}function _classCallCheck(e,t){if(!(e instanceof t))throw new TypeError("Cannot call a class as a function")}function _inherits(e,t){if("function"!=typeof t&&null!==t)throw new TypeError("Super expression must either be null or a function, not "+typeof t);e.prototype=Object.create(t&&t.prototype,{constructor:{value:e,enumerable:!1,writable:!0,configurable:!0}}),t&&(Object.setPrototypeOf?Object.setPrototypeOf(e,t):e.__proto__=t)}!function(a,u){var o="undefined"!=typeof u.jQuery&&u.jQuery;u.ReactRailsUJS={CLASS_NAME_ATTR:"data-react-class",PROPS_ATTR:"data-react-props",findDOMNodes:function(e){var t,n;switch(typeof e){case"undefined":t="["+u.ReactRailsUJS.CLASS_NAME_ATTR+"]",n=a;break;case"object":t="["+u.ReactRailsUJS.CLASS_NAME_ATTR+"]",n=e;break;case"string":t=e+"["+u.ReactRailsUJS.CLASS_NAME_ATTR+"], "+e+" ["+u.ReactRailsUJS.CLASS_NAME_ATTR+"]",n=a}return o?o(t,n):n.querySelectorAll(t)},getConstructor:function(e){var t;return(t=u[e])||(t=eval.call(u,e)),t&&t["default"]&&(t=t["default"]),t},mountComponents:function(e){for(var t=u.ReactRailsUJS.findDOMNodes(e),n=0;n<t.length;++n){var a=t[n],o=a.getAttribute(u.ReactRailsUJS.CLASS_NAME_ATTR),r=this.getConstructor(o),s=a.getAttribute(u.ReactRailsUJS.PROPS_ATTR),c=s&&JSON.parse(s);if(void 0===r){var i="Cannot find component: '"+o+"'";throw console&&console.log&&console.log("%c[react-rails] %c"+i+" for element","font-weight: bold","",a),new Error(i+". Make sure your component is globally available to render.")}ReactDOM.render(React.createElement(r,c),a)}},unmountComponents:function(e){for(var t=u.ReactRailsUJS.findDOMNodes(e),n=0;n<t.length;++n){var a=t[n];ReactDOM.unmountComponentAtNode(a)}}}}(document,window),function(e,t){t.ReactRailsUJS.Turbolinks={setup:function(){ReactRailsUJS.handleEvent("turbolinks:load",function(){t.ReactRailsUJS.mountComponents()}),ReactRailsUJS.handleEvent("turbolinks:before-render",function(){t.ReactRailsUJS.unmountComponents()})}}}(document,window),function(e,t){t.ReactRailsUJS.TurbolinksClassic={setup:function(){ReactRailsUJS.handleEvent(Turbolinks.EVENTS.CHANGE,function(){t.ReactRailsUJS.mountComponents()}),ReactRailsUJS.handleEvent(Turbolinks.EVENTS.BEFORE_UNLOAD,function(){t.ReactRailsUJS.unmountComponents()})}}}(document,window),function(e,t){t.ReactRailsUJS.TurbolinksClassicDeprecated={setup:function(){Turbolinks.pagesCached(0),ReactRailsUJS.handleEvent("page:change",function(){t.ReactRailsUJS.mountComponents()}),ReactRailsUJS.handleEvent("page:receive",function(){t.ReactRailsUJS.unmountComponents()})}}}(document,window),function(e,t){t.ReactRailsUJS.pjax={setup:function(){ReactRailsUJS.handleEvent("ready",function(){t.ReactRailsUJS.mountComponents()}),ReactRailsUJS.handleEvent("pjax:end",function(e){t.ReactRailsUJS.mountComponents(e.target)}),ReactRailsUJS.handleEvent("pjax:beforeReplace",function(e){t.ReactRailsUJS.unmountComponents(e.target)})}}}(document,window),function(e,t){var n="undefined"!=typeof t.jQuery&&t.jQuery;t.ReactRailsUJS.Native={setup:function(){n?n(function(){t.ReactRailsUJS.mountComponents()}):"addEventListener"in t?e.addEventListener("DOMContentLoaded",function(){t.ReactRailsUJS.mountComponents()}):t.attachEvent("onload",function(){t.ReactRailsUJS.mountComponents()})}}}(document,window),function(n,e){var a="undefined"!=typeof e.jQuery&&e.jQuery;ReactRailsUJS.handleEvent=a?function(e,t){a(n).on(e,t)}:function(e,t){n.addEventListener(e,t)},"undefined"!=typeof Turbolinks&&Turbolinks.supported?"undefined"!=typeof Turbolinks.EVENTS?ReactRailsUJS.TurbolinksClassic.setup():"undefined"!=typeof Turbolinks.controller?ReactRailsUJS.Turbolinks.setup():ReactRailsUJS.TurbolinksClassicDeprecated.setup():a&&"function"==typeof a.pjax?ReactRailsUJS.pjax.setup():ReactRailsUJS.Native.setup()}(document,window);var _createClass=function(){function a(e,t){for(var n=0;n<t.length;n++){var a=t[n];a.enumerable=a.enumerable||!1,a.configurable=!0,"value"in a&&(a.writable=!0),Object.defineProperty(e,a.key,a)}}return function(e,t,n){return t&&a(e.prototype,t),n&&a(e,n),e}}(),_get=function get(e,t,n){for(var a=!0;a;){var o=e,r=t,s=n;a=!1,null===o&&(o=Function.prototype);var c=Object.getOwnPropertyDescriptor(o,r);if(c!==undefined){if("value"in c)return c.value;var i=c.get;return i===undefined?undefined:i.call(s)}var u=Object.getPrototypeOf(o);if(null===u)return undefined;e=u,t=r,n=s,a=!0,c=u=undefined}},ChatRoom=function(e){function t(e){_classCallCheck(this,t),_get(Object.getPrototypeOf(t.prototype),"constructor",this).call(this,e),this.state={messages:e.chat_room.messages,errors:[]}}return _inherits(t,e),_createClass(t,[{key:"componentDidMount",value:function n(){var t=this;App.chatChannel=App.cable.subscriptions.create({channel:"ChatRoomsChannel",chat_room_id:this.props.chat_room.id},{received:function(e){t.newMessage(e.message)}})}},{key:"componentWillUnmout",value:function a(){App.chatChannel.unsubscribe()}},{key:"newMessage",value:function o(e){var t=this.state.messages,n=[].concat(_toConsumableArray(t));n.push(e),this.setState({messages:n,errors:[]})}},{key:"form",value:function r(){return React.createElement("div",{className:"col-sm-12"},React.createElement("form",{className:"form-inline",onSubmit:this.postMessage.bind(this)},React.createElement("div",{className:"form-group col-sm-11"},React.createElement("input",{ref:"body",type:"text",className:"form-control",placeholder:"Text..."})),React.createElement("div",{className:"form-group col-sm-1"},React.createElement("button",{type:"submit",className:"btn btn-outline-primary btn-sm"},"Send"))))}},{key:"postMessage",value:function s(e){e.preventDefault(),App.chatChannel.perform("send_message",{chat_room_id:this.props.chat_room.id,body:this.refs.body.value}),this.refs.body.value=""}},{key:"render",value:function c(){var e=this.state.messages;return React.createElement("div",{className:"row"},React.createElement("div",{className:"col-sm-12"},React.createElement(MessageList,{messages:e})),this.form())}}]),t}(React.Component),MessageList=(_createClass=function(){function a(e,t){for(var n=0;n<t.length;n++){var a=t[n];a.enumerable=a.enumerable||!1,a.configurable=!0,"value"in a&&(a.writable=!0),Object.defineProperty(e,a.key,a)}}return function(e,t,n){return t&&a(e.prototype,t),n&&a(e,n),e}}(),_get=function get(e,t,n){for(var a=!0;a;){var o=e,r=t,s=n;a=!1,null===o&&(o=Function.prototype);var c=Object.getOwnPropertyDescriptor(o,r);if(c!==undefined){if("value"in c)return c.value;var i=c.get;return i===undefined?undefined:i.call(s)}var u=Object.getPrototypeOf(o);if(null===u)return undefined;e=u,t=r,n=s,a=!0,c=u=undefined}},function(e){function t(){_classCallCheck(this,t),_get(Object.getPrototypeOf(t.prototype),"constructor",this).apply(this,arguments)}return _inherits(t,e),_createClass(t,[{key:"render",value:function n(){return React.createElement("div",{className:"row",id:"chat-box"},this.messagesList())}},{key:"messagesList",value:function a(){var e=this.props.messages;if(e)return e.map(function(e,t){return React.createElement("div",{className:"col-sm-12",key:t},React.createElement("p",{className:"message-text"},React.createElement("span",{className:"text-muted"}," ",e.user_email," at ",e.written_at," says"),React.createElement("br",null),e.body))})}}]),t}(React.Component));