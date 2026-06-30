import { LightningElement,track } from 'lwc';

export default class ZodiacSignMessenger extends LightningElement {
    userName;
    userBirthDate;
   @track userprofile={};
 zodiacTraits = [
{
    sign: 'Capricorn',
    from: '12-22',
    to: '01-19',
    emoji: '🐐',
    trait: "You're disciplined, practical, and quietly ambitious. You build success step by step."
},
{
    sign: 'Aquarius',
    from: '01-20',
    to: '02-18',
    emoji: '💧',
    trait: "You're a thinker, unique, and ahead of your time. You love innovation and freedom."
},
{
    sign: 'Pisces',
    from: '02-19',
    to: '03-20',
    emoji: '🐟',
    trait: "You're emotional, creative, and deeply intuitive. You feel everything strongly."
},
{
    sign: 'Aries',
    from: '03-21',
    to: '04-19',
    emoji: '🔥',
    trait: "You're bold, energetic, and a natural leader. You love challenges and action."
},
{
    sign: 'Taurus',
    from: '04-20',
    to: '05-20',
    emoji: '🐂',
    trait: "You're reliable, patient, and love comfort. You enjoy stability and luxury."
},
{
    sign: 'Gemini',
    from: '05-21',
    to: '06-20',
    emoji: '👯',
    trait: "You're curious, talkative, and adaptable. You love learning and communication."
},
{
    sign: 'Cancer',
    from: '06-21',
    to: '07-22',
    emoji: '🦀',
    trait: "You're caring, emotional, and protective. Family and feelings matter most to you."
},
{
    sign: 'Leo',
    from: '07-23',
    to: '08-22',
    emoji: '🦁',
    trait: "You're confident, dramatic, and love attention. You shine naturally."
},
{
    sign: 'Virgo',
    from: '08-23',
    to: '09-22',
    emoji: '🌾',
    trait: "You're analytical, organized, and detail-oriented. You aim for perfection."
},
{
    sign: 'Libra',
    from: '09-23',
    to: '10-22',
    emoji: '⚖️',
    trait: "You're balanced, charming, and love harmony. You avoid conflict."
},
{
    sign: 'Scorpio',
    from: '10-23',
    to: '11-21',
    emoji: '🦂',
    trait: "You're intense, passionate, and mysterious. You feel deeply and strongly."
},
{
    sign: 'Sagittarius',
    from: '11-22',
    to: '12-21',
    emoji: '🏹',
    trait: "You're adventurous, optimistic, and love freedom. You enjoy exploring life."
}
];

    handleNameChange(event){
 this.userName = event.target.value;
    }

    handleDateChange(event){
 this.userBirthDate = event.target.value;
    }

    handleSubmit(event){
   let userDob = new Date(this.userBirthDate);
        const userMonth = userDob.getMonth() + 1;
        const userDate = userDob.getDate();

        this.userprofile = this.checkZodiacSign(userMonth, userDate);
    }

   checkZodiacSign(userMonth, userDate) {
    for (let sign of this.zodiacTraits) {

        const [fromMonth, fromDay] = sign.from.split('-').map(Number);
        const [toMonth, toDay] = sign.to.split('-').map(Number);

        // Case 1: Normal range (same year)
        if (fromMonth < toMonth) {
            if (
                (userMonth === fromMonth && userDate >= fromDay) ||
                (userMonth === toMonth && userDate <= toDay) ||
                (userMonth > fromMonth && userMonth < toMonth)
            ) {
                return sign;
            }
        }

        // Case 2: Cross-year range (Capricorn)
        else {
            if (
                (userMonth === fromMonth && userDate >= fromDay) ||
                (userMonth === toMonth && userDate <= toDay) ||
                (userMonth > fromMonth || userMonth < toMonth)
            ) {
                return sign;
            }
        }
        
    }
return {
    sign: 'Unknown',
    emoji: '❓',
    trait: 'No zodiac sign found'
};
   }
}