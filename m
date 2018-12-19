Return-Path: <SRS0=oRiM=O4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 611A6C43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Dec 2018 23:25:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 29FFC20873
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Dec 2018 23:25:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmBwJo/H"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728491AbeLSXZV (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 19 Dec 2018 18:25:21 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38286 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727383AbeLSXZV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Dec 2018 18:25:21 -0500
Received: by mail-wm1-f68.google.com with SMTP id m22so173574wml.3;
        Wed, 19 Dec 2018 15:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=t10sXTmxjANSjSCoMbtgONdFHbqQerHxb65qlQmMYeI=;
        b=lmBwJo/Hw6rXTaMiCPUO4uaNA7cKcSYVn+uvfXCVbedsjjNfVx6o95yepxjbbEvT9k
         C3dxzUuNH1CKfYSnPHsiOj17tXTXfRd5w5MGyeVdYA6iuFHWgXhPzZXPi1eYRk78oQGY
         NSAO4Q4snoQyiRXBN4uWSD6azX/XpXFUVTKoEpqsJearqd4XxHmhibFYAq2AQ01E5YQf
         3duwrO6rtcwQlLK8qPUExbaArNaCURiYuAg1bJ1WLAhFW2zIuESqCJV2Xfl5Bl8dn2WM
         RlYBjWSf/ilGam47+7xCIwSvnIAbaXHd/jYK+YQwjRqkrKnb9EjQzQRdXOmQ6Qqst80P
         l1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=t10sXTmxjANSjSCoMbtgONdFHbqQerHxb65qlQmMYeI=;
        b=RXQY0ATiMtb8wLYMI/8SeFO5IcIaUntmaYSwYh3TXVQzsxWGBxkW77TBmJPlIFwi8n
         Ks5uF1ZYAsmSNnvEs4mDV0Mp4AhvF9i2F9S3spJwyeHeF41yeKfVUuFPIFdKThjytlcX
         4aCMFP0T7KyS26J77eRvWNuBGKu00u2dZnfnpGDNq+WxVDLPymzoshHt3+9FB366Ctg3
         jjtELYQ8HB1EefOrsbtIAGvWr/IfetcD8C4U4sZYMMwpEsIyYW6bMkb/kKJlORzqAXRR
         Qku5r8B1hOU8kAtBgdcphlplwd447FiUIt7bm63ItlhWTGq3p9wC3tGRHgfflopRgzGN
         CghQ==
X-Gm-Message-State: AA+aEWa3gYKSRXd8EmtDCVNOolxCpNrEXjo4t5Y5RoDayOqGDJylI4ZL
        07fyGI4jYRm4ecaC+HErnxo=
X-Google-Smtp-Source: AFSGD/XcTEakA8qPggAg5umIJMD+NpoYCYeZBsoBiDKVFKqfoyKfGstP2DJzkVjMIoZBG+XyB/1O4Q==
X-Received: by 2002:a1c:7209:: with SMTP id n9mr8664732wmc.5.1545261919012;
        Wed, 19 Dec 2018 15:25:19 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id 14sm9521894wmv.36.2018.12.19.15.25.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Dec 2018 15:25:18 -0800 (PST)
Subject: Re: [PATCH V3 5/6] thermal: rcar_thermal: Convert to
 devm_thermal_zone_of_sensor_register_params()
To:     Simon Horman <horms@verge.net.au>
Cc:     linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
References: <20181217155644.29278-1-marek.vasut@gmail.com>
 <20181217155644.29278-6-marek.vasut@gmail.com>
 <20181218110557.rrkrurhuruvzfak2@verge.net.au>
From:   Marek Vasut <marek.vasut@gmail.com>
Message-ID: <67eeeefa-10a4-e7b3-244c-e82f785e592c@gmail.com>
Date:   Thu, 20 Dec 2018 00:25:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20181218110557.rrkrurhuruvzfak2@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/18/2018 12:05 PM, Simon Horman wrote:
> On Mon, Dec 17, 2018 at 04:56:43PM +0100, marek.vasut@gmail.com wrote:
>> From: Marek Vasut <marek.vasut@gmail.com>
>>
>> Convert the rcar code to devm_thermal_zone_of_sensor_register_params(),
>> no functional change.
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
> 
> As per v2:
> 
> This patch looks good to me, though I'm not sure why { } need
> to be introduced into the 4th hunk.

Because it's a multi-line code , even though it's just a single
line-wrapped function call. I can drop that part, but I think it makes
it visually far more obvious where the conditional block starts/ends and
I recall seeing something about this in kernel coding style too.

[...]

>> @@ -554,16 +554,20 @@ static int rcar_thermal_probe(struct platform_device *pdev)
>>  		if (ret < 0)
>>  			goto error_unregister;
>>  
>> -		if (chip->use_of_thermal)
>> -			priv->zone = devm_thermal_zone_of_sensor_register(
>> +		if (chip->use_of_thermal) {
>> +			priv->zone =
>> +				devm_thermal_zone_of_sensor_register_params(
>>  						dev, i, priv,
>> -						&rcar_thermal_zone_of_ops);
>> -		else
>> +						&rcar_thermal_zone_of_ops,
>> +						&rcar_thermal_params);
>> +		} else {
>>  			priv->zone = thermal_zone_device_register(
>>  						"rcar_thermal",
>>  						1, 0, priv,
>>  						&rcar_thermal_zone_ops, NULL, 0,
>>  						idle);
>> +		}
>> +
>>  		if (IS_ERR(priv->zone)) {
>>  			dev_err(dev, "can't register thermal zone\n");
>>  			ret = PTR_ERR(priv->zone);
[...]

-- 
Best regards,
Marek Vasut
