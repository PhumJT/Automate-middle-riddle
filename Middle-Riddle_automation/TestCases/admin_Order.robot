*** Settings ***
Resource    ../Resources/Library_resource.resource

*** Test Cases ***
Verify after login admin can see the order page
    [Tags]    order_page
    commonKeyword.Login to Middle Riddle    admin    V9kT2m!Qe7Zp@4Lb
    Wait Until Location Contains    /admin/orders
    Location Should Contain    /admin/orders
    Wait Until Page Contains    MIDDLE RIDDLE Admin    10s
    Page Should Contain    MIDDLE RIDDLE Admin
    Page Should Contain    admin
    Element Should Be Visible  //button[@data-slot='button']//span[contains(text(),'ออกจากระบบ')] 
    Page Should Contain    จัดการคำสั่งซื้อ
    Page Should Contain    จัดการคำสั่งซื้อทั้งหมดในระบบ
    Element Should Be Visible  //button[@data-slot='button']//span[contains(text(),'รายงานออเดอร์')]
    Element Should Be Visible  //button[@data-slot='button']//span[contains(text(),'รายงานจัดส่งสินค้า')]
    Element Should Be Visible    //input[@placeholder='ค้นหาหมายเลขคำสั่งซื้อ...']
    Page Should Contain    แสดง 
    Page Should Contain    จาก
    Page Should Contain    คำสั่งซื้อ
Verify input text number order ทั้งหมด
    Press Keys    //input[@placeholder='ค้นหาหมายเลขคำสั่งซื้อ...']    702
    Set Selenium Speed    0.5s
    Press Keys    //input[@placeholder='ค้นหาหมายเลขคำสั่งซื้อ...']    BACKSPACE
    FOR    ${i}    IN RANGE    3
    Press Keys    //input[@placeholder='ค้นหาหมายเลขคำสั่งซื้อ...']    BACKSPACE
    END

    
Verify button ทั้งหมด 
    Click Button    //button[@data-slot='button'][contains(text(),'ทั้งหมด')] 
    Wait Until Element Is Visible    //div[@role='menuitem' and contains(text(),'ทั้งหมด')]    30s
    Click Element    //div[@role='menuitem' and contains(text(),'ทั้งหมด')]

Verify button รอดำเนินการ 
    Click Button    //button[@data-slot='button'][contains(text(),'ทั้งหมด')] 
    Wait Until Element Is Visible    //div[@role='menuitem' and contains(text(),'รอดำเนินการ')]    60s
    Click Element    //div[@role='menuitem' and contains(text(),'รอดำเนินการ')] 
Verify button ชำระแล้ว 
    Click Button    //button[@data-slot='button'][contains(text(),'รอดำเนินการ')] 
    Wait Until Element Is Visible    //div[@role='menuitem' and contains(text(),'ชำระแล้ว')]    30s
    Click Element    //div[@role='menuitem' and contains(text(),'ชำระแล้ว')] 
    Click Button    //button[@data-slot='button'][contains(text(),'ชำระแล้ว')] 
    Wait Until Element Is Visible    //div[@role='menuitem' and contains(text(),'ทั้งหมด')]    30s
    Click Element    //div[@role='menuitem' and contains(text(),'ทั้งหมด')]

    Wait Until Page Contains    รายการคำสั่งซื้อ    10s
    Page Should Contain    รายการคำสั่งซื้อ
    Page Should Contain    หมายเลข/วันที่	
    Page Should Contain    สินค้า
    Page Should Contain    ที่อยู่
    Page Should Contain    ประเทศ
    Page Should Contain    ยอดรวม
    Page Should Contain    การชำระเงิน
    Page Should Contain    สถานะ
    Page Should Contain    จัดการ
Verify button 3 จุด ดูรายละเอียด
    Click Button    (//button[@id='dropdown-menu-trigger'])[1]
    Wait Until Element Is Visible    //div[@role='menuitem'][contains(text(),'ดูรายละเอียด')]    30s
    Click Element    //div[@role='menuitem'][contains(text(),'ดูรายละเอียด')] 
    Page Should Contain    คำสั่งซื้อ
    Page Should Contain    ข้อมูลลูกค้า
    Page Should Contain    รายการสินค้า
    Page Should Contain    รหัส:
    Page Should Contain    ไซส์:
    Page Should Contain    สรุปการชำระเงิน
    Page Should Contain    ราคาสินค้า:
    Page Should Contain    ค่าจัดส่ง:
    Page Should Contain    ยอดรวมทั้งหมด:
    Page Should Contain    ยอดที่ต้องชำระ:
    Page Should Contain    ข้อมูลการจัดส่ง
    Page Should Contain    วิธีจัดส่ง:
    Page Should Contain    บริษัทขนส่ง:
    Page Should Contain    ประวัติการอัปเดต
    Page Should Contain    สร้างคำสั่งซื้อ:
    Page Should Contain    อัปเดตล่าสุด:
    Click Button    //button[@data-slot='dialog-close']
Verify button 3 จุด เปลี่ยนสถานะ
    Click Button    (//button[@id='dropdown-menu-trigger'])[1]
    Wait Until Element Is Visible    //div[@role='menuitem'][contains(text(),'เปลี่ยนสถานะ')]    10s
    Click Element    //div[@role='menuitem'][contains(text(),'เปลี่ยนสถานะ')] 
    Page Should Contain    เปลี่ยนสถานะคำสั่งซื้อ
    Page Should Contain    สถานะปัจจุบัน:
    Page Should Contain    เปลี่ยนเป็นสถานะ
    Page Should Contain    หมายเหตุ (ไม่บังคับ)
    Page Should Contain    เลือกสถานะใหม่
    Page Should Contain    ยกเลิก
    Click Button    //button[@data-slot='button'][contains(text(),'ยกเลิก')]
Verify เปลี่ยนสถานะทุกอัน
    [Tags]    Status_change
    Click Button    (//button[@id='dropdown-menu-trigger'])[1]
    Wait Until Element Is Visible    //div[@role='menuitem'][contains(text(),'เปลี่ยนสถานะ')]    10s
    Click Element    //div[@role='menuitem'][contains(text(),'เปลี่ยนสถานะ')] 
    Click Button    //button[@role='combobox']
    Wait Until Element Is Visible    //select[@aria-hidden='true']/option[@value='paid']    10s
    Click Element   //select[@aria-hidden='true']/option[contains(text(),'ชำระแล้ว')]
    Click Button    //button[@data-slot='button'][contains(text(),'เปลี่ยนเป็นชำระแล้ว')]