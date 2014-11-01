
//**************************************************************
//
// List Indices
// ---------------------
// So, since BYOND does not support a lot of data structures and
// we need some tables in certain places, we're going to save 
// resources by using a ghetto 2-column table. Example below.
//
// Where it's used, this will be documented as DEFINE:val1,val2
//
//**************************************************************

#define DOG  1
#define CAT  2
#define OWL  3

////////////////////////////////////////////////////////////////

/var/global/list/animalData = list(
    "red" = 50
    "blue" = 10
    "green" = 5
    )

////////////////////////////////////////////////////////////////

/mob/verb/getDogData()
    usr << "Dog color is [getAnimalColor[DOG]]"
    usr << "Dog weight is [getAnimalWeight[DOG]]"
    return

/proc/getAnimalColor(animalType)
    return animalData[animalType]

/proc/getAnimalWeight(animalType)
    return animalData[animalData[animalType]]
