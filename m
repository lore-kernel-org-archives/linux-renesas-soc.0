Return-Path: <SRS0=nlYi=QS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC53C169C4
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Feb 2019 19:56:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8AEEC218AD
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Feb 2019 19:56:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ukr+3pwi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387903AbfBKT4t (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 11 Feb 2019 14:56:49 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54695 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728293AbfBKT4s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Feb 2019 14:56:48 -0500
Received: by mail-wm1-f68.google.com with SMTP id a62so507835wmh.4;
        Mon, 11 Feb 2019 11:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=StkxIW8Xgc38q2Ytd6aH8WUm5zZDfQ3YjF2+nlZJri0=;
        b=ukr+3pwib/ehr88xbujHPNDITTDRr3W3TJDmxGQUZUABquPSGOhQX2zJS8Xaw9nS7M
         APj0Gty8B6IcE7r4qgJT7HzMTF90sGb/yPaYXp+LaesXgsp5ZCjfy+mIbBLFgKtK294Q
         oXrfqRyzFBK7BNGw9KQqoV3H7b4OgG0i5b7QNvbDt1jkzKke2JsV2VQspE1UUi6bpKrH
         JlbrdRDw8Xr8Uy8bSwprKjEC3Pv9EVBKouU/iMJpVPjXmot3k5wws0pp4e+bdds9yItO
         BolhIb8jY46dZeT4CAnazIPvUIq+Bixd+8l+AEVYn2/mgW71gTXGWHHD1JG0LYVSz0R6
         LPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=StkxIW8Xgc38q2Ytd6aH8WUm5zZDfQ3YjF2+nlZJri0=;
        b=ZSdldEe6y6ZOgVTZgL4qot7EqvUHZmtCkFZOrJx9r2ydMzog30BZwJLMiD+27ATUQl
         nyy2HrPlg0I38IljdTCwZ3G1Fp2q3y2AJjpCalql6oekk85GKJUlexWTzyWDj26tpMJU
         j6i51Km8zFplu1BdDMax9LO36q8+o+cI5aL7++qzdEWHc6QKeEhots6ucBjMvrGSV4Pf
         c7/7euX4i6EmdjoVBcg2cER98q6CJviSrOgEqn0matxMwbQ/vKdzFhxZ5nz3OhoR5pu3
         CMSXOMlNuQ5gZASPIlTm9SPmp2bCx6V3CLkzNiapzBnufpuzeGxA2IFS2dfo30GCRzt6
         e5PQ==
X-Gm-Message-State: AHQUAua8CCHFUpMIH5aMDQDiJQ97j5whQrGh6fHoLN6ukCQOCZ3aNHW+
        bTTwxuY+gN6gFjjeiEilbhY=
X-Google-Smtp-Source: AHgI3IZ46CfW4BPam3RgntXkxA4ob8k6sGhUgY/CqXK8KVmS3GQwAQyj2htpjs32M8TZOSsMWv0nvw==
X-Received: by 2002:a1c:7a18:: with SMTP id v24mr835435wmc.107.1549915004718;
        Mon, 11 Feb 2019 11:56:44 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id c1sm13148576wrf.20.2019.02.11.11.56.43
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Feb 2019 11:56:43 -0800 (PST)
Subject: Re: [PATCH V3 3/6] thermal: Register hwmon in
 thermal_zone_of_sensor_register_param()
To:     Eduardo Valentin <edubezval@gmail.com>
Cc:     linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
References: <20181217155644.29278-1-marek.vasut@gmail.com>
 <20181217155644.29278-4-marek.vasut@gmail.com>
 <20181218214439.GB8850@localhost.localdomain>
 <867ffa18-9c16-685a-7c83-7534bc14e41d@gmail.com>
 <a4aa607d-f83a-2ed4-09c2-fdcba308664d@gmail.com>
 <2b24720c-c649-44e0-0337-c8a52c78d33d@gmail.com>
 <20190205232442.GA4423@localhost.localdomain>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <1b331713-d1d1-1fe0-277e-2fea4866c244@gmail.com>
Date:   Mon, 11 Feb 2019 20:29:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190205232442.GA4423@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2/6/19 12:24 AM, Eduardo Valentin wrote:
> On Mon, Jan 28, 2019 at 01:10:11PM +0100, Marek Vasut wrote:
>> On 1/15/19 1:35 AM, Marek Vasut wrote:
>>> On 12/22/18 3:19 AM, Marek Vasut wrote:
>>>> On 12/18/2018 10:44 PM, Eduardo Valentin wrote:
>>>>> On Mon, Dec 17, 2018 at 04:56:41PM +0100, marek.vasut@gmail.com wrote:
>>>>>> From: Marek Vasut <marek.vasut@gmail.com>
>>>>>>
>>>>>> Register hwmon sysfs interface in thermal_zone_of_sensor_register_param()
>>>>>> in case thermal_zone_params->no_hwmon is set to false. This behavior is
>>>>>> the same as thermal_zone_device_register().
>>>>>>
>>>>>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>>>> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
>>>>>> Cc: Eduardo Valentin <edubezval@gmail.com>
>>>>>> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>>>>> Cc: Zhang Rui <rui.zhang@intel.com>
>>>>>> Cc: linux-renesas-soc@vger.kernel.org
>>>>>> To: linux-pm@vger.kernel.org
>>>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>>>> ---
>>>>>> V2: No change
>>>>>> V3: - Work around the From line and SoB line checkpatch warning
>>>>>>     - Reorder the SoB line at the end
>>>>>> ---
>>>>>>  drivers/thermal/of-thermal.c | 12 +++++++++++-
>>>>>>  1 file changed, 11 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/thermal/of-thermal.c b/drivers/thermal/of-thermal.c
>>>>>> index e1a303a5698c..5ccff7b678de 100644
>>>>>> --- a/drivers/thermal/of-thermal.c
>>>>>> +++ b/drivers/thermal/of-thermal.c
>>>>>> @@ -15,6 +15,7 @@
>>>>>>  #include <linux/string.h>
>>>>>>  
>>>>>>  #include "thermal_core.h"
>>>>>> +#include "thermal_hwmon.h"
>>>>>>  
>>>>>>  /***   Private data structures to represent thermal device tree data ***/
>>>>>>  
>>>>>> @@ -521,8 +522,15 @@ thermal_zone_of_sensor_register_params(struct device *dev, int sensor_id,
>>>>>>  		if (sensor_specs.np == sensor_np && id == sensor_id) {
>>>>>>  			tzd = thermal_zone_of_add_sensor(child, sensor_np,
>>>>>>  							 data, ops);
>>>>>> -			if (!IS_ERR(tzd))
>>>>>> +			if (!IS_ERR(tzd)) {
>>>>>> +				tzd->tzp = tzp;
>>>>>
>>>>> So, here you will overwrite what was done in of_parse_thermal_zones().
>>>>> That means, after this point, property like sustainable power, slope and
>>>>> offset are gone.
>>>>
>>>> Hmmmmm, that was rather inobvious, indeed.
>>>>
>>>> Do you have some suggestion how to pass in the no_hwmon = false then ?
>>>> Since tzp->no_hwmon is set to true in of_parse_thermal_zones(), the
>>>> three drivers (stm32, rcar, rcar_gen3) seem to hack around it. I'd like
>>>> to clean that up.
>>>
> 
> Yeah, that is an issue.
> 
>>> Bump ?
>>
>> Bump again, any suggestions ?
> 
> Yeah, a couple of ideas have been proposed for this issue.
> 
> First most tempting one is to have a DT property per thermal zone.
> Making it linux specific, something prefixed by linux,<property>. I
> recall Amit Kutcheria trying something similar to this, but dont
> remember where that went. Frankly, this is a Linux thing, I am not
> convinced DT is really the right place to fix this.

DT is not the right place for this, DT describes hardware and this is
policy, so it shouldn't be in DT.

> Another hack that could be written is a module parameter for of-thermal
> that would reflect the no_hwmon value, globally. The down side here is
> you have to make sure all drivers match that no_hwmon value, right?

Indeed, it should be the driver which decides whether or not to register
a HWMON interface for the thermal zone.

I guess for now, I'll just discard this entire series and hack the data
structure like other drivers do, since I don't see any reasonable solution.

-- 
Best regards,
Marek Vasut
