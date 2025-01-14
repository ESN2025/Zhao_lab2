#include<stdio.h>
#include<stdint.h>
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_stdio.h"
#include <unistd.h>

int main()
{
	uint8_t data[3]={0,0,0};
	
	while(1)
	{	
		for(unsigned int cpt=0;cpt<999;cpt++)
		{	
			if(cpt>=10)
			{	
				data[0] = cpt % 10;
				data[1] =  (cpt/10) % 10;
				data[2] = cpt /100;
				
			}else{data[0]=cpt;}
			
			IOWR_ALTERA_AVALON_PIO_DATA(SEG1_BASE,data[0]);
			IOWR_ALTERA_AVALON_PIO_DATA(SEG2_BASE,data[1]);
			IOWR_ALTERA_AVALON_PIO_DATA(SEG3_BASE,data[2]);
			usleep(200000);
			
		}
	}
	return 0;
}