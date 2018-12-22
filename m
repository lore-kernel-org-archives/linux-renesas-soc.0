Return-Path: <SRS0=9PEr=O7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FROM,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0442EC43387
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 22 Dec 2018 02:20:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BB97F21927
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 22 Dec 2018 02:20:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MwR9lfUG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729563AbeLVCUn (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 21 Dec 2018 21:20:43 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38614 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbeLVCUn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Dec 2018 21:20:43 -0500
Received: by mail-wm1-f67.google.com with SMTP id m22so7372952wml.3;
        Fri, 21 Dec 2018 18:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=q3IayNCLpuXeDPJkZH0aT5tKZuERcX79BuysqHaFJYc=;
        b=MwR9lfUGqC/HpdR1zcDfYAv78T/RaSH5isfpl7k+nMXRhlwYGIO9T3hSa2VDFyxac5
         JfXxlrFvaZitmG3cxe81TfYyfG3CrSSTiLDXP4Gjl+toV9ydvrnL3DdsjGt8rRktt2sg
         HFkICkpGLc6e07tLRzOb5Gl+MqG2y31/OUfdl+envo5uGpRqrifs4DON+yaGrYLjdl3L
         ygIl6WjzErM4aRpXcomIFDyCSHVaga9nWzTTFTHquTJ+XgXDffUn+VEF7gcVVY46oKeL
         IcFKzIgT7x5ieHEydytGr1b+JJqJemxKYypMNOiyOqeWluq4Xgn4/x3cqSdqR1JRbmqE
         docw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=q3IayNCLpuXeDPJkZH0aT5tKZuERcX79BuysqHaFJYc=;
        b=QA7QcFhRmVnRjYCbf2/NIIRTvamcdSMp2rytCED99lIe0zxDbtqxMmcZpVg6gX1XjI
         Ib2Bd3YlFT50qInsjfAWCJvvHA8WPSvfb0Rm21qYGKmjI2ML3xSnfXHk/IP0FAJMOq09
         gWvMOnjyjT/6XSWlv8GrNxlcgL9efVs91dszGfHgGHF4MwrM8fweyQewtifRvOZuOUdh
         cfbeWN3vcFyuW55x1HlD2iFDufY9WRoLUaZTOnr5c5Ibbnl/YF7D2GJhA4YokT03NcyR
         Hk0sSLeCESHfcNwebg3uNAPp/AeIbHtJCy8PL8I2MiMF4GZOTJJ8g0Hy/Aysl2sPiivU
         CjdA==
X-Gm-Message-State: AJcUukeE0ot0YQ7oJxMmDW/jWkC05VHglFMDprW4X+DU30zmGHEG/IMO
        FeVcjeLq7E4EiJ8Cenz/wiM=
X-Google-Smtp-Source: AFSGD/VCHCt4rQmUmMdo4oDD7nUti099QbweZn8eIXBh1eNBIR58CW7saY9zp8AvRWhXIkpxv4FgTA==
X-Received: by 2002:a1c:544f:: with SMTP id p15mr4799029wmi.37.1545445241258;
        Fri, 21 Dec 2018 18:20:41 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id x12sm10179947wrt.20.2018.12.21.18.20.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Dec 2018 18:20:40 -0800 (PST)
Subject: Re: [PATCH V3 3/6] thermal: Register hwmon in
 thermal_zone_of_sensor_register_param()
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
References: <20181217155644.29278-1-marek.vasut@gmail.com>
 <20181217155644.29278-4-marek.vasut@gmail.com> <20181217181227.GA1529@kunai>
From:   Marek Vasut <marek.vasut@gmail.com>
Message-ID: <d8e12a26-93b9-b7c0-f68c-ca2985cc23f2@gmail.com>
Date:   Sat, 22 Dec 2018 03:16:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20181217181227.GA1529@kunai>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/17/2018 07:12 PM, Wolfram Sang wrote:
> 
>> +			if (!IS_ERR(tzd)) {
>> +				tzd->tzp = tzp;
> 
> I tried to read the thermal core but couldn't really figure it. We are
> not leaking/overwriting the tzp pointer acquired in of-thermal.c here?

I think so, and Eduardo seem to be confirming it, albeit it's rather
inobvious.

-- 
Best regards,
Marek Vasut
