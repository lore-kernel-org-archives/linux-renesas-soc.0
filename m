Return-Path: <SRS0=nIvG=PX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8904BC43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 15 Jan 2019 02:16:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A43720659
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 15 Jan 2019 02:16:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WLr2ddPn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727540AbfAOCQ5 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 14 Jan 2019 21:16:57 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36746 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727525AbfAOCQ4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Jan 2019 21:16:56 -0500
Received: by mail-wm1-f65.google.com with SMTP id p6so1650802wmc.1;
        Mon, 14 Jan 2019 18:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4T6hCSJESddSqq/4556KS1ZIMRF6AivQ2kgoYMxJ/oo=;
        b=WLr2ddPnvCQgtCfd/fE81wZIPOPHVs2L6zTtTRqq+iaI9jYgS3DbzJzK/YNuEsBpnl
         SWtRcJjeSyDrKgtmHSwy2pG55HiFTmTMx/FrldlQ3yA2dj/K1+HNqIl4tL3M4f4X900M
         4TwWmQ7WYPB7cN/Eu+iakdeGvKF5vJ01Fo8AeJxM+8Z4W8AvF/6skyxzBFiwxLrLg0yY
         iWfP1rFS2wXirCmIim5UB/G/KY8LIFAF+4toupfFFSeZyAA/hrDQ5KzF+/4Dj/RqFuex
         o59TJMqAkbGwZb5Lb7/o67fisKl0HgvuwH/fEJJbgQne84vQIvqtXOFRc6YMXoI33SnA
         hSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=4T6hCSJESddSqq/4556KS1ZIMRF6AivQ2kgoYMxJ/oo=;
        b=aXf5S/FT4XBb5ZKW2K97vW5raIYavWV2XhAuF2WvNhWojKGhlvDVgXOB3BcTL77Mlr
         wP/EB5jghOzb4j9vtwzNXaZx5joUx+LpysU4XSRrMs/0RNUA8dWTVD65/yU3P4fpcmzS
         GA1ryW6K+bPd5rM8V62LAHzbACpIFRbPwBymdbBg6it5TIxlqfk/yKtAQU5drXgg0XDT
         HJfwrCSCYnVH+LMmjjz23cGPER7x9ic+tcIhFwJni90Bh4q/V7UQoh81R3bMsJqDNqdE
         UCiPn0rucmsHCukLesOMDk4tmV3/xsGMIWB0Wydfgeo5xfQKoPRGQne4/RqGJftKekXR
         ZZ2w==
X-Gm-Message-State: AJcUukfI5QGca3z6xJs9VikUNY0kQDAm/Dd1xx/NSTBWWlldZkZGZkcv
        FRRMARkDOEI/B9VVGIYkUbA=
