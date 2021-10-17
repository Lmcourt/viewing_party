class ChatRoom extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            messages: props.chat_room.message,
            errors: []
        };
    }

    componentDidMount() {
        App.chatChannel = App.cable.subscriptions.create({
            channel: "ChatRoomsChannel",
            chat_room_id: this.props.chat_room.id,
        }, {
            received: ({type, data}) => {
                switch (type) {
                    case "new_message":
                        this.newMessage(data);
                        break;
                    case "errors":
                        this.addErrors(data);
                        break;
                    default:
                        console.error({type, data})
                }
            }
        });
    }

    newMessage(message) {
        const { messages } = this.state;
        const msgs = [...messages];
        msgs.push(message);
        this.setState({messages: msgs, errors: []});
    }

    form() {
        return (
            <div className="col-sm-12">
            <form className="form-inline" onSubmit={ this.postMessage.bind(this) }>
                <div className="form-group col-sm-11">
                    <input ref="body" type="text" className="form-control" placeholder="Text..." />
                </div>
                <div className="form-group col-sm-1">
                    <button type="submit" className="btn btn-outline-primary btn=sm"></button>
                </div>
            </form>
            </div>
        )
    }

    postMessage(event) {
        event.preventDefault();
        App.chatChannel.perform("send_message", { chat_room_id: this.props.chat_room.id, body: this.refs.body.value});
        this.refs.body.value = "";
    }

    render() {
        const { messages } = this.state;

        return (
            <div className="row">
            <div className="col-sm-12">
            <MessageList messages={ messages } />
            </div>
            { this.form() }
            </div>
        )
    }
}
