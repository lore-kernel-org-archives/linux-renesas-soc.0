Return-Path: <SRS0=B/Gi=OV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E537C67839
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 02:21:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C364820839
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 02:21:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJ6POhsT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C364820839
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbeLLCVl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 11 Dec 2018 21:21:41 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50676 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726361AbeLLCVl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Dec 2018 21:21:41 -0500
Received: by mail-wm1-f67.google.com with SMTP id n190so4206411wmd.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Dec 2018 18:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=r3AHpyiNSSWv+l+ISP+bj63T0ujpD3RUhj/lpKC00qM=;
        b=iJ6POhsT3u+ycaWCj2aa7vEhmVU2px+jMkwXdEyZ8by3TyOci0UI3W/OS/8KsaNmAd
         Zrw1kebJcDGZE8SWbZFaa9aFAgqUbX6HS+Joe9QYTKIrHNfTDSWsJOqlV3HZQaD80312
         vMgpLuzNDT5r9R83bPvZqxzktU3hMzmscLEqudnWURtRe9T6uuV2PQil0Q41HGOyoGgl
         F5vmdtSgkMdVcnmlkFnzhtHmn8HL9Br5cG7mzbaTSa0fx21ArxblxlagHdtgnqrYYgTb
         4jqwfcG02q9xJlZYRJeM/oun+6N/1qce2tZs14vMFWE5W2USTFVjJ9LLzN7b1ItKWeXR
         YJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=r3AHpyiNSSWv+l+ISP+bj63T0ujpD3RUhj/lpKC00qM=;
        b=OoV/hPCDLW3nNn+E58ZLWfGbSdD6racpqcPnBw5EhZjIG4PshQGV9UYn1tjf3Vcpc/
         3YA/a230JtLJLld/gfcIkITifvraNCspKmDwMHz0Ge4IPQ3UO44gdEgrDwQGjbPOW/vg
         8zk1Cp8PX2+d0/nCRcAp9c3lF06zq0ujnN56zcuG/AJKq7JJFPz/DYuB8cUBs+R+txZk
         dzVt23YWJU1xmKI3anM80VeI+0/GMnV33RU7d6noLQWXmV5vbCGHCwkPc+ZyALQvKYUC
         Ux0mr6TFb3BrYPvFhNKyO3giefWY3FBwi6N6t/7FJGybbgObm54QxDwX80eqI+O5ndYH
         ONdA==
X-Gm-Message-State: AA+aEWa/EblTIn6eW5g20l7eG30WUWooxO3drx8Gswwv7b5VMQfWxrAJ
        osQuMCBKR15qJiths1iim38=
X-Google-Smtp-Source: AFSGD/WpxgXP3CGYa8yNQjxCArGLWIY3XwtidAI2GKLO+lLhpP9NzmgOVfZyvrISA5byEONze+WDfA==
X-Received: by 2002:a1c:6e06:: with SMTP id j6mr4636266wmc.3.1544581298391;
        Tue, 11 Dec 2018 18:21:38 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id p6sm22968369wrx.50.2018.12.11.18.21.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Dec 2018 18:21:37 -0800 (PST)
Subject: Re: [PATCH] thermal: rcar_gen3_thermal: Add supports the hwmon
 thermal sysfs
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Hoan Nguyen An <na-hoan@jinso.co.jp>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        =?UTF-8?B?RHVuZ++8muS6ug==?= =?UTF-8?B?44K9?= 
        <nv-dung@jinso.co.jp>,
        =?UTF-8?B?44Kr44Kq44O744O044Kh44Oz?= =?UTF-8?B?44O744OJ44Oz?= 
        <cv-dong@jinso.co.jp>
References: <1542091543-31597-1-git-send-email-na-hoan@jinso.co.jp>
 <CAMuHMdX6rNc65oN1L4s=6NT4_yaP19vVifAgQRedbtb4uBO2aQ@mail.gmail.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Message-ID: <410c44ad-7c98-fe56-2b17-f387db3d9336@gmail.com>
Date:   Wed, 12 Dec 2018 02:52:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX6rNc65oN1L4s=6NT4_yaP19vVifAgQRedbtb4uBO2aQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/11/2018 08:42 AM, Geert Uytterhoeven wrote:
> CCing Marek, since he was recently looking into the driver
> 
> On Tue, Nov 13, 2018 at 7:46 AM Nguyen An Hoan <na-hoan@jinso.co.jp> wrote:
>>
>> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
>>
>> Gen3 thermal registered by devm_thermal_zone_of_sensor_register()
>> and this function does not enable hwmon sysfs extensions.
>> This patch enables it to keep compatibility to common systems
>>
>> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
>> ---
>>  drivers/thermal/rcar_gen3_thermal.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
>> index 75786cc..ae172db 100644
>> --- a/drivers/thermal/rcar_gen3_thermal.c
>> +++ b/drivers/thermal/rcar_gen3_thermal.c
>> @@ -19,6 +19,7 @@
>>  #include <linux/thermal.h>
>>
>>  #include "thermal_core.h"
>> +#include "thermal_hwmon.h"
>>
>>  /* Register offsets */
>>  #define REG_GEN3_IRQSTR                0x04
>> @@ -429,6 +430,12 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
>>                 if (ret < 0)
>>                         goto error_unregister;
>>
>> +               /* Enable hwmon thermal sysfs */
>> +               tsc->zone->tzp->no_hwmon = false;
>> +               ret = thermal_add_hwmon_sysfs(tsc->zone);
>> +               if (ret)
>> +                       dev_err(dev, "Can't register hwmon sysfs\n");
>> +
>>                 dev_info(dev, "TSC%d: Loaded %d trip points\n", i, ret);
>>         }

I submitted the following series [1], I think this might be a more
systematic approach to this topic than digging deep into tz structures.

[1] https://patchwork.kernel.org/cover/10725477/

-- 
Best regards,
Marek Vasut
