Return-Path: <SRS0=UKHE=Q4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB691C43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Feb 2019 09:14:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 893AE2086A
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Feb 2019 09:14:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aPOaU0Aq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbfBUJOF (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 21 Feb 2019 04:14:05 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51226 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbfBUJOF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Feb 2019 04:14:05 -0500
Received: by mail-wm1-f68.google.com with SMTP id n19so9400278wmi.1;
        Thu, 21 Feb 2019 01:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2FwZ+KmSyxfQjYvPuHaupVFMGOzJPZdtQ0rB1Bd3Foo=;
        b=aPOaU0AqlhpNiP3rjVUc0tIg7c9tSLJH+sTL4WBBBU1Ocnjbzp1OH4XW04/YAL93Ef
         qnWkojscZsA2/JUHdwWe+XWjA40m02IYwfdX5wBbBByMUCZRsOK40vSDLVbCN4vE2lHO
         M6Y1pnmci/E6ma2QFUvKB8jsY9IwAXFW/L4UUqcKNeXs2064k7wfy1OjkvEUYDKJriCT
         XDmcoSMqXFC4CXIU617T0SmrFi07Q31W/RK8jbW/Rc+oSCPz6mr0y91CpU05e3C4aIEP
         TQF+/WRJOkFKeinN9BZ7ic0izx2z3/w34ZDj/EuqcylHRGIhsu1XkhwJ7WrsuwC+zmtb
         nnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2FwZ+KmSyxfQjYvPuHaupVFMGOzJPZdtQ0rB1Bd3Foo=;
        b=jxNsRBAajJ4yxP2ecv+nt5psFm3KixzZUHlxExjLeXYrQvWDEpr3pYH4U8KHJQ23zK
         QzFdbTsrKF2BE3R4tngOgIVlIVK9PDz7SUFT7DCL5p2zGUVLubiuZ0H+Du0yXlDgjCkO
         7GxgL8lFyBWLjXc7Ro9MqrujbyUHdm8jYeNkcBUFfIhx+McpwKOCBAxiLIuVKKkDSUsL
         gVg2bQCWYJ9TTbZc2h/wCftZGi2h8D7IWNIVmva8s9sG4u+Utd+lnwKWqtN4SrKNtR04
         fl/XDtVNAIdvU3xpAQ2byTaoJAdhRuu2R37dAMXz5fI91BHf5Q2eumCDsT76Wn24ISWK
         4VpA==
X-Gm-Message-State: AHQUAuYryATFqwRoHcw3IFnWUvKCvxcZetP24I/tmlan/koU6NB2+/fp
        ilg0BZRU/TsyqTz1FjOBvCBQ0qaY
X-Google-Smtp-Source: AHgI3IZmKQM6IQpbfQgdJg0CpPi0oYHqFrR8Etkay3B/gsfR3XGwqs2pHHrn8B/JNQfy+5byf6l4Fw==
X-Received: by 2002:a7b:c08a:: with SMTP id r10mr9252565wmh.112.1550740442775;
        Thu, 21 Feb 2019 01:14:02 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id f10sm4973738wmb.35.2019.02.21.01.14.01
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Feb 2019 01:14:02 -0800 (PST)
Subject: Re: [PATCH] thermal: rcar_gen3_thermal: Register hwmon sysfs
 interface
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-pm@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
References: <20190211195620.32753-1-marek.vasut@gmail.com>
 <20190221084945.ruyyshoiy5klbpzy@katana>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <64e6e16c-d92a-32e0-e80f-eea1b944c7d6@gmail.com>
Date:   Thu, 21 Feb 2019 10:14:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190221084945.ruyyshoiy5klbpzy@katana>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2/21/19 9:49 AM, Wolfram Sang wrote:
> 
>> +static void rcar_gen3_hwmon_action(void *data)
>> +{
>> +	struct thermal_zone_device *zone = data;
>> +
>> +	thermal_remove_hwmon_sysfs(zone);
>> +}
>> +
>>  static int rcar_gen3_thermal_probe(struct platform_device *pdev)
>>  {
>>  	struct rcar_gen3_thermal_priv *priv;
>> @@ -429,6 +437,17 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
>>  		if (ret < 0)
>>  			goto error_unregister;
>>  
>> +		tsc->zone->tzp->no_hwmon = false;
>> +		ret = thermal_add_hwmon_sysfs(tsc->zone);
>> +		if (ret)
>> +			goto error_unregister;
>> +
>> +		ret = devm_add_action(dev, rcar_gen3_hwmon_action, zone);
>> +		if (ret) {
>> +			rcar_gen3_hwmon_action(zone);
>> +			goto error_unregister;
>> +		}
>> +
>>  		dev_info(dev, "TSC%d: Loaded %d trip points\n", i, ret);
>>  	}
> 
> This slipped through the cracks for me, I am sorry about that. I know it
> is applied by now but I still wonder if the above functionality couldn't
> be moved into the core as a generic helper? There is nothing R-Car
> specific in here. From what I see it could be something like:
> 
> 	devm_thermal_activate_hwmon_sysfs(dev, zone);
> 
> ?

Do you want to grow function name for each parameter to be changed ?
I don't think that scales. However, I don't have any better idea how to
deal with the hwmon thus far.

-- 
Best regards,
Marek Vasut
