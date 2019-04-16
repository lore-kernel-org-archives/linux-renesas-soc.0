Return-Path: <SRS0=apzE=SS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 164A2C10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 16 Apr 2019 03:16:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E351A20868
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 16 Apr 2019 03:16:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbfDPDQL (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 15 Apr 2019 23:16:11 -0400
Received: from www3345.sakura.ne.jp ([49.212.235.55]:15185 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726258AbfDPDQL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Apr 2019 23:16:11 -0400
Received: from fsav102.sakura.ne.jp (fsav102.sakura.ne.jp [27.133.134.229])
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x3G3G83H024104;
        Tue, 16 Apr 2019 12:16:08 +0900 (JST)
        (envelope-from na-hoan@jinso.co.jp)
Received: from www3345.sakura.ne.jp (49.212.235.55)
 by fsav102.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav102.sakura.ne.jp);
 Tue, 16 Apr 2019 12:16:08 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav102.sakura.ne.jp)
Received: from [192.168.1.8] (p14010-ipadfx41marunouchi.tokyo.ocn.ne.jp [61.118.107.10])
        (authenticated bits=0)
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x3G3G7C8024096
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NO);
        Tue, 16 Apr 2019 12:16:08 +0900 (JST)
        (envelope-from na-hoan@jinso.co.jp)
Subject: Re: [v2 PATCH] thermal: rcar_gen3_thermal: Add Standby/Reset Mode
 support
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Zhang Rui <rui.zhang@intel.com>, edubezval@gmail.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        wsa@sang-engineering.com, kuninori.morimoto.gx@renesas.com,
        yoshihiro.shimoda.uh@renesas.com, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, cv-dong@jinso.co.jp
References: <1541484506-30736-1-git-send-email-na-hoan@jinso.co.jp>
 <20190411194500.GG30887@bigcity.dyn.berto.se>
From:   Hoan <na-hoan@jinso.co.jp>
Message-ID: <efac2d56-8f31-3b03-ffe4-026210a33b94@jinso.co.jp>
Date:   Tue, 16 Apr 2019 12:16:07 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190411194500.GG30887@bigcity.dyn.berto.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear Niklas-san

Always thanks for your helps!


Sorry for forgetting CC maintainer. CC Maintainers!

On 2019/04/12 4:45, Niklas Söderlund wrote:
> Hi Hoan,
>
> Thanks for your work.
>
> Sorry for very late review, somehow this got lost in my inbox.
>
> On 2018-11-06 15:08:26 +0900, Nguyen An Hoan wrote:
>> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
>>
>> According to the hardware manual, Gen3 supports Standby/Reset mode.
>> Add this function, and we should use this function while suspend
>> to reduce the energy consumption.
>>
>> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
> Nice clean commit and matches the datasheet,
>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>
> Interrupts fire both before and after suspending as expected,
>
> Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>
>> ---
>>   drivers/thermal/rcar_gen3_thermal.c | 23 ++++++++++++++++++++++-
>>   1 file changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
>> index 7aed533..e654519 100644
>> --- a/drivers/thermal/rcar_gen3_thermal.c
>> +++ b/drivers/thermal/rcar_gen3_thermal.c
>> @@ -447,11 +447,32 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
>>   	return ret;
>>   }
>>   
>> +static int rcar_gen3_thermal_reset(struct rcar_gen3_thermal_priv* priv)
>> +{
>> +	unsigned int i;
>> +	u32 reg_val;
>> +
>> +	for (i = 0; i < priv->num_tscs; i++) {
>> +		struct rcar_gen3_thermal_tsc *tsc = priv->tscs[i];
>> +
>> +		rcar_gen3_thermal_write(tsc, REG_GEN3_IRQEN, 0);
>> +		rcar_gen3_thermal_write(tsc, REG_GEN3_IRQMSK, 0);
>> +
>> +		reg_val = rcar_gen3_thermal_read(tsc, REG_GEN3_THCTR);
>> +		rcar_gen3_thermal_write(tsc, REG_GEN3_THCTR, reg_val & ~THCTR_THSST);
>> +	}
>> +
>> +	usleep_range(1000, 2000);
>> +
>> +	return 0;
>> +}
>> +
>>   static int __maybe_unused rcar_gen3_thermal_suspend(struct device *dev)
>>   {
>>   	struct rcar_gen3_thermal_priv *priv = dev_get_drvdata(dev);
>>   
>> -	rcar_thermal_irq_set(priv, false);
>> +	/* Reset to enter standby mode */
>> +	rcar_gen3_thermal_reset(priv);
>>   
>>   	return 0;
>>   }
>> -- 
>> 2.7.4
>>
