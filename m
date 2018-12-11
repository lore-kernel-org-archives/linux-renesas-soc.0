Return-Path: <SRS0=uxQs=OU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F79C67839
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 11 Dec 2018 09:31:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 69D5020849
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 11 Dec 2018 09:31:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="EFAi9owT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69D5020849
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbeLKJbP (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 11 Dec 2018 04:31:15 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53016 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726108AbeLKJbO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Dec 2018 04:31:14 -0500
Received: by mail-wm1-f67.google.com with SMTP id m1so784592wml.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Dec 2018 01:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QiSgSEPQ/S9nZtzrabFcUG/593FRv13cI3MDG5NV71k=;
        b=EFAi9owT5E//DeAKnLOCToIacbBeNsTcCtK4S2k5uFwnlo33rhgcwfCM3kbrTAgKYl
         /KlMdLV3NClhWHOvNtxOYYPMwsbn2hFxJcYXq7HlYzwVxYc/6/8J9Qrw8QLPC4Qqa2MD
         eXJHG8E+u3UToJSdj/+6CyCWfgu1e23kJaDLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QiSgSEPQ/S9nZtzrabFcUG/593FRv13cI3MDG5NV71k=;
        b=pozOENoSitA4F48XJo8Qhcqp7NtuGN2Cn9Sg0gjxLXhkBqfj+n6R+W1gCayEs1j1b3
         ESfasJQR/mS0dBrEwZt1/YAVhGI3cDlyV7puQRUHISweABV0xX9InjP20Eu9u4bKgKvp
         BX9EoRUQjfmybe4fdgfLQOpVlsSPb8jXfxRpkpt3uEBaXTgAgB/8Q+UuA2RkdFbbMkOY
         KfOxLg1zO7AZYo3zv3/dnn4KE2PusaXV6XaxuTneQ552dwOAd6M7tSGmrt6x7x/P/QbE
         EhwsMxuJvFG5BWLfq7Wk4QhZ+vXXu1W/6nSIelozUUMlXvDMQxuXll+Kx1Z8OWKkmBER
         DKJg==
X-Gm-Message-State: AA+aEWY1q4VNMdu+IuMGVrYBM8apUR+EiW8zIxO7/xlMRC+Z00hFM+2z
        JImAUVfRi+sURACuAVSiuUd5tet250o=
X-Google-Smtp-Source: AFSGD/UG/AxaXRLVIz2BRHBzuksw1+oT+wrSK7QwrQl1Ly8ORB7kAgS4eim2buyKM3DeUYbTqsUfmA==
X-Received: by 2002:a1c:e90c:: with SMTP id q12mr1507082wmc.12.1544520672437;
        Tue, 11 Dec 2018 01:31:12 -0800 (PST)
Received: from [192.168.86.29] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id 199sm1357148wmh.21.2018.12.11.01.31.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Dec 2018 01:31:11 -0800 (PST)
Subject: Re: [PATCH v2] nvmem: check invalid number of bytes in
 nvmem_{read,write}()
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
References: <1544455701-5720-1-git-send-email-biju.das@bp.renesas.com>
 <eb72f5b7-2920-b3b5-8387-d2b6b2d310cd@linaro.org>
 <OSBPR01MB2103C137219528C37165A317B8A60@OSBPR01MB2103.jpnprd01.prod.outlook.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <ca6c023b-e8a2-09c8-6931-99f9d7b70afe@linaro.org>
Date:   Tue, 11 Dec 2018 09:31:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <OSBPR01MB2103C137219528C37165A317B8A60@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
Message-ID: <20181211093110.5SfRplDuas6wYNXMqfpwuBaNJnCo7fs508295Kh9lJk@z>



On 11/12/18 08:16, Biju Das wrote:
> Hi Srini,
> 
> Thanks for the feedback.
> 
>> Subject: Re: [PATCH v2] nvmem: check invalid number of bytes in
>> nvmem_{read,write}()
>>
>>
>>
>> On 10/12/18 15:28, Biju Das wrote:
>>> +/* Stop the user from writing */
>>> +if (offset >= nvmem->size)
>>> +return -ENOSPC;
>>> +
>> This should be "return -EFBIG" to make utilities like dd or sh happy.
>>
>> Look at 38b0774c0598c ("nvmem: core: return EFBIG on out-of-range
>> write") for more info.
> 
> return -ENOSPC also make dd or sh happy. Please let me know which is appropriate by the below results. Based on your feedback, If needed, I can send a patch with "return -EFBIG"
> 

Lets stay with -EFBIG for now! given the fact that it was already in the 
old code!


--srini

> With -ENOSPC
> ------------
> dd if=1.bin of=/sys/bus/nvmem/devices/pcf85x63-0/nvmem bs=1 count=2
> dd: writing '/sys/bus/nvmem/devices/pcf85x63-0/nvmem': No space left on device
> 2+0 records in
> 1+0 records out
> 
> echo "1234" > /sys/bus/nvmem/devices/pcf85x63-0/nvmem
> -sh: echo: write error: No space left on device
> 
> with -EFBIG
> ------------
> dd if=1.bin of=/sys/bus/nvmem/devices/pcf85x63-0/nvmem bs=1 count
> dd: writing '/sys/bus/nvmem/devices/pcf85x63-0/nvmem': File too large
> 2+0 records in
> 1+0 records out
> 
> echo "1234" > /sys/bus/nvmem/devices/pcf85x63-0/nvmem
> -sh: echo: write error: File too large
> 
> Regards,
> Biju
> 
> 
> 
> 
> [https://www2.renesas.eu/media/email/unicef.jpg]
> 
> This Christmas, instead of sending out cards, Renesas Electronics Europe have decided to support Unicef with a donation. For further details click here<https://www.unicef.org/> to find out about the valuable work they do, helping children all over the world.
> We would like to take this opportunity to wish you a Merry Christmas and a prosperous New Year.
> 
> 
> 
> Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, Buckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered No. 04586709.
> 
