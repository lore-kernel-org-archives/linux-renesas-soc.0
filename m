Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:54896 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbeKETKH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Nov 2018 14:10:07 -0500
Subject: Re: [PATCH] thermal: rcar_gen3_thermal: Fix does not have interrupts
 counting
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        wsa@sang-engineering.com, kuninori.morimoto.gx@renesas.com,
        yoshihiro.shimoda.uh@renesas.com, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, cv-dong@jinso.co.jp
References: <1540890601-20126-1-git-send-email-na-hoan@jinso.co.jp>
 <20181102093156.GB22306@bigcity.dyn.berto.se>
From: Hoan <na-hoan@jinso.co.jp>
Message-ID: <d2b189c4-55fd-6fff-195f-32f87aab33d3@jinso.co.jp>
Date: Mon, 5 Nov 2018 18:51:10 +0900
MIME-Version: 1.0
In-Reply-To: <20181102093156.GB22306@bigcity.dyn.berto.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Dear Niklas-san

On 2018/11/02 18:31, Niklas Söderlund wrote:
> Hi Hoan-san,
>
> Thanks for your patch.
>
> On 2018-10-30 18:10:01 +0900, Nguyen An Hoan wrote:
>> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
>>
>> This patch fixes thermal interrupts that did not happen when temprature changed.
>> Add the function rcar_gen3_thermal_update_threshold(), this function is used to
>> calculate the value written to the threshold registers REG_GEN3_IRQTEMP1 and
>> REG_GEN3_IRQTEMP2.
> Is it really a error if the IRQ don't happen and the thermal framework
> use the .set_trip() callback to move the window due to the polling
> instead of a IRQ due to a rapid thermal increase? I think not. I do not
> like this patch but I'm not expert on thermal subsystem so I'm open to
> be proven wrong :-)

I'm investigating more about this issue!

