import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tela/core/utils/app_text_style.dart';
import 'package:tela/features/games_and_story/model/storymodel.dart';
import '../../core/Functions/functions.dart';
import '../../core/utils/app_colors.dart';
import '../../core/widgets/custom_btn.dart';

class Stories extends StatelessWidget {
  const Stories ({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 12,bottom: 30),
                child: IconButton(icon: const Icon(Icons.arrow_back_ios,size: 40,),onPressed: (){
                  customRemoveNavigate(context);
                },),
              ),
        Container(
          width: 568,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColor.white1,

          ),
          child: Text(" choose your today’s topic",style: CustomTextStyles.Interstyle25.copyWith(fontSize: 20),textAlign: TextAlign.center,),
        ),
              Container(
                margin: const  EdgeInsets.only(top: 25,bottom: 40,left: 60,right: 30),
                width: 338,
                height: 51,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.white1,

                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 250),
                  child: Icon(Icons.search),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right:23 ,left: 29, ),
                width: 529,
                height: 450,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  color: AppColor.white2,

                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      storyContainer(context,"sleeping princess.","Once upon a time, there was a king living with his Queen's wife in a great palace, and the King hoped that God would have him. The King has made a great feast on the occasion of his beautiful daughter who has always waited for him, called all the good witches of the palace, and one of these witch witches was an evil witch. I told the King that his daughter would die from the beard of the deer, and when the girl grew up, she saw an old woman cheating on a deer, approached her, asked her to teach her the deer, so the girl grabbed the needle and stitched her, and she fell on the floor immediately. One of the good witches told the King that his daughter would not die, but she would sleep for a hundred years, that she would be awakened by a handsome prince, and that the witch had made all those in the palace sleep like a princess and woke up only if she woke up any 100 years later. A hundred years later, the Princess stayed asleep, until a handsome prince came to the palace, and all those in the palace were found. He went into the princess ' s room, kept her awake until she woke up. When the princess woke up, everyone in the palace woke up, the King, his wife and every man in the palace to wake up the princess." ),
                      storyContainer(context,"Patient lion and smart fox ","One day, the lion was sick and the bed rested, so all the animals went to him to check on him, except the fox, because he knew that whoever visited the lion would be his lunch, went to the lion and told him all the animals came to you, except the fox, refused to visit me, sir, and I'm going to kill him now, the lion allowed the fox to catch and bring it to him.I asked the fox lion: why didn't you come visit me?The fox said, Oh, sir, when I heard you were sick, I went to the doctor to consult him, and to find out what medicine is good for you and your mother, the doctor told me to go and tell your lion to hold the finger and skin and put it on him so he could stay warm then he'd heal, the finger didn't matter to my uncle.Follow the lion's advice, hold the rib and skin until his ears, while the hyena keeps screaming all his power, then wear the lion, skin the hyena and feel better!"),
                      storyContainer(context, "A fairy tale.", "That fat, good sheep is all our friend had, but the villagers had another look, where they wanted so much to eat that fat sheep, they all woke up and put a smart lead on getting hurt.Indeed, the villagers began to implement the plan and one of their neighbors went to it and told him, Hey, dear neighbor, didn't you know to do it after tomorrow, all I would recommend was to slaughter that sheep and feed the poor and the poor, on the balance of your own goodness, but an unbelievable scarf, leave him and move to the market.There was a start to believe his neighbor, where two more of his neighbors heard about the puppet, and what made a vengeance more acceptable to slaughter his sheep when he saw his neighbor telling his wife to bring him a knife to slaughter his poor and needy chicken to give it to the poor and the needy before the dowry was made to go to heaven.He fell in the trap, believed what he saw, decided to slaughter his only sheep tomorrow afternoon at the lake, and called on all his neighbours and friends to be present at the beach at that time.The promised day, he slaughtered his fat sheep, ended his skin and cut it alone and began to cook it without the help of one of the villagers who went to the lake to escape the heat of the atmosphere.The villagers had left their clothes at the lake, stirred up anger from their behavior, took their clothes, made them a fire drive, then called them after the sheep's over, and they all wanted to get out of the lake, as they fled their triumph."),
                      storyContainer(context,"man and frog.","There was a man in the city who claimed to have a frog in his stomach that suffered greatly and always went to doctors in the city and told them about it. Once examined, they had not found the alleged frog. He had gone to doctors, but it was futile, and he had suffered a lot of deterioration in his health and condition.One of the friends in the village heard him and went to him to tell him that there was an excellent doctor who was working on the treatment of a lot of intractable diseases and problems, and here the man was very happy.He went immediately to visit the doctor who told him about his condition.Having examined him well, the doctor found no frog in his stomach to tell him the truth, but he waited a little scared of the man ' s reaction, told everyone that he was a failed doctor and had already assured him that there was a frog and that he needed surgery, the man immediately agreed and asked his assistants to bring in a small frog, and once the man woke up with the anesthesia, he told him that he was unable to make sure that he was alive."),
                    ],
                  ),
                ),
              ),
        Padding(
          padding: const EdgeInsets.only(top: 22,left: 80),
          child: CustomBtn(text: "",width: 250,height:60,onPressed: (){
            customNavigate(context,'/HomePage');
          },).customButton(const Icon(Icons.home_outlined,size: 50,color: AppColor.black,)),),
            ],
          ),
        )
      ),
    );
  }




  Widget storyContainer(BuildContext context,String nameOfStory, String story)=> GestureDetector(
    onTap: (){
     GoRouter.of(context).push("/Story",extra: StoryModel(nameOfStory, story));
    },
    child: Padding(
      padding: const EdgeInsets.only(top: 10,bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              width:160,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(56),
                color: AppColor.white,
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        "assets/images/image6.png",)

                ),
              ),
                  ),
          Column(
            children: [
              SizedBox(
                width: 120,
                  child: Text(nameOfStory,style: CustomTextStyles.Merriweatherstyle40,overflow: TextOverflow.ellipsis,)),
              Container(
                width: 100,
                height:5,
                decoration: BoxDecoration(
                  color: AppColor.red,
                  borderRadius: BorderRadius.circular(50),
                ),
              )
            ],
          ),


        ],
      ),
    ),
  );
}
