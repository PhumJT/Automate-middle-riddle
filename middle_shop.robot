*** Settings ***
Library   SeleniumLibrary
Library   BuiltIn 
*** Variables ***
${Web_Name}    https://middle-riddle-next-develop.up.railway.app/
${Browser}     Chrome
${Homepage}    //h2[contains(text(),'Featured Products')]
${Prod_Classic_tee}    (//button[@role='combobox'])[3]
${Select_Size_Classic_tee1}    //div[@data-slot='card-content']//div[@class='space-y-1']//h3[contains(text(),'MIDDLE RIDDLE CLASSIC TEE')]/parent::div/following-sibling::div/button/span[contains(text(),'Size 1')]
${Select_Size_Classic_tee2}    (//span[@class='flex w-full items-center justify-between'])[span[contains(text(),'Size 2')]]
${Quantity_count}    //button[@aria-label='เพิ่มจำนวน']
${Add_Classic_bth}    (//button[contains(text(),'Add to Cart')])[1]
${Cart_btn}    (//button[@data-slot='button'])[5]

*** Test Cases ***
Open website and Select Products
    Open web
    Select product and Add to cart
# Verify items in shopping cart
    # Click cart
*** Keywords ***
Open web
    Open Browser     ${Web_Name}    ${Browser}
    Maximize Browser Window
    Wait Until Element Is Visible    ${Homepage}
    Page Should Contain    Featured Products
Select product and Add to cart
    Scroll Element Into View    ${Prod_Classic_tee}
    Sleep    2s
    Click Button    ${Prod_Classic_tee}
    Wait Until Element Is Visible    ${Prod_Classic_tee}
    Sleep    2s
    Click Element    ${Select_Size_Classic_tee1} 
    Scroll Element Into View    ${Quantity_count}
    FOR    ${INDEX}    IN RANGE    1    5
        Click Button    ${Quantity_count}
    END
    Scroll Element Into View    ${Add_Classic_bth}
    Click Button    ${Add_Classic_bth}
    Sleep    2s
    ${cart} =    Evaluate    ${INDEX}+1
    Page Should Contain    Added to cart (${cart} pcs)
# Click cart
#     Click Button    ${Cart_btn}
#     Wait Until Page Contains    Shopping Cart 
#     Page Should Contain    Shopping Cart