X-Google-Smtp-Source: ALg8bN6s9mT+Txk1aFZLYBBMvzfEmXDZut5HiIJECK8qDlhu53s5eOAOA3NBG7nX4gbI4L+UEW/7Bg==
X-Received: by 2002:a1c:7fca:: with SMTP id a193mr1404387wmd.36.1547518613680;
        Mon, 14 Jan 2019 18:16:53 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id z206sm38937841wmc.18.2019.01.14.18.16.52
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Jan 2019 18:16:52 -0800 (PST)
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
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=marex@denx.de; prefer-encrypt=mutual; keydata=
 mQINBFHmnxgBEACuQOC6Kaw/32MTeUJdFuDZ1FrbG76a0Ys/I02Kj9jXDmCCLvqq18Z4A1b0
 xbuMKGDy5WR77fqGV8zADUo6i1ATgCZeg+SRmQROF8r9K6n6digTznBySSLANhN3kXUMNRE1
 WEIBGCZJ5FF+Qq59AkAUTB8CiIzfEW98o7lUjeEume/78wR18+QW+2z6eYli2qNECceRINXT
 zS3oxRMr+ivqEUGKvMBC/WNLuvJoCGsfSQc2I+uGEU7MOdOCC6SsKdnPBGKYth5Ieb16bRS1
 b9M5BoEKTEzDCOWn92OxeHX6M2gLEMQobfM0RdIowMfWaUHdci2cLUTyL0T/P/gIpHMR2LhL
 8sdbNZufgv73s9PDgxTWMzypXimMJ7VZmVh9I2nQd2xm8+uE1rghqb90aEMFCTwUlrz4Qhjh
 vmczd2ScuuOMLzHEaaoOrMGbaWIEFcJvQgyHzJgMPgnG64eDq6uGyBEXRc3bBzv7B765Hcg8
 SSNqoUstjuQQlGp3y3Yj16l+PyZ3Ucy2swFYLVPTc35xFBk/uGEIhGncoFpOX29rxt9M8r5G
 hm7395m0GmDy50H/HN61/S8EPvM3HUjqBvX1EqU+vJXfwozxkKpIwcjx7h3W+PPS9TUb7r5v
 vHCqnrWRd/m6KWbCJsv0rsIU66o2qKYX5cIHV6u6Y7Zm7BtHfwARAQABtBtNYXJlayBWYXN1
 dCA8bWFyZXhAZGVueC5kZT6JAjgEEwECACIFAlHmnxgCGwMGCwkIBwMCBhUIAgkKCwQWAgMB
 Ah4BAheAAAoJEOtsLUEh5B0XLk0QAINOYFYB3v4KjXSFHYBQLlDblqhXvVtjyQHMiJsY1BMO
 mMrANUJQtpY3UkYquFspe2GBiFQbfW+mDlwFlSNpzaJ68qGEK+57I/MufsZKV6Ze9j7QeClu
 orYH+zfIBI7sn0HkY/MWN/Z270gRv2xSxDBP/8SPdB53EkImLZUFOo4/5eyuQ4t8HLgol02u
 2ncwXrnT036QC3SiNJDCJhwkpjvamPHghxr8hbIwkdOLZlYWfl0yzYzQohl8zBEwtBxl5cS4
 1TcrgBXsanQUMVNBpl0s8nQLKuHJNPOAhBnKstAe54yY3iWswYayHqqgqIQldcDqttHhdTJW
 mb9hTSf5p6fnZqcsfi3PUFwj5PJSN3aAbF8w42FwRvIOWbksFIWXpxYI3mq2TmX4GtlKdlF8
 xT+Q+Cbk538IBV4OQ5BapuYHs1C1ff9gVC0rfrCEloyteHafHwOv3ZuEGPlH89Rl4EjRvJxX
 8nE0sCiq6yUbpom8xRA5nFwA0bbTDwhH5RD/952bZraLpWcdJ6cWA2gefd2+2fy0268xyHmD
 m87B49BIaAsZ2kvEb/scCZ/CvPHjHLAjr+/GsdzOxwB68P41ZajujMDmbka00CyeAl88pgLX
 tTkPvAzuEDpRoJmg8zrQqrsmEKSdhFJhZ7d2MMKpCcVnInByXjM+1GEfSisTgWnluQINBFHm
 nxgBEAC8MpoO1s1AB0uRQGXlhYzkYvxkDGAe50/18ct2K6ORSv7HjCmZBjJX+2xTPSmML9ju
 3P0KrlnRdT8qCh+ozijffLjm5X9Fk+6mGQ56UQzivuPNlgyC3epF3Z58VPVQcIfE2/pdAxtZ
 zKc4P5t2yo5qk635huo0NvNg5mRhvfZ7mZpZuBahkHguR0Heh/tnGCa2v5P6uFbGX8+6rAA8
 EKxl5Tclf27PFZwbIWL1buS9RwgzsHj2TFnnEFIcWdMHyGy2GT8JMgY0VwxKebzGJg2RqfOL
 PaPjnvnXHAIYEknQp0TUtUiNxm0PBa4IQ30XhrB9D5QYdcw/DVvCzb9qyIlaQKEqHZm1fGU4
 iCsH3jV+5D4Lrn5JfXc/+A1NsLUq/NFIYhphbX4fGjR2QdZJrDnGVcxSlwP7CeRuxGELrASz
 m4G4Q0mYz7HdAlzBJHi8Ej4yC9l7PPlnxdUcAwheLxGwzMCf5vxw1C6Zi8PvKu/sY7Bha9XJ
 plvuLBi7QrkD8mZEzt+xC9nWRt7hL47+UvyduFe4qDMTPrW20ROxCykC36gj53YhqqLblioX
 2//vGLKj8x+LiLSTwjkLkrwOremhdTqr457511vOXyaZyOlWhFjN+4j9xwbbg1IWwMenRAb7
 Qwuipck6fN2o+PK9i6t6pWXrUDNI/VCMbimnuqPwAQARAQABiQIfBBgBAgAJBQJR5p8YAhsM
 AAoJEOtsLUEh5B0XMqAP/1HbrClefDZ/Lvvo89mgC56vWzEstmFo8EihqxVZvpkiCjJoCH53
 VCYeGl41p0y6K5gaLT28s9waVHBw+dhpwABba3neV/vyXv0wUtvkS3T0e4zruYFWw0lQoZi+
 8rtXTsuWN5t3u8avXsrdqD0CteTJdgZ7yBV8bBvK2ekqFMS/cLC+MoYlmUFn6Tcxmv0x8QZY
 ux6ts9YpUvx8QxMJt9vfwt1WIUEFKR3JQdrZmbPGqWJ3s+u/C+v9stC5qf2eYafRjzy05lEn
 B06W5D5Uc+FGEhuzq4G0eRLgivMoC0Eqz7HuwGcRAJYQILQ3Vzd4oHKPoUAtvlKqUwDmHodT
 HPmN73JMsvO3jLrSdl4k6o3CdlS/DI0Eto4fD0Wqh6d5q11u1TOM7+/LehWrOOoGVqRc6FFT
 ofck6h6rN/Urwkr1nWQ3kgO1cd/gevqy8Tevo/qkPYIf71BlypcXhKqn6IPjkq4QLiDPRjHM
 tgPc2T/X/ETe5eCuhxMytIYbt1fK2pDXPoIKbbDK4uEmg9USXZ+pYrac4PFo1d+6D6vmTjRZ
 GRRITOVpKgBndfPyqofxeKNKGdNf9FS/x89RlnDWXsQHm+0pXguSRG9XdB16ZFNgeo8SeZVr
 qc9uLfhyQp/zB6qEnuX1TToug7PuDgcNZdjN3vgTXyno2TFMxp/LKHqg
