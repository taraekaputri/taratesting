*** Settings ***
Library    RequestsLibrary
Library    Collections


***Variables***
${base_url}     https://reqres.in/api/users/
${id_user}      2


***Test Cases***
Get_user_info
        create session      mysession     ${base_url}
        ${response}=        get request     mysession        https://reqres.in/api/users/${id_user} 
        log to console      ${response.status_code}
        log to console      ${response.content}
        log to console      ${response.headers}

        #Validations
        ${status_code}=     convert to string    ${response.status_code}         #membuat variable status code
        should be equal     ${status_code}        200                            #memastikan status code response harus 200/OK

        ${body}=            convert to string     ${response.content}
        should contain       ${body}     ${id_user}         #memastikan id user pada response sessuai dengan id user pada request
        should contain       ${body}     email              #memastikan isi response ada email
        should contain       ${body}     first_name         #memastikan isi response ada first_name
        should contain       ${body}     last_name          #memastikan isi response ada last_name
        should contain       ${body}     avatar             #memastikan isi response ada avatar
