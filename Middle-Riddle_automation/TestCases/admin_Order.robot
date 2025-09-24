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
    Click Element    //div[@role='menuitem' and contains(text(),'ทั้งหมด')]
    Page Should Contain    แสดง 
    Page Should Contain    จาก
    Page Should Contain    คำสั่งซื้อ
    Wait Until Element Is Visible    //h3[@class='font-kanit text-brand-medium-blue text-lg font-semibold']    
    Sleep    5s
    Page Should Contain    รายการคำสั่งซื้อ
    Page Should Contain    หมายเลข/วันที่	
    Page Should Contain    สินค้า
    Page Should Contain    ที่อยู่
    Page Should Contain    ประเทศ
    Page Should Contain    ยอดรวม
    Page Should Contain    การชำระเงิน
    Page Should Contain    สถานะ
    Page Should Contain    จัดการ
    Click Button   //button[@id='radix-_r_5t_']
    