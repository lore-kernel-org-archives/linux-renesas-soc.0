Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33201 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726092AbeLECEg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Dec 2018 21:04:36 -0500
Subject: Re: [PATCH] clk: vc5: Add suspend/resume support
To: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>,
        Alexey Firago <alexey_firago@mentor.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-renesas-soc@vger.kernel.org
References: <20181204182721.28258-1-marek.vasut+renesas@gmail.com>
 <154395675529.88331.12886650536645714742@swboyd.mtv.corp.google.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <4f85447d-07b8-9f4c-ecb2-25d6834e6c5d@gmail.com>
Date: Wed, 5 Dec 2018 00:48:01 +0100
MIME-Version: 1.0
In-Reply-To: <154395675529.88331.12886650536645714742@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 12/04/2018 09:52 PM, Stephen Boyd wrote:
> Quoting Marek Vasut (2018-12-04 10:27:21)
>> diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
>> index decffb3826ec..ac90fb36af1a 100644
>> --- a/drivers/clk/clk-versaclock5.c
>> +++ b/drivers/clk/clk-versaclock5.c
>> @@ -906,6 +906,39 @@ static int vc5_remove(struct i2c_client *client)
>>         return 0;
>>  }
>>  
>> +#ifdef CONFIG_PM_SLEEP
>> +static int vc5_suspend(struct device *dev)
> 
> Please mark as __maybe_unused and drop the #ifdef CONFIG_PM_SLEEP
> 
>> +{
>> +       struct vc5_driver_data *vc5 = dev_get_drvdata(dev);
>> +       int ret;
>> +
>> +       ret = regcache_sync(vc5->regmap);
>> +       if (ret != 0) {
>> +               dev_err(dev, "Failed to save register map: %d\n", ret);
>> +               return ret;
> 
> Do we need to block suspend if we can't save the register map away? Or
> can we just throw up our hands and not restore on resume?

Some hardware will fail on resume, so I'd say -- yes ?

The rest is fixed.

>> +       }
>> +       regcache_cache_only(vc5->regmap, true);
>> +       regcache_mark_dirty(vc5->regmap);
>> +
>> +       return 0;
>> +}
>> +
>> +static int vc5_resume(struct device *dev)
>> +{
>> +       struct vc5_driver_data *vc5 = dev_get_drvdata(dev);
>> +       int ret;
>> +
>> +       regcache_cache_only(vc5->regmap, false);
>> +       ret = regcache_sync(vc5->regmap);
>> +       if (ret != 0) {
>> +               dev_err(dev, "Failed to restore register map: %d\n", ret);
>> +               return ret;
>> +       }
> 
> Simplify to
> 
> 	if (ret)
> 		dev_err()
> 	retun ret;
> 
>> +
>> +       return 0;
>> +}
>> +#endif
>> +
>>  static const struct vc5_chip_info idt_5p49v5923_info = {
>>         .model = IDT_VC5_5P49V5923,
>>         .clk_fod_cnt = 2,


-- 
Best regards,
Marek Vasut
