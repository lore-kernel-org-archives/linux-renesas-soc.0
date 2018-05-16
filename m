Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:43547 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751662AbeEPI7e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 May 2018 04:59:34 -0400
Received: by mail-lf0-f67.google.com with SMTP id n18-v6so4427584lfh.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 May 2018 01:59:34 -0700 (PDT)
Subject: Re: [PATCH 2/5] drm: rcar-du: lvds: Add R8A77995 support
To: Simon Horman <horms@verge.net.au>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <1526386840-15368-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1526386840-15368-3-git-send-email-ulrich.hecht+renesas@gmail.com>
 <20180516075419.lpwb2yusthmm74mx@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <cd2ca96a-cfc6-bf34-6c4d-299798d9f8ea@cogentembedded.com>
Date: Wed, 16 May 2018 11:59:32 +0300
MIME-Version: 1.0
In-Reply-To: <20180516075419.lpwb2yusthmm74mx@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 5/16/2018 10:54 AM, Simon Horman wrote:

>> Add support for the R-Car D3 (R8A77995) SoC to the LVDS encoder driver.
>>
>> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
>> ---
>>   drivers/gpu/drm/rcar-du/rcar_lvds.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
>> index 3d2d3bb..58fb9f8 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
>> @@ -511,6 +511,11 @@ static const struct rcar_lvds_device_info rcar_lvds_r8a77970_info = {
>>   	.quirks = RCAR_LVDS_QUIRK_GEN2_PLLCR | RCAR_LVDS_QUIRK_GEN3_LVEN,
>>   };
>>   
>> +static const struct rcar_lvds_device_info rcar_lvds_r8a77995_info = {
>> +	.gen = 3,
>> +	.quirks = RCAR_LVDS_QUIRK_GEN3_LVEN,
>> +};
> 
> This new structure seems to be identical to rcar_lvds_r8a77970_info.
 > Could we consolidate somehow?

    In my book, that one has 2 quirk flags. What tree are you looking at?

[...]

MBR, Sergei
