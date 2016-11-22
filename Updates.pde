void switchView()
{
  


  switch(view)
  {
    case 0:
    {
      X = width/2;
      Y = -(height/2);
      scale = height*2;
      break;
    }//end case 0
    case 1:
    {
      X = width/2;
      Y = height/2;
      scale = height*0.8;
      break;
    }//end case 1
  }//end switch
  
}//switchView