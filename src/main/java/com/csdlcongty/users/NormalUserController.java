package com.csdlcongty.users;

import com.csdlcongty.DBManager;

import javax.swing.*;
import javax.swing.border.Border;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.SQLException;

public class NormalUserController extends JFrame implements ActionListener {
    private final DBManager dbc;
    private final JFrame father;

    private JSplitPane mainSplitPane;

    private JPanel leftPanel;
    private JPanel rightPanel;

    public NormalUserController(String username, String password, JFrame father)
            throws ClassNotFoundException, SQLException {

        this.dbc = new DBManager(username, password);
        this.father = father;
        this.initComponents();
    }

    private void initComponents() {
        // Set window properties
        this.setTitle("Dashboard");
        this.setSize(1600, 900);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setLocationRelativeTo(null);
        this.setResizable(false);

        this.mainSplitPane = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT);

        // Create left panel
        this.leftPanel = new JPanel(new GridBagLayout());

        GridBagConstraints constraints = new GridBagConstraints();
        constraints.insets = new Insets(10, 10, 10, 10);
        constraints.anchor = GridBagConstraints.WEST;

        // Group 1 (Left column)
        JPanel group1Panel = new JPanel(new GridBagLayout());
        JLabel group1Label = new JLabel("Phòng ban và đề án");
        JButton showDepartmentInfoButton = new JButton("Xem thông tin các phòng ban");
        JButton modifyDepartmentButton = new JButton("Thay đổi thông tin các Phòng ban");
        JButton showSchemeInfoButton = new JButton("Xem các đề án hiện có");
        JButton modifySchemeButton = new JButton("Thay đổi các đề án");
        applyLineBorder(group1Panel);
        constraints.gridx = 0;
        constraints.gridy = 0;
        group1Panel.add(group1Label, constraints);
        constraints.gridy++;
        group1Panel.add(showDepartmentInfoButton, constraints);
        constraints.gridy++;
        group1Panel.add(modifyDepartmentButton, constraints);
        constraints.gridy++;
        group1Panel.add(showSchemeInfoButton, constraints);
        constraints.gridy++;
        group1Panel.add(modifySchemeButton, constraints);

        // Group 2 (Right column)
        JPanel group2Panel = new JPanel(new GridBagLayout());
        JLabel group2Label = new JLabel("Phân công");
        JButton showAssignmentInfoButton = new JButton("Xem phân công trên các đề án");
        JButton modifyAssignmentButton = new JButton("Cập nhật phân công");
        applyLineBorder(group2Panel);
        constraints.gridx = 1;
        constraints.gridy = 0;
        group2Panel.add(group2Label, constraints);
        constraints.gridy++;
        group2Panel.add(showAssignmentInfoButton, constraints);
        constraints.gridy++;
        group2Panel.add(modifyAssignmentButton, constraints);

        // Group 3 (Left column)
        JPanel group3Panel = new JPanel(new GridBagLayout());
        JLabel group3Label = new JLabel("Quản lí nhân sự");
        JButton insertNewEmployeeButton = new JButton("Thêm nhân viên mới");
        JButton updateEmployeeInfoButton = new JButton("Cập nhật thông tin nhân viên");
        applyLineBorder(group3Panel);
        constraints.gridx = 0;
        constraints.gridy = 0;
        group3Panel.add(group3Label, constraints);
        constraints.gridy++;
        JButton showRelevantInfoButton = new JButton("Xem thông tin các Nhân viên đang quản lí");
        group3Panel.add(showRelevantInfoButton, constraints);
        constraints.gridy++;
        group3Panel.add(insertNewEmployeeButton, constraints);
        constraints.gridy++;
        group3Panel.add(updateEmployeeInfoButton, constraints);

        // Group 4 (Right column)
        JPanel group4Panel = new JPanel(new GridBagLayout());
        JLabel group4Label = new JLabel("Lương và phụ cấp");
        JButton showSalaryAndAllowanceButton = new JButton("Xem Lương và Phụ cấp");
        JButton updateSalaryAndAllowanceButton = new JButton("Cập nhật Lương và Phụ cấp");
        applyLineBorder(group4Panel);
        constraints.gridx = 1;
        constraints.gridy = 0;
        group4Panel.add(group4Label, constraints);
        constraints.gridy++;
        group4Panel.add(showSalaryAndAllowanceButton, constraints);
        constraints.gridy++;
        group4Panel.add(updateSalaryAndAllowanceButton, constraints);

        // Group 5 (Left column)
        JPanel group5Panel = new JPanel(new GridBagLayout());
        JLabel group5Label = new JLabel("Cá nhân hóa");
        applyLineBorder(group5Panel);
        constraints.gridx = 0;
        constraints.gridy = 0;
        group5Panel.add(group5Label, constraints);
        constraints.gridy++;
        JButton showAdminMessagesButton = new JButton("Xem tin nhắn từ người quản trị");
        group5Panel.add(showAdminMessagesButton, constraints);
        constraints.gridy++;
        JButton updatePersonalInfoButton = new JButton("Cập nhật thông tin cá nhân");
        group5Panel.add(updatePersonalInfoButton, constraints);

