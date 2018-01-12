Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:36205 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932740AbeALJCJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jan 2018 04:02:09 -0500
Received: by mail-lf0-f66.google.com with SMTP id e203so5157123lfg.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jan 2018 01:02:09 -0800 (PST)
Subject: Re: [PATCH 1/3] drm: rcar-du: lvds: refactor LVDS startup
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org
References: <20180111170055.878913975@cogentembedded.com>
 <2087195.Y7A8apsEt0@avalon>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <f61e3cd0-7b3a-5dc1-354a-227b3407c18e@cogentembedded.com>
Date: Fri, 12 Jan 2018 12:02:07 +0300
MIME-Version: 1.0
In-Reply-To: <2087195.Y7A8apsEt0@avalon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 1/12/2018 4:26 AM, Laurent Pinchart wrote:

>> After the recent correction of the R-Car gen3 LVDCR1 value, already similar
>> enough at their  ends rcar_du_lvdsenc_start_gen{2|3}() started asking for a
>> merge and it's becoming actually necessary with the addition the R-Car V3M
>> (R8A77970) support -- this  gen3 SoC  has gen2-like LVDPLLCR layout.
>>
>> BTW, such a merge saves 72 bytes of the object code with AArch64 gcc 4.8.5.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>>   drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c |  132 +++++++++++---------------
>>   1 file changed, 54 insertions(+), 78 deletions(-)
>>
>> Index: linux/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
>> ===================================================================
>> --- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
>> +++ linux/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
>> @@ -39,98 +39,41 @@ static void rcar_lvds_write(struct rcar_
[...]
>>   static int rcar_du_lvdsenc_start(struct rcar_du_lvdsenc *lvds,
>>   				 struct rcar_du_crtc *rcrtc)
>>   {
>> -	u32 lvdhcr;
>> +	u32 lvdhcr, lvdpllcr, lvdcr0 = lvds->mode << LVDCR0_LVMD_SHIFT;
> 
> Please declare variables on separate lines. Especially having lvdcr0 on a line
> of its own will make it clearer.

    OK.

>> +	const struct drm_display_mode *mode = &rcrtc->crtc.mode;
>> +	unsigned int gen = lvds->dev->info->gen;
>> +	unsigned int freq = mode->clock;
>>   	int ret;
>>
>>   	if (lvds->enabled)
>> @@ -158,14 +101,47 @@ static int rcar_du_lvdsenc_start(struct
>>   	else
>>   		lvdhcr = LVDCHCR_CHSEL_CH(0, 0) | LVDCHCR_CHSEL_CH(1, 1)
>>
>>   		       | LVDCHCR_CHSEL_CH(2, 2) | LVDCHCR_CHSEL_CH(3, 3);
>>
>> -
>>   	rcar_lvds_write(lvds, LVDCHCR, lvdhcr);
>>
>> -	/* Perform generation-specific initialization. */
>> -	if (lvds->dev->info->gen < 3)
>> -		rcar_du_lvdsenc_start_gen2(lvds, rcrtc);
>> +	/* PLL clock configuration */
>> +	if (gen < 3)
>> +		lvdpllcr = rcar_lvds_gen2_lvdpllcr(freq);
>>   	else
>> -		rcar_du_lvdsenc_start_gen3(lvds, rcrtc);
>> +		lvdpllcr = rcar_lvds_gen3_lvdpllcr(freq);
>> +	rcar_lvds_write(lvds, LVDPLLCR,	lvdpllcr);
>> +
>> +	if (gen < 3) {
>> +		/*
>> +		 * Select the input, enable LVDS operation, and turn
>> +		 * the bias circuitry on.
>> +		 */
>> +		lvdcr0 |= LVDCR0_BEN | LVDCR0_LVEN;
>> +		if (rcrtc->index == 2)
>> +			lvdcr0 |= LVDCR0_DUSEL;
>> +		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
>> +	}
>> +
>> +	/* Turn all the channels on. */
>> +	rcar_lvds_write(lvds, LVDCR1,
>> +			LVDCR1_CHSTBY(3) | LVDCR1_CHSTBY(2) |
>> +			LVDCR1_CHSTBY(1) | LVDCR1_CHSTBY(0) | LVDCR1_CLKSTBY);
>> +
>> +	/* Turn the PLL on. */
>> +	lvdcr0 |= LVDCR0_PLLON;
>> +	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
>> +
>> +	if (gen > 2) {
>> +		/* Turn on the LVDS normal mode. */
>> +		lvdcr0 |= LVDCR0_PWD;
>> +		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
>> +	}
>> +
>> +	/* Wait for the startup delay. */
>> +	usleep_range(100, 150);
>> +
>> +	/* Turn the output on. */
>> +	lvdcr0 |= LVDCR0_LVRES;
>> +	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
>>
>>   	lvds->enabled = true;
> 
> How will this work with the D3 and E3 SoCs ? They seem to have a few
> differences, will code still be reusable ?

    Looking at "37.3.7 Setting Procedure" it will require some adjustments -- 
in the same vein as in the V3M case. The most prominent D3/E3 specific feature 
is the totally different LVDPLLCR layout, and it's not currently supported...

MBR, Sergei
