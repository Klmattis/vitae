///@title Vitae Smart Contract v1.0
///@author Keith Mattison

pragma solidity ^0.4.25;

// +---------------------+
// | Factory Definition |
// +---------------------+
contract VitaeFactory {
    Vitae[] public deployedVitaes;
    function createVitae() public {
        Vitae newVitae = new Vitae(msg.sender);
        deployedVitaes.push(newVitae);
    }
    
    function getDeployedVitaes() public view returns (Vitae[] memory) {
        return deployedVitaes;
    }
}

// +---------------------+
// | Contract Definition |
// +---------------------+
contract Vitae {
    
    struct ResumeInfo {         // Holds expository elements
        string _summary;        // Executive summary
        string _misc;           // Any miscellaneous information
    }
   
    struct ContactInfo {        // Holds contact information
        string _name;           // Full legal name
        string _mailingAddress; // Mailing address
        string _phoneNumber;    // Phone number
        string _emailAddress;   // Email address
        string _website;        // Website
    }
   
    struct Education {          // Holds education information
        string _school;         // School or university
        string _yearStart;      // Year education began
        string _yearEnd;        // Year graduated
        string _degree;         // Title of degree earned
    }
   
    struct WorkExperience {     // Holds work experience information
        string _employer;       // Company name
        string _yearStart;      // Year employment began
        string _yearEnd;        // Year employment ended
        string _title;          // Title of position
        string _duties;         // Duties of position
    }
   
    struct Skill {              // Holds skill information
        string _skill;          // Name of the skill
        string _comment;        // Comments (fluency, years practiced, etc.)
    }
   
    struct Certification {      // Holds certificate information
        string _cert;           // Name of the certification
        string _year;           // Year of acquisition
    }
    
    // Storage variable declarations
    address public          owner;          // Owner of the contract    (Automatically assigned in the constructor)
    ResumeInfo[] public     resumeInfo;     // Expository elements      (limit 1)
    ContactInfo[] public    contactInfo;    // Contact information      (limit 1)
    Education[] public      education;      // Education history        (no limit)
    WorkExperience[] public workExperience; // Work experience history  (no limit)
    Skill[] public          skills;         // Skill list               (no limit)
    Certification[] public  certifications; // Certification list       (no limit)

    // Modifier to ensure owner has sole right to call certain functions
    modifier restricted() {
        require(msg.sender == owner);
        _;
    }

    // Constructor class to set the owner of the contract
    constructor(address creator) public {
       owner = creator;
    }
   
    // Allow ability to delete entire contract
    function selfDestruct () public restricted {
        selfdestruct(owner);
    }
   
    // +--------------------+
    // | ResumeInfo Section |
    // +--------------------+
    function addResumeInfo(string memory summary, string memory misc) public restricted {
        // Only want one ResumeInfo entry, delete the existing entry if we try to push another
        // (This also means a separate remove function is not necessary)
        if(resumeInfo.length > 0) {
            delete resumeInfo[resumeInfo.length - 1];
            resumeInfo.length--;
        }
        resumeInfo.push(
            ResumeInfo(
                summary,
                misc
            )
        );
    }
   
    function getResumeInfoLength() public view returns(uint) {
        return resumeInfo.length;
    }

    function getResumeInfo(uint index) public view returns(string memory, string memory) {
        return (resumeInfo[index]._summary, resumeInfo[index]._misc);
    }
   
    // +-----------------------+
    // | ContactInfo Functions |
    // +-----------------------+
    function addContactInfo(string memory name, string memory mailingAddress, string memory phoneNumber, string memory emailAddress, string memory website) public restricted {
        // Only want one ContactInfo entry, delete the existing entry if we try to push another
        // (This also means a separate remove function is not necessary)
        if(contactInfo.length > 0) {
            delete contactInfo[contactInfo.length - 1];
            contactInfo.length--; 
        }
        contactInfo.push(
            ContactInfo(
                name,
                mailingAddress,
                phoneNumber,
                emailAddress,
                website
            )
        );
    }
   
    function getContactInfoLength() public view returns(uint) {
        return contactInfo.length;
    }

    function getContactInfo(uint index) public view returns(string memory, string memory, string memory, string memory, string memory) {
        return (contactInfo[index]._name, contactInfo[index]._mailingAddress, contactInfo[index]._phoneNumber, contactInfo[index]._emailAddress, contactInfo[index]._website);
    }
   
    // +---------------------+
    // | Education Functions |
    // +---------------------+
    function addEducation(string memory school, string memory yearStart, string memory yearEnd, string memory degree) public restricted {
        education.push(
            Education(
                school,
                yearStart,
                yearEnd,
                degree
            )
        );
    }
   
    function removeEducation(uint index) public restricted {
        education[index] = education[education.length - 1];
        delete education[education.length - 1];
        education.length--; 
    }
   
    function getEducationLength() public view returns(uint) {
        return education.length;
    }
   
    function getEducation(uint index) public view returns(string memory, string memory, string memory, string memory) {
        return (education[index]._school, education[index]._yearStart, education[index]._yearEnd, education[index]._degree);
    }
   
    // +--------------------------+
    // | WorkExperience Functions |
    // +--------------------------+
    function addWorkExperience(string memory employer, string memory yearStart, string memory yearEnd, string memory title, string memory duties) public restricted {
        workExperience.push(
            WorkExperience(
                employer,
                yearStart,
                yearEnd,
                title,
                duties
            )
        );
    }
   
    function removeWorkExperience(uint index) public restricted {
        workExperience[index] = workExperience[workExperience.length - 1];
        delete workExperience[workExperience.length - 1];
        workExperience.length--;
    }
   
    function getWorkExperienceLength() public view returns(uint) {
        return workExperience.length;
    }
   
    function getWorkExperience(uint index) public view returns(string memory, string memory, string memory, string memory, string memory) {
        return (workExperience[index]._employer, workExperience[index]._yearStart, workExperience[index]._yearEnd, workExperience[index]._title, workExperience[index]._duties);
    }
   
    // +------------------+
    // | Skills Functions |
    // +------------------+
    function addSkill(string memory skill, string memory comment) public restricted {
        skills.push(
            Skill(
                skill,
                comment
            ) 
        );
    }
   
    function removeSkill(uint index) public restricted {
        skills[index] = skills[skills.length - 1];
        delete skills[skills.length - 1];
        skills.length--;   
    }
   
    function getSkillsLength() public view returns(uint) {
        return skills.length;
    }
   
    function getSkill(uint index) public view returns(string memory, string memory) {
        return (skills[index]._skill, skills[index]._comment);
    }
   
    // +--------------------------+
    // | Certifications Functions |
    // +--------------------------+
    function addCertification(string memory certification, string memory year) public restricted {
        certifications.push(
            Certification(
                certification,
                year
            )   
        );
    }
   
    function removeCertification(uint index) public restricted {
        certifications[index] = certifications[certifications.length - 1];
        delete certifications[certifications.length - 1];
        certifications.length--;   
    }
   
    function getCertificatesLength() public view returns(uint) {
        return certifications.length;   
    }
   
    function getCertificate(uint index) public view returns(string memory, string memory) {
        return (certifications[index]._cert, certifications[index]._year);
    }
   
}