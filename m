Return-Path: <SRS0=gd9z=OY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFFB5C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 02:08:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D710B206E0
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 02:08:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iD6UsdUN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730019AbeLOCIM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Dec 2018 21:08:12 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37451 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727778AbeLOCIL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Dec 2018 21:08:11 -0500
Received: by mail-wr1-f68.google.com with SMTP id s12so6685087wrt.4;
        Fri, 14 Dec 2018 18:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=W38T/bXl7lqbsVWQK8+jWTDvVzI2IivUnATr8hb9bUc=;
        b=iD6UsdUN/4lSz0wRIRpJITqIW/4SqdeHimCMH522owzzAdS4nk5L6k+hfDKHIy5PfN
         Zs0u7urjNIwsAFlwrZW0c9tE0vrcyYL7Z9/0hQ8eQooy0nTxDj8Ufo84PpXb3x+8KKV6
         dnJ2vipzVorQ9ecNgbcF55kdeoEu+pQzZbqpKyLymAk5Hu1+rZD2gkfM5PnqUV9lF/bn
         iTLtgfpiOK6vnSHUu1d+1JrBMmhVn0HJxeJa+d0CMt45IecO8yz0vq3RPtKHWLO4bSvB
         bvP3gT4fvWSaZQuYIJJH41LVIXMosTb8ULGp4TfPa2UzCeshUZXbWFobZqti4YrTs7Xy
         KpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=W38T/bXl7lqbsVWQK8+jWTDvVzI2IivUnATr8hb9bUc=;
        b=Vfqgs47coZen8qZ4X/GkrG5TuNKi/yPugYi1WyBm6e29bg3f7aM/sKuAA5601S8TVt
         QNrd5rrkB7U7g3asF14nBF0ZGX4X1a8GbksGs3sP3eC5xNgZUJW1qmN/rVBU1UQOUUWL
         Fk7D+y0t3lYJ4HDYwUscI860s+l3ndFpik2J2QEVlC9hAn5cAz+R6k8OF7ue4frUOjXL
         O7ZkaJRsuqzQ4zMkCXZCrRNk/m60U/NHTNH/McwvwnFOJ2dyNCg21ehXd+plst5J9T7m
         cd6js3wlrolAEgH00ycas1riBpB9YMTxAQ02a0qyVkv2U71w2yMM2Lzh1Q7HpMeAIrwC
         TO+g==
X-Gm-Message-State: AA+aEWY0xZVqJT+PmvAskzIuiTeUXshTguQP60zxaGAs3iUSjx79KQIW
        94TuwhU4idLmt03DsyaMTDI=
X-Google-Smtp-Source: AFSGD/WkNFpptRJlF+dro4Hk94CLsIr9sdnsPPkf1BI39lygDyLL6DB91yjPneHIlxeQnnwId9mEIQ==
X-Received: by 2002:adf:edc1:: with SMTP id v1mr4315264wro.105.1544839689467;
        Fri, 14 Dec 2018 18:08:09 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id v6sm5378003wro.57.2018.12.14.18.08.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Dec 2018 18:08:08 -0800 (PST)
Subject: Re: [PATCH 0/6] thermal: Align
 devm_thermal_zone_{device,of_sensor}_register
To:     Eduardo Valentin <edubezval@gmail.com>
Cc:     linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>
References: <20181212014927.25840-1-marek.vasut+renesas@gmail.com>
 <20181215020228.GB24528@localhost.localdomain>
From:   Marek Vasut <marek.vasut@gmail.com>
Message-ID: <38421cfe-7688-88b1-7832-12c058b30124@gmail.com>
Date:   Sat, 15 Dec 2018 03:08:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20181215020228.GB24528@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/15/2018 03:02 AM, Eduardo Valentin wrote:
> On Wed, Dec 12, 2018 at 02:49:21AM +0100, Marek Vasut wrote:
>> This patchset attempts to align devm_thermal_zone_{device,of_sensor}_register()
>> functions and allow passing tz params to devm_thermal_zone_of_sensor_register()
>> to allow settings no_hwmon params without digging into the tz structures.
>>
>> The approach is as follows:
>> 1) Add {devm_,}thermal_zone_of_sensor_register_params(), which behaves just
>>    like the old variant without _params() suffix, except it takes the struct
>>    thermal_zone_params as an argument. The old _params()-less version of the
>>    function is converted to use the new function and pass params = NULL.
>>    The old _params()-less versions of the functions are retained to avoid
>>    breaking the ABI.
>> 2) Add the no_hwmon handling into thermal_zone_of_sensor_register_params(),
>>    that's patch 3.
>> 3) Convert drivers from devm_thermal_zone_of_sensor_register() with structure
>>    diggings to devm_thermal_zone_of_sensor_register_params() without any
>>    extra structure digging, that's the rest of the patches.
>>
>> Marek Vasut (6):
>>   thermal: split thermal_zone_of_sensor_register{,_param}()
>>   thermal: split devm_thermal_zone_of_sensor_register{,_param}()
>>   thermal: Register hwmon in thermal_zone_of_sensor_register_param()
>>   thermal: stm32: Convert to
>>     devm_thermal_zone_of_sensor_register_params()
>>   thermal: rcar_thermal: Convert to
>>     devm_thermal_zone_of_sensor_register_params()
>>   thermal: rcar_gen3_thermal: Register hwmon sysfs interface
>>
> 
> Fix the errors reported by the bot and also please run checkpatch.pl on
> your series.

Working on it right now. Can you look at the 0001...0003 patches and
tell me if this is a valid approach ?

-- 
Best regards,
Marek Vasut
