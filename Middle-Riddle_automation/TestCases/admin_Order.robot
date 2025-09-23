*** Settings ***
Resource    ../Resources/Library_resource.resource

*** Test Cases ***
Verify after login admin can see the order page
    [Tags]    order_page
    commonKeyword.Login to Middle Riddle    admin    V9kT2m!Qe7Zp@4Lb
    Wait Until Location Contains    /admin/orders
    Location Should Contain    /admin/orders
    Page Should Contain    MIDDLE RIDDLE Admin
    Page Should Contain    admin
    Element Should Be Visible  //button[@data-slot='button']//span[contains(text(),'ออกจากระบบ')] 
    Page Should Contain    จัดการคำสั่งซื้อ
    Page Should Contain    จัดการคำสั่งซื้อทั้งหมดในระบบ
    Element Should Be Visible  //button[@data-slot='button']//span[contains(text(),'รายงานออเดอร์')]
    Element Should Be Visible  //button[@data-slot='button']//span[contains(text(),'รายงานจัดส่งสินค้า')]
    Element Should Be Visible    //input[@placeholder='ค้นหาหมายเลขคำสั่งซื้อ...']
    Click Button    //button[@data-slot='button'][contains(text(),'ทั้งหมด')] 
    Wait Until Element Is Visible    //div[@role='menuitem' and contains(text(),'ทั้งหมด')]
    Click Button    //div[@role='menuitem' and contains(text(),'ทั้งหมด')]



    