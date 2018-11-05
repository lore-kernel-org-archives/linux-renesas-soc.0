Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:20230 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbeKEKTz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Nov 2018 05:19:55 -0500
Subject: Re: [PATCH] thermal: rcar_gen3_thermal: Add Standby-Mode function
 support
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        linux-renesas-soc@vger.kernel.org
Cc: geert+renesas@glider.be, wsa@sang-engineering.com,
        kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, cv-dong@jinso.co.jp
References: <1541142370-15225-1-git-send-email-na-hoan@jinso.co.jp>
 <20181102095022.GC22306@bigcity.dyn.berto.se>
From: Hoan <na-hoan@jinso.co.jp>
Message-ID: <8f60b966-3e92-d63d-9134-472f7e81e5a1@jinso.co.jp>
Date: Mon, 5 Nov 2018 10:02:50 +0900
MIME-Version: 1.0
In-Reply-To: <20181102095022.GC22306@bigcity.dyn.berto.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Dear Niklas-san

Thank you for your comments!

On 2018/11/02 18:50, Niklas Söderlund wrote:
> Hi Hoan,
>
> Thanks for your work.
>
> On 2018-11-02 16:06:10 +0900, Nguyen An Hoan wrote:
>> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
>>
>> According to the hardware manual, Gen3 supports Standby-mode.
>> Add this function, and we should use this function while
>> suspend to reduce the energy consumption.
> Out of curiosity is the power saved measurable?

I apologize for not investigating yet this issue. It is considered
  to reduce energy consumption that Equal to the power of the
  "A/D converter for the thermal sensor".

>> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
>> ---
>>   drivers/thermal/rcar_gen3_thermal.c | 23 ++++++++++++++++++++++-
>>   1 file changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
>> index 7aed533..85fc4b2 100644
>> --- a/drivers/thermal/rcar_gen3_thermal.c
>> +++ b/drivers/thermal/rcar_gen3_thermal.c
>> @@ -447,11 +447,32 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
>>   	return ret;
>>   }
>>   
>> +static int rcar_gen3_thermal_standby(struct rcar_gen3_thermal_priv* priv)
> I don't want to bikeshed about the name but the datasheet confuses me as
> it documents the standby and reset procedures to be exactly the same, or
> am I missing something? If they are indeed one and the same I would
> prefers this function to be called rcar_gen3_thermal_reset() and in
> rcar_gen3_thermal_suspend() add a comment "Reset to enter standby mode"
> or something similar. But it's up to you.
I also find it strange that the procedures of Stand-by and Reset
are exactly the same. Since we should not doubt the accuracy of
the document. I will update v2 according to your comments.
>> +{
>> +	unsigned int i;
>> +	u32 reg_val;
>> +
>> +	for (i = 0; i < TSC_MAX_NUM; i++) {
>> +		struct rcar_gen3_thermal_tsc *tsc = priv->tscs[i];
>> +
>> +		rcar_gen3_thermal_write(tsc, REG_GEN3_IRQEN, 0);
>> +		rcar_gen3_thermal_write(tsc, REG_GEN3_IRQMSK, 0);
>> +
>> +		reg_val = rcar_gen3_thermal_read(tsc, REG_GEN3_THCTR);
>> +		rcar_gen3_thermal_write(tsc, REG_GEN3_THCTR, reg_val & ~THCTR_THSST);
> Too many new lines.

Thank, in addition this point, perhaps using 'priv->num_tscs' instead of

TSC_MAX_NUM would be more accurate!

>> +
>> +
>> +		usleep_range(1000, 2000);
> Can't the sleep be moved outside the loop? We can reset all TSC and then
> wait the required 1 ms only once while they all are reset or are they
> somehow dependent on being reset in sequence?

Thank you, that's right, exactly 1ms only once,
I will put usleep () outside at v2 of this patch.

Thank you very much for the review!

Hoan.

>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static int __maybe_unused rcar_gen3_thermal_suspend(struct device *dev)
>>   {
>>   	struct rcar_gen3_thermal_priv *priv = dev_get_drvdata(dev);
>>   
>> -	rcar_thermal_irq_set(priv, false);
>> +	rcar_gen3_thermal_standby(priv);
>>   
>>   	return 0;
>>   }
>> -- 
>> 2.7.4
>>
