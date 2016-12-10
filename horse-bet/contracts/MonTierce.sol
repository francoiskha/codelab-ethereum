pragma solidity ^0.4.0;
import "MonTierceLib.sol";
import "mortal.sol";
// Contrat de tierce en ligne

contract MonTierce is mortal{

  //INFO : il manque le mot clé pour définir une structure de donnée
  struct Course {
    uint idCourse;
    bool terminee;
    //les chevaux sont représentés par leur id
    uint32[] chevauxEnCourse;
  }

  uint public courseIDGenerator = 0;
  //INFO définir une structure de données type Map qui va associer un id à une course.
  // http://solidity.readthedocs.io/en/develop/types.html
  // INDICE : MAP...G
  mapping ( uint => Course ) courses;

  //event qui va permettre de debugger le contrat au cours de test et au cours de la vie du contrat.
  event InitialisationCourse(uint32[] chevauxAuDepart, uint idCourse, address owner);

  //INFO : on souhaite restreindre l'accès à cette fonction au propriètaire du contrat
  // on peut le faire via le modifier défini dans le fichier owned.sol
  // http://solidity.readthedocs.io/en/develop/types.html#mappings
  function initialiserCourse(uint32[] chevauxParticipants) onlyowner returns(uint) {

    //les struct Course du mapping courses sont déjà initialisés, il suffit juste de leur positionner des attributs
    //L'initialisation suivante ne fonctionne pas
    //Course course = Course({idCourse:courseIDGenerator, montantTotalMises:0,  terminee:false, chevauxEnCourse:chevauxParticipants });
    //car solidity ne gère pas l'initialisation de tableaux vides
    courses[courseIDGenerator].idCourse= courseIDGenerator;

    //INFO : on doit copier les chevauxParticipants dans le storage du contrat
    // => courses[courseIDGenerator].chevauxEnCourse
    // INDICE : on ne peut pas copier le tableau chevauxParticipants
    //directement de la callstack dans l'espace storage, le code est en spoiler dans le  README.md (branch step1-1)
    InitialisationCourse(chevauxParticipants, courses[courseIDGenerator].idCourse, owner);
    for(uint x= 0; x< chevauxParticipants.length; x++ ){
      courses[courseIDGenerator].chevauxEnCourse.push(chevauxParticipants[x]);
    }

    courseIDGenerator++ ;
    return courses[courseIDGenerator].idCourse;
  }
}