Message-ID: <a4aa607d-f83a-2ed4-09c2-fdcba308664d@gmail.com>
Date:   Tue, 15 Jan 2019 01:35:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <867ffa18-9c16-685a-7c83-7534bc14e41d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/22/18 3:19 AM, Marek Vasut wrote:
> On 12/18/2018 10:44 PM, Eduardo Valentin wrote:
>> On Mon, Dec 17, 2018 at 04:56:41PM +0100, marek.vasut@gmail.com wrote:
>>> From: Marek Vasut <marek.vasut@gmail.com>
>>>
>>> Register hwmon sysfs interface in thermal_zone_of_sensor_register_param()
>>> in case thermal_zone_params->no_hwmon is set to false. This behavior is
>>> the same as thermal_zone_device_register().
>>>
>>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>>> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
>>> Cc: Eduardo Valentin <edubezval@gmail.com>
>>> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>> Cc: Zhang Rui <rui.zhang@intel.com>
>>> Cc: linux-renesas-soc@vger.kernel.org
>>> To: linux-pm@vger.kernel.org
>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>>> ---
>>> V2: No change
>>> V3: - Work around the From line and SoB line checkpatch warning
>>>     - Reorder the SoB line at the end
>>> ---
>>>  drivers/thermal/of-thermal.c | 12 +++++++++++-
>>>  1 file changed, 11 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/thermal/of-thermal.c b/drivers/thermal/of-thermal.c
>>> index e1a303a5698c..5ccff7b678de 100644
>>> --- a/drivers/thermal/of-thermal.c
>>> +++ b/drivers/thermal/of-thermal.c
>>> @@ -15,6 +15,7 @@
>>>  #include <linux/string.h>
>>>  
>>>  #include "thermal_core.h"
>>> +#include "thermal_hwmon.h"
>>>  
>>>  /***   Private data structures to represent thermal device tree data ***/
>>>  
>>> @@ -521,8 +522,15 @@ thermal_zone_of_sensor_register_params(struct device *dev, int sensor_id,
>>>  		if (sensor_specs.np == sensor_np && id == sensor_id) {
>>>  			tzd = thermal_zone_of_add_sensor(child, sensor_np,
>>>  							 data, ops);
>>> -			if (!IS_ERR(tzd))
>>> +			if (!IS_ERR(tzd)) {
>>> +				tzd->tzp = tzp;
>>
>> So, here you will overwrite what was done in of_parse_thermal_zones().
>> That means, after this point, property like sustainable power, slope and
>> offset are gone.
> 
> Hmmmmm, that was rather inobvious, indeed.
> 
> Do you have some suggestion how to pass in the no_hwmon = false then ?
> Since tzp->no_hwmon is set to true in of_parse_thermal_zones(), the
> three drivers (stm32, rcar, rcar_gen3) seem to hack around it. I'd like
> to clean that up.

Bump ?

-- 
Best regards,
Marek Vasut
