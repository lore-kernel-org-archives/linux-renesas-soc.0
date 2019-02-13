Return-Path: <SRS0=YTPq=QU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67B3FC282C2
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Feb 2019 08:44:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 352B5222C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Feb 2019 08:44:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tnfl9cWZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731876AbfBMIo1 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 13 Feb 2019 03:44:27 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38382 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732602AbfBMIo1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Feb 2019 03:44:27 -0500
Received: by mail-wm1-f67.google.com with SMTP id v26so1441599wmh.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Feb 2019 00:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bquKdyy4/V8+Gk4SR2G7inaXLB7NXbaiR8XLpfBhKtg=;
        b=tnfl9cWZRRpTarObJdolsCnPRE5LhqB4YF2m+PrdGwG1m/evABN5mnv/BTH4r/kjlX
         YASzz/Wils2jIfwx/Fum3r6daIpIdFuw4QOeuV7Au5hPPQVmQfoZe/ZA26+kITohxYS6
         vm9dTojyGHYkgwYzhlm1FY+Xo+sXMeE7Hq7L8e8ApBHamqmogzeA+1Kghd+Nc4tuRna9
         C1BrfIlxwBE/nY8aOTvdeLftc+TQJXp9jJnqIp4uocRriHEhMtwOlxPJWxHHEYiYZkFI
         C1CXw2iGMp3P4h3tmpLLFN8U9Ndt9TdxdJX23ROz7XrZzR2MqIrSHINouWI5FMplfp8p
         4+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bquKdyy4/V8+Gk4SR2G7inaXLB7NXbaiR8XLpfBhKtg=;
        b=FyISSeQ3AAfR9A6WLQM5AhlllGi5D8fmaU2njVUJyh1DqNtcRhcKqmIpykE1kSEiEi
         EwznFY/vdCkrmcRp7tjY1PBmGVyZb/6FXFnJpPGRk0kvtFFZQpCmUKU9+L5fVsfXpFe2
         0H3aOBXuEHkO+fv4dOP7b6sF0YFRp41nnCkY2oidmgYy9BkjmZTDj56pvSGbAhHKKMeH
         wu12XU344SuKvL/bUy9GNnKU5S+ycIS4ZNz9gtOrde9KpAMVO5Ql/uuk6gxBs1R5bqnc
         fj/+T8S1iuCdhALVzU2MQCvwgVwh5+ES/1I+LueCs63xFQXxryeTSXUAE2D+nIQT4Q2z
         H99A==
X-Gm-Message-State: AHQUAuYOYN6F3eEKG1izFIGLXNachaGbG7A0kfrdeSLXHND3ksX7LJHv
        Fyc3IHGT388Wln/MURyf5N98MW3Flp4=
X-Google-Smtp-Source: AHgI3IbBUeUQvQf45XlHZOmiqDcN/ftaeC7s/dcImy8uLeaqV8yX/ozay6vFVAykrJtvkrlZqm9FOQ==
X-Received: by 2002:a1c:4d6:: with SMTP id 205mr1723756wme.66.1550047464822;
        Wed, 13 Feb 2019 00:44:24 -0800 (PST)
Received: from [192.168.27.65] (sju31-1-78-210-255-2.fbx.proxad.net. [78.210.255.2])
        by smtp.googlemail.com with ESMTPSA id c129sm3050523wma.48.2019.02.13.00.44.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 13 Feb 2019 00:44:24 -0800 (PST)
Subject: Re: [PATCH v2 0/5] Add CMT/TMU support for RZ/G2E
To:     Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
References: <1549272007-33471-1-git-send-email-biju.das@bp.renesas.com>
 <86c16302-8f7e-52b6-d183-5a90c8a0fc85@linaro.org>
 <OSBPR01MB210392463D9EB86AE0BE8C36B8650@OSBPR01MB2103.jpnprd01.prod.outlook.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <ea8a581f-56ce-bea0-86d6-7688741c3fca@linaro.org>
Date:   Wed, 13 Feb 2019 09:44:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <OSBPR01MB210392463D9EB86AE0BE8C36B8650@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/02/2019 11:17, Biju Das wrote:
> Hi Daniel,
> 
> Thanks  for  the feedback.
> 
>> -----Original Message-----
>> From: Daniel Lezcano <daniel.lezcano@linaro.org>
>> Sent: 12 February 2019 10:03
>> To: Biju Das <biju.das@bp.renesas.com>; Rob Herring
>> <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>
>> Cc: Thomas Gleixner <tglx@linutronix.de>; devicetree@vger.kernel.org;
>> Simon Horman <horms@verge.net.au>; Geert Uytterhoeven
>> <geert+renesas@glider.be>; Chris Paterson
>> <Chris.Paterson2@renesas.com>; Fabrizio Castro
>> <fabrizio.castro@bp.renesas.com>; linux-renesas-soc@vger.kernel.org
>> Subject: Re: [PATCH v2 0/5] Add CMT/TMU support for RZ/G2E
>>
>> On 04/02/2019 10:20, Biju Das wrote:
>>> This patch series aims to add CMT/TMU timer support for RZ/G2E SoC.
>>>
>>> This patch series is tested against renesas-dev and linux-next.
>>
>> Do you want me to take the patch 1/5 and 4/5 through my tree ?
> 
> Yes, please.
> 

Both applied for 5.1.

Thanks

  -- Daniel




-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

