Return-Path: <SRS0=9PEr=O7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FROM,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED2F3C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 22 Dec 2018 02:20:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BC61421927
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 22 Dec 2018 02:20:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ps0/B0SE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730402AbeLVCUp (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 21 Dec 2018 21:20:45 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34893 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbeLVCUp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Dec 2018 21:20:45 -0500
Received: by mail-wm1-f66.google.com with SMTP id c126so7338247wmh.0;
        Fri, 21 Dec 2018 18:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=p8bJ1sjlW7PZMLWTZWEcpqPsSKl1ta+2A40yc7QVSHk=;
        b=ps0/B0SEMq7lfS4d1ieRS+ChlFJ7yyC5VrgSNVS4mi+6Z3LFzEbrq9XGLlP4sImkkA
         oNr/6HbK+pwoR7NpVlzS4+SZUZmaH3vflYQZC9eXmke/PW6+K/tkNtveuWmr/NLHSLgD
         iaz3baSA4ERMXjSjfyDn6QuKEq4kPh3f2MMXCb3cxX7V/2JO3n5Kno4XyqRUx0m2fUTK
         N9eLiWt0kfoN1igl1ct5ihhXEcYRx1y6Bl2P5hWnokSAw47i/uQE0mrHn9KaZT0PHCO3
         HB48mPvuQwB7nRBZ61g5cPFNC0JTshKIemTI2HQa959hPociTRK6j1C77IDvipuPtZkE
         pyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p8bJ1sjlW7PZMLWTZWEcpqPsSKl1ta+2A40yc7QVSHk=;
        b=p18/bsODlcR+FcrOhcr/Z3tL54DXfFSO7kFiw8ht2ywWAQOKOmx5RAII0zxihHALEh
         AYN54hf/UAHmQhTFo36JwJmUiWE4mwfYig2y8KlWThZEXUIbN+hupy6zphEwF3iF7Ppx
         iYEdK2L1xev3o3B+b0BG9BpDubpY4HfthkBLT8eP6BAQgblnXgemIWFnJ64cAzx/wbsj
         adtf3AV9SxSgRnm22W5tTVRV8U6K/2GD+1BMmTaZfsw2f6w7aMAGYYlmdefrSY82+DRR
         CvZxuN2Te6BAKyuT6AnCptxR9xU+5jDvFs3CM/+kKmltKDOvP4w0+bP5gjcUIGJXvlic
         ybPw==
X-Gm-Message-State: AJcUuke9+2dVN7Auku13Ufi9R1I6AqgqIYgyyQar0MVFG9aNYSyIy4iB
        I+BtVtrsVSD2jv0VFr0UzDw=
X-Google-Smtp-Source: AFSGD/XG/ZNAlE9+4UBNhqgHXIruDv/luf0koZIqqZyoPUDI5HnzSNaxaSgM+4mLNvziBZjtl9vKyA==
X-Received: by 2002:a7b:c397:: with SMTP id s23mr2806590wmj.127.1545445242836;
        Fri, 21 Dec 2018 18:20:42 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id y34sm34144513wrd.68.2018.12.21.18.20.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Dec 2018 18:20:42 -0800 (PST)
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
From:   Marek Vasut <marek.vasut@gmail.com>
Message-ID: <867ffa18-9c16-685a-7c83-7534bc14e41d@gmail.com>
Date:   Sat, 22 Dec 2018 03:19:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20181218214439.GB8850@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/18/2018 10:44 PM, Eduardo Valentin wrote:
> On Mon, Dec 17, 2018 at 04:56:41PM +0100, marek.vasut@gmail.com wrote:
>> From: Marek Vasut <marek.vasut@gmail.com>
>>
>> Register hwmon sysfs interface in thermal_zone_of_sensor_register_param()
>> in case thermal_zone_params->no_hwmon is set to false. This behavior is
>> the same as thermal_zone_device_register().
>>
>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
>> Cc: Eduardo Valentin <edubezval@gmail.com>
>> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Cc: Zhang Rui <rui.zhang@intel.com>
>> Cc: linux-renesas-soc@vger.kernel.org
>> To: linux-pm@vger.kernel.org
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>> ---
>> V2: No change
>> V3: - Work around the From line and SoB line checkpatch warning
>>     - Reorder the SoB line at the end
>> ---
>>  drivers/thermal/of-thermal.c | 12 +++++++++++-
>>  1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/thermal/of-thermal.c b/drivers/thermal/of-thermal.c
>> index e1a303a5698c..5ccff7b678de 100644
>> --- a/drivers/thermal/of-thermal.c
>> +++ b/drivers/thermal/of-thermal.c
>> @@ -15,6 +15,7 @@
>>  #include <linux/string.h>
>>  
>>  #include "thermal_core.h"
>> +#include "thermal_hwmon.h"
>>  
>>  /***   Private data structures to represent thermal device tree data ***/
>>  
>> @@ -521,8 +522,15 @@ thermal_zone_of_sensor_register_params(struct device *dev, int sensor_id,
>>  		if (sensor_specs.np == sensor_np && id == sensor_id) {
>>  			tzd = thermal_zone_of_add_sensor(child, sensor_np,
>>  							 data, ops);
>> -			if (!IS_ERR(tzd))
>> +			if (!IS_ERR(tzd)) {
>> +				tzd->tzp = tzp;
> 
> So, here you will overwrite what was done in of_parse_thermal_zones().
> That means, after this point, property like sustainable power, slope and
> offset are gone.

Hmmmmm, that was rather inobvious, indeed.

Do you have some suggestion how to pass in the no_hwmon = false then ?
Since tzp->no_hwmon is set to true in of_parse_thermal_zones(), the
three drivers (stm32, rcar, rcar_gen3) seem to hack around it. I'd like
to clean that up.

-- 
Best regards,
Marek Vasut
