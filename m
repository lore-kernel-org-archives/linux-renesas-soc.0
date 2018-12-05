Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34922 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727431AbeLEOYs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Dec 2018 09:24:48 -0500
Subject: Re: [PATCH] clk: vc5: Add suspend/resume support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Alexey Firago <alexey_firago@mentor.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-renesas-soc@vger.kernel.org
References: <20181204182721.28258-1-marek.vasut+renesas@gmail.com>
 <2439179.Yi0TbQOvfy@avalon> <5bd189ca-2bac-58ce-a635-58f515962f82@gmail.com>
 <5897969.XemNuYOREI@avalon>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <291644a8-bfe2-1eed-126d-04d34814aa24@gmail.com>
Date: Wed, 5 Dec 2018 15:21:36 +0100
MIME-Version: 1.0
In-Reply-To: <5897969.XemNuYOREI@avalon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 12/05/2018 02:54 PM, Laurent Pinchart wrote:
> Hi Marek,

Hi,

> On Wednesday, 5 December 2018 14:29:22 EET Marek Vasut wrote:
>> On 12/05/2018 06:21 AM, Laurent Pinchart wrote:
>>> On Wednesday, 5 December 2018 01:48:01 EET Marek Vasut wrote:
>>>> On 12/04/2018 09:52 PM, Stephen Boyd wrote:
>>>>> Quoting Marek Vasut (2018-12-04 10:27:21)
>>>>>
>>>>>> diff --git a/drivers/clk/clk-versaclock5.c
>>>>>> b/drivers/clk/clk-versaclock5.c
>>>>>> index decffb3826ec..ac90fb36af1a 100644
>>>>>> --- a/drivers/clk/clk-versaclock5.c
>>>>>> +++ b/drivers/clk/clk-versaclock5.c
>>>>>> @@ -906,6 +906,39 @@ static int vc5_remove(struct i2c_client *client)
>>>>>>         return 0;
>>>>>>  }
>>>>>>
>>>>>> +#ifdef CONFIG_PM_SLEEP
>>>>>> +static int vc5_suspend(struct device *dev)
>>>>>
>>>>> Please mark as __maybe_unused and drop the #ifdef CONFIG_PM_SLEEP
>>>>>
>>>>>> +{
>>>>>> +       struct vc5_driver_data *vc5 = dev_get_drvdata(dev);
>>>>>> +       int ret;
>>>>>> +
>>>>>> +       ret = regcache_sync(vc5->regmap);
>>>>>> +       if (ret != 0) {
>>>>>> +               dev_err(dev, "Failed to save register map: %d\n", ret);
>>>>>> +               return ret;
>>>>>
>>>>> Do we need to block suspend if we can't save the register map away? Or
>>>>> can we just throw up our hands and not restore on resume?
>>>>
>>>> Some hardware will fail on resume, so I'd say -- yes ?
>>>
>>> But why do you need to sync on suspend in the first place ? What could
>>> cause the map to be dirty at this stage, and require syncing before
>>> suspend, that couldn't work with the sync be delayed to resume time ?
>>
>> Possibly a configuration coming from eg. bootloader time , or some other
>> configuration not done by Linux.
> 
> I still don't get it. As far as I know, regcache_sync() will write the content 
> of the regmap to the hardware, not the other way around. You call it at resume 
> time, so the hardware should be programmed properly, regardless of what the 
> boot loader or the firmware does when resuming.
> 
> Could you please explain why this is needed at suspend time ?

It is not, can be dropped.

-- 
Best regards,
Marek Vasut
