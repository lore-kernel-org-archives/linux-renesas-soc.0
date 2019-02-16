Return-Path: <SRS0=vwki=QX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C02B1C43381
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Feb 2019 15:02:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 87ADF222E0
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Feb 2019 15:02:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rCJLNSxH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727687AbfBPPCI (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 16 Feb 2019 10:02:08 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35633 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727151AbfBPPCH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 16 Feb 2019 10:02:07 -0500
Received: by mail-wm1-f66.google.com with SMTP id t200so12512462wmt.0;
        Sat, 16 Feb 2019 07:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Q0760mmpkLKOo1Xr+ZidDwF+OwAW8F1E9C6SNSrj/Yw=;
        b=rCJLNSxHzt/qWXsYvk7O8ZXDNoYwGQGHjv6FN+kHF3WAmW5SsZXFsX0b5aC+drteht
         2UpEIYDZqxC5IJmCJ5/o+6+dRNta4ndcx0FTlh/aGQ51Rb1bNi4ERKYMW00C9UQI5iaT
         YT02S8JJCo4b6OdNmDjXIMS/rc34csXGcUQ8CgiUPSwo/TksuvlXIA3bPBpp/ub02aQi
         p48JX1oUa5ylYTIpnLcVSw2lGFCFySleDqj6qcGHbKD8vwgp06G2TQ4zwmgjtXSouNhy
         79fl/iYYsr39W/QfFqovH992NQiRIaswPw5gTmKNf3H7X/5b16lAzYtcT+kktKJ4XHCd
         okxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Q0760mmpkLKOo1Xr+ZidDwF+OwAW8F1E9C6SNSrj/Yw=;
        b=N3dew5GunFAnnwswHvV2VFWzcjid81NJsbX64gOetEBQT/hd0UJCJfM1eTKiD2onsY
         YUqLKCNRx86DTw7sR/w+5WJDfgFSzbcejmf6HepGXePSGThPPUaFvMS4h/H4UTix6vPB
         SqlPydC0Rje1Kr9QteEjeucrGsAoQprPi/6u1wIhipkkh5whjQLsng7zoGO8koCLzynW
         +GUypwtkYEJa7Qmn53H3OccXuuw842mr0Uj8O5x6AyuYTvyPCv7BQpR4NauOkjfPthFc
         GzbeSrQrYYnOYHPtd2wI9EX5gK3mqCHrScyaRIhn0qEF2Sd6tap0huXI5e8FBewHllM2
         Vc7Q==
X-Gm-Message-State: AHQUAuYY0GMegb9G2X3HXvkEzx/J51KwyhHD+sv0096QB1xzKeLRag7x
        sDLAJhYdm6Yo9qbii8sEvoo=
X-Google-Smtp-Source: AHgI3IYpiFxakuBfYzZGFjzaNuFxCQCsi7rNVdO1/q8sqZf2gVcLvdKSUq+MVe2FJBwWsgCVPNSPPQ==
X-Received: by 2002:a1c:7fcb:: with SMTP id a194mr10322077wmd.51.1550329325395;
        Sat, 16 Feb 2019 07:02:05 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id w23sm9352461wmc.38.2019.02.16.07.02.04
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Sat, 16 Feb 2019 07:02:04 -0800 (PST)
Subject: Re: [PATCH] gpio: of: Apply regulator-gpio quirk only to enable-gpios
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-gpio@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jan Kotas <jank@cadence.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
References: <20190216134627.1601-1-marek.vasut@gmail.com>
 <20190216140432.u3gw33vvqe4njrgn@ninjato>
 <837a9193-3024-23bf-c6a3-304904d3dba1@gmail.com>
 <20190216144742.rvitloqjzf7towgy@ninjato>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <f4ee262c-16d2-cbb2-7717-2ca511b87361@gmail.com>
Date:   Sat, 16 Feb 2019 16:02:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190216144742.rvitloqjzf7towgy@ninjato>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2/16/19 3:47 PM, Wolfram Sang wrote:
> On Sat, Feb 16, 2019 at 03:06:55PM +0100, Marek Vasut wrote:
>> On 2/16/19 3:04 PM, Wolfram Sang wrote:
>>>
>>>> +	    !strcmp(propname, "enable-gpio") &&
>>>
>>> I haven't looked at the actual issue, but one minor nit I usually have:
>>>
>>> I think 'strcmp() == 0' is easier to read since the above is too easy to
>>> be mistaken as "if not equal". I have just been bitten again by this
>>> after a long day, although I should know better... :/
>>
>> Note that I just followed the coding style in the rest of the function,
>> if we want to update the coding style the gpiolib, that's for separate
>> patch.
> 
> Fair enough.
> 
Could be something Gustavo can look at, since he seems to be doing a lot
of automated cleanups ?

-- 
Best regards,
Marek Vasut