>> This patch is based on renesas-bsp/rcar-3.5.4.rc2 !
>>
>> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
>> ---
>>   drivers/thermal/rcar_gen3_thermal.c | 45 +++++++++++++++++++++----------------
>>   1 file changed, 26 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
>> index 7aed533..009c0db 100644
>> --- a/drivers/thermal/rcar_gen3_thermal.c
>> +++ b/drivers/thermal/rcar_gen3_thermal.c
>> @@ -185,37 +185,39 @@ static int rcar_gen3_thermal_get_temp(void *devdata, int *temp)
>>   static int rcar_gen3_thermal_mcelsius_to_temp(struct rcar_gen3_thermal_tsc *tsc,
>>   					      int mcelsius)
>>   {
>> -	int celsius, val1, val2;
>> +	int val1, val2;
>>   
>> -	celsius = DIV_ROUND_CLOSEST(mcelsius, 1000);
>> -	val1 = celsius * tsc->coef.a1 + tsc->coef.b1;
>> -	val2 = celsius * tsc->coef.a2 + tsc->coef.b2;
>> +	val1 = (mcelsius * tsc->coef.a1)/1000 + tsc->coef.b1;
>> +	val2 = (mcelsius * tsc->coef.a2)/1000 + tsc->coef.b2;
> This won't work I'm afraid as it can overflow. As the thcodes and ptat
> values can be read from hardware there theoretical max size is 0xfff
> according to the documentation. Those values are then used to calculate
> a1, b1, a2 and b2 constants. If you can prove that no overflow can
> happen I'm happy for this change as it increases accuracy. If so this
> should be posted as a separate patch.

With this patch, when rcar_gen3_thermal_mcelsius_to_temp () is called,
since the mcelsius value was passed is calculated from the previous formula:
rcar_gen3_thermal_get_temp():

     int mcelsius, val1, val2;
     u32 reg;

     /* Read register and convert to mili Celsius */
     reg = rcar_gen3_thermal_read(tsc, REG_GEN3_TEMP) & CTEMP_MASK;

     val1 = FIXPT_DIV(FIXPT_INT(reg) - tsc->coef.b1, tsc->coef.a1);
     val2 = FIXPT_DIV(FIXPT_INT(reg) - tsc->coef.b2, tsc->coef.a2);
     mcelsius = FIXPT_TO_MCELSIUS((val1 + val2) / 2);

     /* Make sure we are inside specifications */
     if ((mcelsius < MCELSIUS(-40)) || (mcelsius > MCELSIUS(125)))
         return -EIO;

 From int mcelsius values, val1, val2;
The reverse calculation I do not think will happen the overflow!

With the current situation, I am not clear about the high, low values

But with (a1, b1), (a2, b2)

tsc1->coef.a1 965 tsc1->coef.a2 953 tsc1->coef.b1 323853 tsc1->coef.b2 
324268

tsc2->coef.a1 965 tsc2->coef.a2 954 tsc2->coef.b1 323213 tsc2->coef.b2 
323640

tsc3->coef.a1 947 tsc3->coef.a2 932 tsc3->coef.b1 325163 tsc3->coef.b2 
325680

with all tscX, aX <=1000.

If the temperature is 1000celsius = 1000000 mcelsius.
val1 <1000000 * 1000 + 323853 = 1 000 323 853 <2 147 483 647 (max int value)
(In fact the temperature of the board could not get to 1000 celsius 
degrees )

Here the current constant values are used.
But at future THCODE and PLAT values are read from registers
to calculate aX, bX, I do not know whether there really will be overflow 
or not.

If you use this patches without this part.
I have received incorrect interrupts with H3ES1.1.

So I need to integrate this part to ensure correctly in testing.

>>   
>>   	return INT_FIXPT((val1 + val2) / 2);
>>   }
>>   
>> -static int rcar_gen3_thermal_set_trips(void *devdata, int low, int high)
>> +static int rcar_gen3_thermal_update_threshold(struct rcar_gen3_thermal_tsc *tsc)
>>   {
>> -	struct rcar_gen3_thermal_tsc *tsc = devdata;
>> -
>> -	low = clamp_val(low, -40000, 120000);
>> -	high = clamp_val(high, -40000, 120000);
>> -
>> -	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQTEMP1,
>> -				rcar_gen3_thermal_mcelsius_to_temp(tsc, low));
>> +	u32 ctemp;
>> +	int temp_code;
>> +	int mcelsius, val1, val2;
>>   
>> -	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQTEMP2,
>> -				rcar_gen3_thermal_mcelsius_to_temp(tsc, high));
>> +	ctemp = rcar_gen3_thermal_read(tsc, REG_GEN3_TEMP) & CTEMP_MASK;
>> +	val1 = FIXPT_DIV(FIXPT_INT(ctemp) - tsc->coef.b1, tsc->coef.a1);
>> +	val2 = FIXPT_DIV(FIXPT_INT(ctemp) - tsc->coef.b2, tsc->coef.a2);
>> +	mcelsius = FIXPT_TO_MCELSIUS((val1 + val2) / 2);
>>   
>> -	tsc->low = low;
>> -	tsc->high = high;
>> +	/* set the interrupts to exceed the temperature */
>> +	temp_code = rcar_gen3_thermal_mcelsius_to_temp(tsc,
>> +			mcelsius + MCELSIUS(1));
>> +	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQTEMP1, temp_code);
>> +	/* set the interrupts to fall below the temperature */
>> +	temp_code = rcar_gen3_thermal_mcelsius_to_temp(tsc,
>> +			mcelsius - MCELSIUS(1));
>> +	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQTEMP2, temp_code);
>>   
>>   	return 0;
>>   }
>>   
>>   static const struct thermal_zone_of_device_ops rcar_gen3_tz_of_ops = {
>>   	.get_temp	= rcar_gen3_thermal_get_temp,
>> -	.set_trips	= rcar_gen3_thermal_set_trips,
> My understanding of the thermal framework is that implementing
> .set_trips() is correct and removing it here and rewriting is just
> wrong.  The driver should use the framework not do it's own thing, that
> way all the DT properties set for hysteresis and such are used in a
> correct way.
I'm investigating more about this issue!
>>   };
>>   
>>   static void rcar_thermal_irq_set(struct rcar_gen3_thermal_priv *priv, bool on)
>> @@ -256,8 +258,11 @@ static irqreturn_t rcar_gen3_thermal_irq_thread(int irq, void *data)
>>   	int i;
>>   
>>   	for (i = 0; i < priv->num_tscs; i++)
>> +	{
>> +		rcar_gen3_thermal_update_threshold(priv->tscs[i]);
>>   		thermal_zone_device_update(priv->tscs[i]->zone,
>>   					   THERMAL_EVENT_UNSPECIFIED);
>> +	}
>>   
>>   	spin_lock_irqsave(&priv->lock, flags);
>>   	rcar_thermal_irq_set(priv, true);
>> @@ -306,7 +311,7 @@ static void rcar_gen3_thermal_init(struct rcar_gen3_thermal_tsc *tsc)
>>   
>>   	usleep_range(1000, 2000);
>>   
>> -	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQCTL, 0x3F);
>> +	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQCTL, 0);
> This looks correct according to the new datasheets but should be posted
> in a separate patch.

I have created this patch separately before.

"https://patchwork.kernel.org/patch/10655351/"

If possible Niklas-san could give me Signed-of-by
or Acked? Thank you!

Thank you for the review

Hoan.

>>   	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQMSK, 0);
>>   	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQEN, IRQ_TEMPD1 | IRQ_TEMP2);
>>   
>> @@ -414,6 +419,8 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
>>   		priv->thermal_init(tsc);
>>   		rcar_gen3_thermal_calc_coefs(&tsc->coef, ptat, thcode[i]);
>>   
>> +		rcar_gen3_thermal_update_threshold(tsc);
>> +
>>   		zone = devm_thermal_zone_of_sensor_register(dev, i, tsc,
>>   							    &rcar_gen3_tz_of_ops);
>>   		if (IS_ERR(zone)) {
>> @@ -465,7 +472,7 @@ static int __maybe_unused rcar_gen3_thermal_resume(struct device *dev)
>>   		struct rcar_gen3_thermal_tsc *tsc = priv->tscs[i];
>>   
>>   		priv->thermal_init(tsc);
>> -		rcar_gen3_thermal_set_trips(tsc, tsc->low, tsc->high);
>> +		rcar_gen3_thermal_update_threshold(tsc);
>>   	}
>>   
>>   	rcar_thermal_irq_set(priv, true);
>> -- 
>> 2.7.4
>>
