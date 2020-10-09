#include<stdio.h>
void main()
{
	int start =1;
	int end = 20;
	for(start; start<end; start++)
	{
		if (start%3==0 && start%5==0)
                {
                        printf("akshay krish\n");
                }

		else if(start%3==0)
		{
			printf("akshay\n");
		}
		else if(start%5==0)
		{
			printf("krish\n");
		}
		else 
		{
			printf("%d \n",start);
			printf("\n");
		}
	}

}

