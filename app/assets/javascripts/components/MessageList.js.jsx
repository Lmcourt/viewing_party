class MessageList extends React.Component {
  render(){
    return <div className="row" id="chat-box" class='fixed-bottom'>
      <ul class='list-group'>
        { this.messagesList() }
      </ul>
    </div>
  }

  messagesList() {
    const { messages } = this.props;

    if (messages) {
      return messages.map((message, index) =>
        <div className="col-sm-12" key={ index }>
          <li className="message-text" class='list-group-item'>
            <span className="text-muted"> { message.user_email } at { message.written_at } says</span>
            <br/>
            { message.body }
          </li>
          <br/>
        </div>
      );
    }
  }
}
