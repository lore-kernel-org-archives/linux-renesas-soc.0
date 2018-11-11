Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40521 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727594AbeKKXPe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 11 Nov 2018 18:15:34 -0500
Subject: Re: [PATCH] mfd: bd9571mwv: add volatile register to make DVFS work
To: Wolfram Sang <wsa@the-dreams.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Dien Pham <dien.pham.ry@renesas.com>
References: <20181003135841.4984-1-wsa+renesas@sang-engineering.com>
 <20181109110413.GC1031@kunai>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <0250a104-dab0-b8cb-11e3-e061be103018@gmail.com>
Date: Sun, 11 Nov 2018 14:26:55 +0100
MIME-Version: 1.0
In-Reply-To: <20181109110413.GC1031@kunai>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 11/09/2018 12:04 PM, Wolfram Sang wrote:
> On Wed, Oct 03, 2018 at 03:58:41PM +0200, Wolfram Sang wrote:
>> From: Dien Pham <dien.pham.ry@renesas.com>
>>
>> Because BD9571MWV_DVFS_MONIVDAC is not defined in the volatile table,
>> the physical register value is not updated by regmap and DVFS doesn't
>> work as expected. Fix it!
>>
>> Signed-off-by: Dien Pham <dien.pham.ry@renesas.com>
>> [wsa: rebase, add 'Fixes', reword commit message]
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Fixes: d3ea21272094 ("mfd: Add ROHM BD9571MWV-M MFD PMIC driver")
>> ---
> 
> Any blockers for this one?
> 
>>
>> Grabbed from the BSP and confirmed by the datasheet. The register is RO
>> and reflecting states depending on other registers.
>>
>>  drivers/mfd/bd9571mwv.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mfd/bd9571mwv.c b/drivers/mfd/bd9571mwv.c
>> index 503979c81dae..fab3cdc27ed6 100644
>> --- a/drivers/mfd/bd9571mwv.c
>> +++ b/drivers/mfd/bd9571mwv.c
>> @@ -59,6 +59,7 @@ static const struct regmap_access_table bd9571mwv_writable_table = {
>>  };
>>  
>>  static const struct regmap_range bd9571mwv_volatile_yes_ranges[] = {
>> +	regmap_reg_range(BD9571MWV_DVFS_MONIVDAC, BD9571MWV_DVFS_MONIVDAC),
>>  	regmap_reg_range(BD9571MWV_GPIO_IN, BD9571MWV_GPIO_IN),
>>  	regmap_reg_range(BD9571MWV_GPIO_INT, BD9571MWV_GPIO_INT),
>>  	regmap_reg_range(BD9571MWV_INT_INTREQ, BD9571MWV_INT_INTREQ),
>> -- 

Makes sense,

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

-- 
Best regards,
Marek Vasut
