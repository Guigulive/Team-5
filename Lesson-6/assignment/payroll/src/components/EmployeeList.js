import React, { Component } from 'react'
import { Table, Button, Modal, Form, InputNumber, Input, message, Popconfirm } from 'antd';

import EditableCell from './EditableCell';

const FormItem = Form.Item;

const columns = [{
  title: '地址',
  dataIndex: 'address',
  key: 'address',
}, {
  title: '薪水',
  dataIndex: 'salary',
  key: 'salary',
}, {
  title: '上次支付',
  dataIndex: 'lastPaidDay',
  key: 'lastPaidDay',
}, {
  title: '操作',
  dataIndex: '',
  key: 'action'
}];

class EmployeeList extends Component {
  constructor(props) {
    super(props);

    this.state = {
      loading: true,
      employees: [],
      showModal: false
    };

    columns[1].render = (text, record) => (
      <EditableCell
        value={text}
        onChange={ this.updateEmployee.bind(this, record.address) }
      />
    );

    columns[3].render = (text, record) => (
      <Popconfirm title="你确定删除吗?" onConfirm={() => this.removeEmployee(record.address)}>
        <a href="#">Delete</a>
      </Popconfirm>
    );
  }

  componentDidMount() {
    const { payroll, account, web3 } = this.props;
    payroll.checkInfo.call({
      from: account
    }).then((result) => {
      const employeeCount = result[2].toNumber();

      if (employeeCount === 0) {
        this.setState({loading: false});
        return;
      }

      this.loadEmployees(employeeCount);
    });

  }

  async loadEmployees(employeeCount) {
    const { payroll, web3 } = this.props;
    let employees = [];
    //遍历所有雇员，并获取相关属性
    for(let i=0; i < employeeCount; i++) {
      let result = await payroll.checkEmployee.call(i);
      let [ address, salary, lastPaidDay ] = result;

      employees.push({
        key: i,
        address: address,
        salary: web3.fromWei(salary).toNumber(),
        lastPaidDay: lastPaidDay.toNumber()
      });
    }

    this.setState({
      employees,
      loading: false
    });
  }

  // 新增雇员
  addEmployee = () => {
    const {payroll, account} = this.props;
    payroll.addEmployee(
      this.state.address,
      this.state.salary,
      {from: account, gas: 300000})
    .then(()=> {
      message.info("add employee succeed");
      this.setState({showModal: false});
    }, error => {
      alert("add employee failed");
      this.setState({showModal: false});
    });
  }

  // 更新雇员
  updateEmployee = (address, salary) => {
    const {payroll, account} = this.props;
    
    payroll.updateEmployee(
      address,
      salary,
      {from: account, gas: 300000})
    .then(()=> {
      message.info("update employee succeed");
      this.setState({showModal: false});
    }, error => {
      alert("update employee failed");
      this.setState({showModal: false});
    });
  }

  // 删除雇员
  removeEmployee = (employeeId) => {
    const {payroll, account} = this.props;

    payroll.removeEmployee(
      employeeId,
      {from: account, gas: 300000})
      .then(()=> {
        message.info("remove employee succeed");
        this.setState({showModal: false});
      }, error => {
        alert("remove employee failed");
        this.setState({showModal: false});
      })
  }

  renderModal() {
      return (
      <Modal
          title="增加员工"
          visible={this.state.showModal}
          onOk={this.addEmployee}
          onCancel={() => this.setState({showModal: false})}
      >
        <Form>
          <FormItem label="地址">
            <Input
              onChange={ev => this.setState({address: ev.target.value})}
            />
          </FormItem>

          <FormItem label="薪水">
            <InputNumber
              min={1}
              onChange={salary => this.setState({salary})}
            />
          </FormItem>
        </Form>
      </Modal>
    );

  }

  render() {
    const { loading, employees } = this.state;
    return (
      <div>
        <Button
          type="primary"
          onClick={() => this.setState({showModal: true})}
        >
          增加员工
        </Button>

        {this.renderModal()}

        <Table
          loading={loading}
          dataSource={employees}
          columns={columns}
        />
      </div>
    );
  }
}

export default EmployeeList
