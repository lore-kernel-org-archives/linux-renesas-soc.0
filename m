Return-Path: <SRS0=lhsG=QE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA96C282C8
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Jan 2019 12:10:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0DB86214DA
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Jan 2019 12:10:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJYDDCyJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbfA1MKP (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 28 Jan 2019 07:10:15 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38115 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726766AbfA1MKP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Jan 2019 07:10:15 -0500
Received: by mail-wr1-f66.google.com with SMTP id v13so17738844wrw.5;
        Mon, 28 Jan 2019 04:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gANamHQGD3U2UwZ54+50YgDOCJQSu76mtIA6Q8LOl7E=;
        b=BJYDDCyJOXTGwB27f9bl3fkgKtIQ1UXWaOavi8bHMQCxK9dpzA0bgS9r6Dppv3MvB0
         W7/yTtYjFWoPa6qDF/F5iJxwVrTkDb5JLLYzoUPvk7sJwANVRe4HkWrRhNOW5Hox7qKC
         NQkq4ia714SsefYkC5pU3gV9JWCQO+/3YADBRMbaE9zC0Xgb0ez7TLttswVjG9eV8KpC
         v46sCO4mgrHWE36IdhyJJZZpf1NX1mt/PlNGmhB7SreaP+gpDuKmFRCZeTXAOUBzcVbU
         8F39PQIarH1QXOxTFlbcNmnTeOSLZLtkzh0g1pvObQ4WeTajl6swIMZFL5drUVvmte5J
         F4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gANamHQGD3U2UwZ54+50YgDOCJQSu76mtIA6Q8LOl7E=;
        b=Qs5mtCDEeHEm2oDnUp54pXWwzh/3Jhe0i/0+DrVj7/qJNYruZssDX4SG53EJX61suw
         GnimQphed5A9Sav19dTU+AX5zNwbxOYuDzD57uuLXNnvnsPwxGaxx1UqR1RQFNCVgiSR
         8TZQrBVFmeIkic7Fv50pK9LW3O9PIKwktXdrT1J/q3dyKjatGB1nIaXXgnTUNjHCxD9Q
         YmL5MuR4Y6lHqHojrQi3O1aaqkx3wu+GFay7rvRjrS5t9KTNFqAFGr9/OC+liUPfBX8u
         gf73S5qmUSXRgzrVetxSNu6dnJEH8DhDalikS1FQ7HVO85uii0l8tv1GtCv/W5HUyCsf
         lY6g==
X-Gm-Message-State: AJcUukd5CT9MhtjKMHnGGUET8ToywgLKzXE53k8o9Sgkp1WG415F/7aa
        fgYL4y2T1I/JL5jURhb0LFA=
X-Google-Smtp-Source: ALg8bN7lrw1ipaGolu9yIMqsjNM4QCIsbdsxY8AL7PN5dTQsdB1M0lbNN8SXIN1xoBGdeQqG5XhACw==
X-Received: by 2002:a5d:694d:: with SMTP id r13mr20702326wrw.323.1548677413523;
        Mon, 28 Jan 2019 04:10:13 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id x15sm152462392wrs.27.2019.01.28.04.10.12
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Jan 2019 04:10:12 -0800 (PST)
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
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <2b24720c-c649-44e0-0337-c8a52c78d33d@gmail.com>
Date:   Mon, 28 Jan 2019 13:10:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <a4aa607d-f83a-2ed4-09c2-fdcba308664d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 1/15/19 1:35 AM, Marek Vasut wrote:
> On 12/22/18 3:19 AM, Marek Vasut wrote:
>> On 12/18/2018 10:44 PM, Eduardo Valentin wrote:
>>> On Mon, Dec 17, 2018 at 04:56:41PM +0100, marek.vasut@gmail.com wrote:
>>>> From: Marek Vasut <marek.vasut@gmail.com>
>>>>
>>>> Register hwmon sysfs interface in thermal_zone_of_sensor_register_param()
>>>> in case thermal_zone_params->no_hwmon is set to false. This behavior is
>>>> the same as thermal_zone_device_register().
>>>>
>>>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
>>>> Cc: Eduardo Valentin <edubezval@gmail.com>
>>>> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>>> Cc: Zhang Rui <rui.zhang@intel.com>
>>>> Cc: linux-renesas-soc@vger.kernel.org
>>>> To: linux-pm@vger.kernel.org
>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>> ---
>>>> V2: No change
>>>> V3: - Work around the From line and SoB line checkpatch warning
>>>>     - Reorder the SoB line at the end
>>>> ---
>>>>  drivers/thermal/of-thermal.c | 12 +++++++++++-
>>>>  1 file changed, 11 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/thermal/of-thermal.c b/drivers/thermal/of-thermal.c
>>>> index e1a303a5698c..5ccff7b678de 100644
>>>> --- a/drivers/thermal/of-thermal.c
>>>> +++ b/drivers/thermal/of-thermal.c
>>>> @@ -15,6 +15,7 @@
>>>>  #include <linux/string.h>
>>>>  
>>>>  #include "thermal_core.h"
>>>> +#include "thermal_hwmon.h"
>>>>  
>>>>  /***   Private data structures to represent thermal device tree data ***/
>>>>  
>>>> @@ -521,8 +522,15 @@ thermal_zone_of_sensor_register_params(struct device *dev, int sensor_id,
>>>>  		if (sensor_specs.np == sensor_np && id == sensor_id) {
>>>>  			tzd = thermal_zone_of_add_sensor(child, sensor_np,
>>>>  							 data, ops);
>>>> -			if (!IS_ERR(tzd))
>>>> +			if (!IS_ERR(tzd)) {
>>>> +				tzd->tzp = tzp;
>>>
>>> So, here you will overwrite what was done in of_parse_thermal_zones().
>>> That means, after this point, property like sustainable power, slope and
>>> offset are gone.
>>
>> Hmmmmm, that was rather inobvious, indeed.
>>
>> Do you have some suggestion how to pass in the no_hwmon = false then ?
>> Since tzp->no_hwmon is set to true in of_parse_thermal_zones(), the
>> three drivers (stm32, rcar, rcar_gen3) seem to hack around it. I'd like
>> to clean that up.
> 
> Bump ?

Bump again, any suggestions ?

-- 
Best regards,
Marek Vasut
