class MessageList extends React.Component {
  render(){
    return <div className="row" id="chat-box">
      { this.messagesList() }
      </div>
  }

  messagesList() {
    const { messages } = this.props;

    if (messages) {
      return messages.map((message, index) =>
        <div className="col-sm-12" key={ index }>
          <p className="message-text">
            <span className="text-muted"> { message.user_email } at { message.written_at } says</span>
            <br/>
            { message.body }
          </p>
        </div>
      );
    }
  }
}
