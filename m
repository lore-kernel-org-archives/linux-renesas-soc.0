Return-Path: <SRS0=bqQk=O5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FROM,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFEB6C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Dec 2018 23:13:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 85024218FE
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Dec 2018 23:13:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="udNZghkQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390290AbeLTXNG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 20 Dec 2018 18:13:06 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37027 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730098AbeLTXNF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Dec 2018 18:13:05 -0500
Received: by mail-wr1-f65.google.com with SMTP id s12so3411437wrt.4;
        Thu, 20 Dec 2018 15:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LwLJhh7jaurR85dooOmMa0jMR5RMPLpjLhUaG/56Au0=;
        b=udNZghkQpSkZa3ujWmCMxYsXOshovzvVQE8DBoR5l639M995mWSymTi+pbtNHq/P3P
         reSiX/1/qI3m7SbxIBBfShMSzoOOAss40q0eOsxI2MvqFNdcOT9bMLqG22JjXDlCNO5I
         kkaPV3IaZJFXVtjQONhGev4DQvdvaiDqetjM4Cq/heWu80D7JeckWZmBIMywu5+kESse
         v4hFZdW6px6ujUwfFBqVwff5FSnDvYrksrsGUbPkv7IDE5/PafZ45aftpDwBCdRIuTK+
         WDrpJ7F1cy9pMSa1qm9z0l52R4Tr7rRisiWPoTfCq7JAbQTAKJ0OwPBuuFuIECfCz1f1
         EK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LwLJhh7jaurR85dooOmMa0jMR5RMPLpjLhUaG/56Au0=;
        b=TKo+FT8jQAsuibpE6pPkMpH1YQ8azQaXaRYDoeYPHvUJa0KwKINQ0NQXmPXPhIL+kK
         bVoT2VlkG2wEWiT4vcPlzIWHGO47ylsJ6XFqRPEYwRJJN5N2EcSwAfwyN06AZgZuHwGL
         6OpAC8OA/Jg3mAM2K5/4sf8vvmdO08zXVPhbRmT0cjOwrU/OprkvyFslvDpbE9JLAJUJ
         vfPtuZS4grt/Cj2u6qrpdwyzyDQ04VghpDeAbio66HxzBXeFSEz1jhWd1IhKSXubuvqY
         YC9zeiR4jKAQkOy4JxI7/giSjsLgeQyEdoynYtu7d07WxNmv7v+3HdBRZprue00HT1TM
         KJMQ==
X-Gm-Message-State: AJcUukcr6cHDD7r/gY+O3xMTz4bkGOKMtkm8w07K21ED4beIctM4JBc4
        9a3/EBsh73q9bS66Su67FmM=
X-Google-Smtp-Source: ALg8bN4+QWnAhTkBbPvzm1lH5vmt+gRbivDkx2FSgZbRBIRyZkwwpZUkDrlzK3gnsygGqJvLj3KAwQ==
X-Received: by 2002:adf:a743:: with SMTP id e3mr123553wrd.56.1545347583776;
        Thu, 20 Dec 2018 15:13:03 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id l37sm17236957wre.69.2018.12.20.15.13.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Dec 2018 15:13:02 -0800 (PST)
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
 <67eeeefa-10a4-e7b3-244c-e82f785e592c@gmail.com>
 <20181220074620.x54vni4lextgbsyf@verge.net.au>
From:   Marek Vasut <marek.vasut@gmail.com>
Message-ID: <8cd13548-1783-93f4-deea-c7de30a1f4bd@gmail.com>
Date:   Fri, 21 Dec 2018 00:13:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20181220074620.x54vni4lextgbsyf@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/20/2018 08:46 AM, Simon Horman wrote:
> On Thu, Dec 20, 2018 at 12:25:17AM +0100, Marek Vasut wrote:
>> On 12/18/2018 12:05 PM, Simon Horman wrote:
>>> On Mon, Dec 17, 2018 at 04:56:43PM +0100, marek.vasut@gmail.com wrote:
>>>> From: Marek Vasut <marek.vasut@gmail.com>
>>>>
>>>> Convert the rcar code to devm_thermal_zone_of_sensor_register_params(),
>>>> no functional change.
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
>>>
>>> As per v2:
>>>
>>> This patch looks good to me, though I'm not sure why { } need
>>> to be introduced into the 4th hunk.
>>
>> Because it's a multi-line code , even though it's just a single
>> line-wrapped function call. I can drop that part, but I think it makes
>> it visually far more obvious where the conditional block starts/ends and
>> I recall seeing something about this in kernel coding style too.
> 
> I lean towards removing {} but I do not feel at all strongly about this.

Well does it improve the readability if they are removed ?

>> [...]
>>
>>>> @@ -554,16 +554,20 @@ static int rcar_thermal_probe(struct platform_device *pdev)
>>>>  		if (ret < 0)
>>>>  			goto error_unregister;
>>>>  
>>>> -		if (chip->use_of_thermal)
>>>> -			priv->zone = devm_thermal_zone_of_sensor_register(
>>>> +		if (chip->use_of_thermal) {
>>>> +			priv->zone =
>>>> +				devm_thermal_zone_of_sensor_register_params(
>>>>  						dev, i, priv,
>>>> -						&rcar_thermal_zone_of_ops);
>>>> -		else
>>>> +						&rcar_thermal_zone_of_ops,
>>>> +						&rcar_thermal_params);
>>>> +		} else {
>>>>  			priv->zone = thermal_zone_device_register(
>>>>  						"rcar_thermal",
>>>>  						1, 0, priv,
>>>>  						&rcar_thermal_zone_ops, NULL, 0,
>>>>  						idle);
>>>> +		}
>>>> +
>>>>  		if (IS_ERR(priv->zone)) {
>>>>  			dev_err(dev, "can't register thermal zone\n");
>>>>  			ret = PTR_ERR(priv->zone);
>> [...]
>>
>> -- 
>> Best regards,
>> Marek Vasut
>>


-- 
Best regards,
Marek Vasut
