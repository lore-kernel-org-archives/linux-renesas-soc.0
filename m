Return-Path: <SRS0=a0xC=QF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43B68C169C4
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 29 Jan 2019 11:29:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0649620844
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 29 Jan 2019 11:29:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AD2BJppu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725804AbfA2L3F (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 29 Jan 2019 06:29:05 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41395 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725772AbfA2L3F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Jan 2019 06:29:05 -0500
Received: by mail-wr1-f66.google.com with SMTP id x10so21597088wrs.8;
        Tue, 29 Jan 2019 03:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1ccWen+rAg0i60SZjbR6qvWY9i54kSfLIcmNg0eo7fA=;
        b=AD2BJppuNm+t7odPzIxNaXZQCStGJFjQOj/bQ7uMtZVjWKtNrjwcjD7mYi+FvwcNDg
         3/zg0njY8K2PYNStcSyiw2cn6UmqNyiJ0ZZ4SxDORHrhw1t2O4OrQ/VyghtXUnndp7MI
         KzpiD0WmjbFM4y49f0aJFpXFyeXU0rD/VZgT09X/KPc/ZFdlKS7AU1Zi0dc6K/OvtVYk
         OVTS8nMNOU47nF5AGNbK4ON5sWFjcfFKWtDRnyb1BLjMUQ47ji+zBEqxvdJBzIH8GR+5
         ykRO0wHeBgVx9B9ECOnPMYGp7goEU65aq5/Xejv+0LwSXdkPmkdPuVulXV4rOvuDQs/T
         mVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1ccWen+rAg0i60SZjbR6qvWY9i54kSfLIcmNg0eo7fA=;
        b=da4b80NLKP30WTf7F7RHAcz6SQG1ALdoTR4S9zMhyED62Z0q4PV3zC37hoNnhK77TX
         x7U9qrwYEBbCJ8F9nwMJivkqj4KJSPqso4xbb46uB3IXHShiulhOax6tPleKKAlWsID4
         F1Gkm7rofW4iaZ6tJ3WNWo4hZoRJsbdipHFpBI1GYdkb7bFDuIEXK6wjZlgN/jH2xMem
         wGUZ9EVSgitn7+4I5i1peos9LXqc2nImkJaeM1mgWP7ePIJgJ9c+30bco4kHr72OnzS8
         O1HdpY9RWgoWkvlkbWMDel8XxX8sJw5edkSWoidyapqKcpxiZpN8/9mCYA1VC9jjHJKo
         tKdg==
X-Gm-Message-State: AJcUukfMv3SlgzAn2vLqWUPX3k0IbYykAROkGaWVux1XhEhtQlq+Ywoq
        vs5htgkpbDLZCbIpK5gc/ejyCR7A
X-Google-Smtp-Source: ALg8bN4bDG50JGQxa9wkxv4SaatuqJ69pOm3ImSHDQJrvxC6pkzjKylihviXnf3ImRvXn0/616OM0w==
X-Received: by 2002:a5d:4e0b:: with SMTP id p11mr27901222wrt.227.1548761343101;
        Tue, 29 Jan 2019 03:29:03 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id 124sm2967029wmh.22.2019.01.29.03.29.01
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Jan 2019 03:29:02 -0800 (PST)
Subject: Re: [PATCH] mmc: renesas_sdhi: Fix card initialization failure in
 high speed mode
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20190129054039.15278-1-marek.vasut@gmail.com>
 <CAPDyKFpa=q+oSES115SBUnpFVq+nUGwH7sY5F=go4-rZp6EasQ@mail.gmail.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <c0ae0fd2-3dbb-0e65-529e-99b78e0624f5@gmail.com>
Date:   Tue, 29 Jan 2019 10:56:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFpa=q+oSES115SBUnpFVq+nUGwH7sY5F=go4-rZp6EasQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 1/29/19 9:05 AM, Ulf Hansson wrote:
> On Tue, 29 Jan 2019 at 06:40, <marek.vasut@gmail.com> wrote:
>>
>> From: Takeshi Saito <takeshi.saito.xv@renesas.com>
>>
>> This fixes card initialization failure in high speed mode.
>>
>> If U-Boot uses SDR or HS200/400 mode before starting Linux and Linux
>> DT does not enable SDR/HS200/HS400 mode, card initialization fails in
>> high speed mode.
>>
>> It is necessary to initialize SCC registers during card initialization
>> phase. HW reset function is registered only for a port with either of
>> SDR/HS200/HS400 properties in device tree. If SDR/HS200/HS400 properties
>> are not present in device tree, SCC registers will not be reset. In SoC
>> that support SCC registers, HW reset function should be registered
>> regardless of the configuration of device tree.
>>
>> Reproduction procedure:
>> - Use U-Boot that support MMC HS200/400 mode.
>> - Delete HS200/HS400 properties in device tree.
>>   (Delete mmc-hs200-1_8v and mmc-hs400-1_8v)
>> - MMC port works high speed mode and all commands fail.
>>
>> Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>> Cc: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>> Cc: Simon Horman <horms+renesas@verge.net.au>
>> Cc: Ulf Hansson <ulf.hansson@linaro.org>
>> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Cc: linux-renesas-soc@vger.kernel.org
>> To: linux-mmc@vger.kernel.org
> 
> Is this a regression?

No, because this was broken since the beginning. But U-Boot HS200/HS400
support is now, so this bug was hidden.

> Should it be tagged for stable?

I am tempted to say yes.

-- 
Best regards,
Marek Vasut
