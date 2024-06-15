*** Settings***
Library     RequestsLibrary
Library     Collections


***Variables***
${base_url}     https://reqres.in/api/users


***Test Cases***
Create_User
    create session    mysession     ${base_url}
    ${body}=        Create dictionary       name=morpheus       job=leader
    ${response}=    Post On Session    mysession   /CREATE         data=${body}


    log to console      ${response.status_code}
    log to console      ${response.content}

    #Validation
     ${status_code}=     convert to string    ${response.status_code}         #membuat variable status code
    should be equal         ${status_code}      201     #memastikan status code response harus 201/Created

    ${response_body}        convert to string        ${response.content}
    should contain      ${response_body}        name
    should contain      ${response_body}        job
    should contain      ${response_body}        id
    should contain      ${response_body}        createdAt
    