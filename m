Return-Path: <SRS0=E4fS=PS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C86C43444
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 14:38:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 158DA214C6
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 14:38:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JW5jSal0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729001AbfAJOiL (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 10 Jan 2019 09:38:11 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39958 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728120AbfAJOiL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jan 2019 09:38:11 -0500
Received: by mail-wr1-f68.google.com with SMTP id p4so11645563wrt.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jan 2019 06:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=I9JX4lnp24pp2ECN0iq8tzDj0oFUsykbFZAVqf68+10=;
        b=JW5jSal0EP3ZSQELqs5XX+lnsaCEf7CUQNrV/FDUrRgo3ZuJogzQWtEpGLMiE5CW/q
         z0qt48n40R62b3ZQPsbXMGNBUYEexNeRTO/vN5IQRa4+gjt7oLRIBT3ulGc9FM/O43T7
         9b5uZC6bi+s2Q7OiNsVObQqMzMvOlvkyWJiIUJlUMb75WxnDs2X/Z/8dvPlPrDn8EIsu
         O1LCxNBi2KdUAIdaGf2USOxSq5hNPZQro4cRbEFTZctIMT4WoJWLy1eo0p991xSxO8QG
         srkHNu+lvMdRNN3tgc7vlXALG8Otjc0Sb4h/Oa03UG/x128igppMlaxSwVMsTw/cZfLr
         hDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=I9JX4lnp24pp2ECN0iq8tzDj0oFUsykbFZAVqf68+10=;
        b=SJ45ubqZpQ2HyYjQJOQVqTEIMtdleQku97ocY+zXbGRdC3pw1Cgh5qSbHoYgQfIdED
         08wAaAVzrofG66qKuP0WcvJT7XVxGPWhqcQcoM5Qfnr86ljwM6ZxRn3/D19taxVoWvSQ
         pdRw99gGLzwOtYtKYTm78uNprupbR3RyNo247v64s0CiHIfnWanMswaHJ2g/cb7oWq0U
         BR2MzxFNYBiLWonI3qb8feOYM4wBeFcBArCRQE9I9CJ7s2tip5PGo/8wnatA/sNlEZsz
         R+Pp3wpardbyC22iLhBGVorpfEZ5czp3CIbDwe9e+KqzaGKi593asYadtM3K9jAf47mF
         hWFQ==
X-Gm-Message-State: AJcUukc1u/X6M0DinM28HLgQmjHA2aIZigGrPMp0GmqbFZCH5TYadB1l
        aMlwOaIEiDzoIyfMxretu/c=
X-Google-Smtp-Source: ALg8bN4Naanc64TZzoKrRPjDJXSu4t3ohP6+XcAv+fY5z+WTZ3VvrFnaKWgIvTDoWm9PThekZHDjIg==
X-Received: by 2002:a5d:63c3:: with SMTP id c3mr9377928wrw.215.1547131089609;
        Thu, 10 Jan 2019 06:38:09 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id l19sm17084065wme.21.2019.01.10.06.38.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Jan 2019 06:38:08 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: ebisu: Fix backlight
 regulator numbering
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
References: <20190109140045.17449-1-marek.vasut@gmail.com>
 <CAMuHMdX3bP_WCYNRRMmVRPwV52e72NOZMtW8cf29Fo+E9_CvcQ@mail.gmail.com>
 <20190109165822.tmj7qbho46f7clvg@verge.net.au> <1690279.yngTTxF0vm@avalon>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <0d08d3c1-94ec-dcbe-ad3d-b079ab2ad17e@gmail.com>
Date:   Thu, 10 Jan 2019 14:40:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <1690279.yngTTxF0vm@avalon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 1/10/19 1:59 PM, Laurent Pinchart wrote:
> On Wednesday, 9 January 2019 18:58:23 EET Simon Horman wrote:
>> On Wed, Jan 09, 2019 at 04:26:25PM +0100, Geert Uytterhoeven wrote:
>>> On Wed, Jan 9, 2019 at 3:01 PM <marek.vasut@gmail.com> wrote:
>>>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>>
>>>> There are two regulator1 nodes in the Ebisu DTS right now, one 3.3V for
>>>> the eMMC and one 12V for the backlight. This causes one to be
>>>> overwritten
>>>> by the other, ultimatelly resulting in inoperable eMMC, which depends on
>>>> the former. Fix this by renumbering the backlight regulator to
>>>> regulator2.
>>>>
>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>>> Cc: Simon Horman <horms+renesas@verge.net.au>
>>>> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>>> Cc: linux-renesas-soc@vger.kernel.org
>>>> Reported-by: Simon Horman <horms+renesas@verge.net.au>
>>>> Fixes: 9d16c4a10e07 ("arm64: dts: renesas: r8a77990: ebisu: Add
>>>> backlight")
>>>
>>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>
>>>> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
>>>> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
>>>> @@ -191,7 +191,7 @@
>>>>
>>>>                 clock-frequency = <24576000>;
>>>>         
>>>>         };
>>>>
>>>> -       reg_12p0v: regulator1 {
>>>> +       reg_12p0v: regulator2 {
>>>>
>>>>                 compatible = "regulator-fixed";
>>>>                 regulator-name = "D12.0V";
>>>>                 regulator-min-microvolt = <12000000>;
>>>
>>> Perhaps the node name should get a more descriptive suffix
>>> (e.g. "regulator-12p0v"), like is already done for some of the other
>>> regulators?
>>
>> I think I would prefer that addressed in a follow-up patch.
> 
> Agreed, but it would still be a very good idea. I think we need to standardize 
> names for regulators, otherwise this is bound to happen again in the future.

Isn't the YAML DT schema validator supposed to catch those problems ?
I'd even expect DTC to be able to catch such duplicate nodes and warn
about them.

-- 
Best regards,
Marek Vasut
