import React, { Component } from 'react'
import { Card, Col, Row, Layout, Alert, Button } from 'antd';

import Common from './Common';

class Employee extends Component {
  constructor(props) {
    super(props);
    this.state = {
      balance: 0,
      salary: 0,
      lastPaidDate: ``,
    };
  }

  componentDidMount() {
    this.checkEmployee();
  }

  checkEmployee = () => {
    const { payroll, account, web3 } = this.props;
    payroll.employees.call(account, {
      from: account,
      gas: 1000000
    }).then((result) => {
      this.setState({
        salary: web3.fromWei(result[1].toNumber()),
        lastPaidDate: new Date(result[2].toNumber() * 1000)
      })
    })
  }

  getPaid = () => {
    const { payroll, account } = this.props;
    payroll.getPaid({
      from: account,
      gas: 1000000
    }).then((result) => {
        alert("Payment received successfully");
    })
  }

  renderContent() {
    const { salary, lastPaidDate, balance } = this.state;

    if (!salary || salary === '0') {
      return   <Alert message="你不是员工" type="error" showIcon />;
    }

    return (
      <div>
        <Row gutter={16}>
          <Col span={8}>
            <Card title="薪水">{salary} Ether</Card>
          </Col>
          <Col span={8}>
            <Card title="上次支付">{lastPaidDate.toString()}</Card>
          </Col>
          <Col span={8}>
            <Card title="帐号金额">{balance} Ether</Card>
          </Col>
        </Row>

        <Button
          type="primary"
          icon="bank"
          onClick={this.getPaid}
        >
          获得薪酬
        </Button>
      </div>
    );
  }

  render() {
    const { account, payroll, web3 } = this.props;

    return (
      <Layout style={{ padding: '0 24px', background: '#fff' }}>
        <Common account={account} payroll={payroll} web3={web3} />
        <h2>个人信息</h2>
        {this.renderContent()}
      </Layout >
    );
  }
}

export default Employee
