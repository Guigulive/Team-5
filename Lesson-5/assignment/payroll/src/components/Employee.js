import React, { Component } from 'react'
import { Card, Col, Row, Layout, Alert, message, Button } from 'antd';

import Common from './Common';

class Employer extends Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  componentDidMount() {
    this.checkEmployee();
  }

  checkEmployee = () => {
    // 获取属性变量
    const { account, payroll, web3 } = this.props;
    payroll.employees.call(
      account
    ).then(([id, salary, lastPaidDate]) => {
        // 设置薪水
        salary = web3.fromWei(salary).toNumber();
        // 设置上次支付日期
        lastPaidDate = lastPaidDate.toNumber();
        this.setState({salary, lastPaidDate});
    });
    web3.eth.getBalance(account, (err, balance) => {
      // 设置余额
      balance = web3.fromWei(balance).toNumber();
      this.setState({balance});
    });
  }

  getPaid = () => {
    const {payroll, account} = this.props;
    // 调用支付合约接口
    payroll.getPaid({
      from: account,
      gas: 1000000})
      .then((result) => {
        alert("get paid error");
      });
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
            <Card title="上次支付">{lastPaidDate}</Card>
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
          获得酬劳
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

export default Employer