        // Group 6 (Right column)
        JPanel group6Panel = new JPanel(new GridBagLayout());
        JLabel group6Label = new JLabel("Quản lí khóa");
        applyLineBorder(group6Panel);
        constraints.gridx = 1;
        constraints.gridy = 0;
        group6Panel.add(group6Label, constraints);
        JButton changeSecretKeyButton = new JButton("Đổi khóa bí mật mới");
        JButton forgetSecretKeyButton = new JButton("Quên khóa bí mật?");
        constraints.gridy++;
        group6Panel.add(changeSecretKeyButton, constraints);
        constraints.gridy++;
        group6Panel.add(forgetSecretKeyButton, constraints);

        // Add groups to the left panel
        constraints.gridx = 0;
        constraints.gridy = 0;
        this.leftPanel.add(group1Panel, constraints);
        constraints.gridy++;
        this.leftPanel.add(group3Panel, constraints);
        constraints.gridy++;
        this.leftPanel.add(group5Panel, constraints);

        // Add groups to the right panel
        constraints.gridx = 1;
        constraints.gridy = 0;
        this.leftPanel.add(group2Panel, constraints);
        constraints.gridy++;
        this.leftPanel.add(group4Panel, constraints);
        constraints.gridy++;
        this.leftPanel.add(group6Panel, constraints);

        // Add a logout button
        JButton logoutButton = new JButton("Đăng xuất");
        logoutButton.addActionListener(this);
        constraints.gridx = 0;
        constraints.gridy++;
        constraints.gridwidth = 2;
        constraints.anchor = GridBagConstraints.CENTER;
        this.leftPanel.add(logoutButton, constraints);

        // create right panel
        this.rightPanel = new JPanel();

        JSplitPane subRightSplits = new JSplitPane(JSplitPane.VERTICAL_SPLIT);
        JPanel upperPanel = new JPanel(new GridBagLayout());

        // Employee data fields
        JTextField luongField = new JTextField(50);
        JTextField phucapField = new JTextField(50);
        JTextField manvField = new JTextField(10);
        JTextField tennvField = new JTextField(35);
        JTextField phaiField = new JTextField(10);
        JTextField ngaysinhField = new JTextField(10);
        JTextField diachiField = new JTextField(50);
        JTextField sodtField = new JTextField(20);
        JTextField manqlField = new JTextField(10);
        JTextField phgField = new JTextField(10);
        JTextField vaitroField = new JTextField(20);

        constraints = new GridBagConstraints();
        constraints.insets = new Insets(10, 10, 10, 10);
        constraints.anchor = GridBagConstraints.WEST;

        constraints.gridx = 1;
        constraints.gridy = 0;
        upperPanel.add(new JLabel("Mã số"), constraints);
        constraints.gridx++;
        upperPanel.add(manvField, constraints);

        constraints.gridy++;
        constraints.gridx = 1;
        upperPanel.add(new JLabel("Họ tên"), constraints);
        constraints.gridx++;
        upperPanel.add(tennvField, constraints);

        constraints.gridx = 1;
        constraints.gridy++;
        upperPanel.add(new JLabel("Ngày sinh"), constraints);
        constraints.gridx++;
        constraints.gridwidth = 2;
        upperPanel.add(ngaysinhField, constraints);

        constraints.gridwidth = 1;
        constraints.gridx++;
        upperPanel.add(new JLabel("Giới tính"), constraints);
        constraints.gridx++;
        upperPanel.add(phaiField, constraints);

        constraints.gridx = 1;
        constraints.gridy++;
        upperPanel.add(new JLabel("Chức vụ"), constraints);
        constraints.gridx++;
        upperPanel.add(vaitroField, constraints);

        constraints.gridx = 1;
        constraints.gridy++;
        upperPanel.add(new JLabel("Địa chỉ"), constraints);
        constraints.gridx++;
        upperPanel.add(diachiField, constraints);

        constraints.gridx = 1;
        constraints.gridy++;
        upperPanel.add(new JLabel("Số điện thoại"), constraints);
        constraints.gridx++;
        upperPanel.add(sodtField, constraints);

        constraints.gridx = 1;
        constraints.gridy++;
        upperPanel.add(new JLabel("Mã phòng ban"), constraints);
        constraints.gridx++;
        upperPanel.add(phgField, constraints);

        constraints.gridx = 1;
        constraints.gridy++;
        upperPanel.add(new JLabel("Mã người quản lí"), constraints);
        constraints.gridx++;
        upperPanel.add(manqlField, constraints);

        constraints.gridx = 1;
        constraints.gridy++;
        upperPanel.add(new JLabel("Lương"), constraints);
        constraints.gridx++;
        upperPanel.add(luongField, constraints);

        constraints.gridx = 1;
        constraints.gridy++;
        upperPanel.add(new JLabel("Phụ cấp"), constraints);
        constraints.gridx++;
        upperPanel.add(phucapField, constraints);

        subRightSplits.setTopComponent(upperPanel);

        this.rightPanel.add(subRightSplits);

        this.mainSplitPane.setLeftComponent(this.leftPanel);
        this.mainSplitPane.setRightComponent(this.rightPanel);

        this.add(this.mainSplitPane);
        this.setVisible(true);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        JButton button = (JButton) e.getSource();
        String command = button.getText();

        if ("Đăng xuất".equals(command)) {
            father.setVisible(true); // Display the father frame
            this.dispose(); // Dispose the current frame
        }
    }

    private void applyLineBorder(JPanel panel) {
        Border lineBorder = BorderFactory.createLineBorder(Color.BLACK);
        panel.setBorder(lineBorder);
    }
}
