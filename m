Return-Path: <SRS0=7Xuf=PR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC46C43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 12:49:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0A02F206B6
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 12:49:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZTSxkqtI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730439AbfAIMta (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 9 Jan 2019 07:49:30 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50951 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730409AbfAIMta (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jan 2019 07:49:30 -0500
Received: by mail-wm1-f65.google.com with SMTP id n190so7511207wmd.0;
        Wed, 09 Jan 2019 04:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wcBNaca/Qk9n+SjvifhK9ulpTQ+WQ8/cjJpk1MT8KgM=;
        b=ZTSxkqtIJhN6+PVuW2LQYYcHnPNPwwoAi7hbBBnCsGHXDEi02FwiNR8LXeTig/7vzS
         5xEpiFBboYHQNWt7jIcbvJeF0ZSaabiVUh9Hr4aluowbp5ozbhjzO3KPuck2kPwmSNUV
         lSEG2HkLGKiweNfL6DrUU8MRv+aWrR9FZaXj77wNvOlBHogQ8ylxjaHXa2hzqBUdvHlv
         IsMygolaiGQbuRNltz9OczJclhH6UeUxRsj8NfUFAYv3vOtGYJx78XjAiMDgfHeHGrbz
         bVX5ycFeFjyx+IQsubuOcm2QBRgkRa7/bqkeOo2Ru9OsRM4uVkp0Kc9KWOihx1BPOOZe
         gNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wcBNaca/Qk9n+SjvifhK9ulpTQ+WQ8/cjJpk1MT8KgM=;
        b=uinuFeWJsz7jzywf57/06R7Moeq6Z266dcjwsEmwqmYT7b25Nqq66t2eHgGzxPcvdZ
         KcBLoCvXiYbS2sZ8D2C2etUFJO6RPk8orww8P5LsmyQ7dKW3YhofO7ZEmx30SVMk5l+p
         pfXVcrSO3R7H4CDT+QgZDeIaE5tOkOHKbamJC/emAaDrtYlWadT79C/e/Emd7FmmiWGa
         UJJ24X9cIcjExmoNwmnLqMOpFOlHy8xRFtDqgIT9a9BAzATLVrqi4zQR7N/gDFAomxIC
         jgVrXvjW2w3ctwBIMV/D+zbtyPeLDoDE9VhTCsystSCxOBmKEB3HejL8HlKvP4pJeByS
         9ofg==
X-Gm-Message-State: AJcUukcXvfQwP7CaV3kXbD5FvG2sfhVr4SJRh12jX4q+CL6i94qkg1aD
        26pcaqdhT1P/cOri3KJNc/E=
X-Google-Smtp-Source: ALg8bN53Z4R0vZ855AmaXyWpO6kizzx6sQjIoej6vMUXiHmVSISC1WbO0nOtTjKqpzGv+5SsQXcSLQ==
X-Received: by 2002:a1c:bd86:: with SMTP id n128mr5469410wmf.22.1547038167785;
        Wed, 09 Jan 2019 04:49:27 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id n82sm13510377wma.42.2019.01.09.04.49.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Jan 2019 04:49:27 -0800 (PST)
Subject: Re: [PATCH V3] arm64: dts: r8a77990: ebisu: Add and enable SDHI
 device nodes
To:     Simon Horman <horms@verge.net.au>
Cc:     Wolfram Sang <wsa@the-dreams.de>, devicetree@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20181106204647.18051-1-marek.vasut+renesas@gmail.com>
 <20190109104922.z6g772vgncdqqbqt@verge.net.au>
 <20190109105754.vvqx6uvsktvxeq7a@ninjato>
 <34cd1769-f0c9-0c2b-8947-4fceca9a9fb2@gmail.com>
 <20190109123259.cpql62omcvypafdu@verge.net.au>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <a77e5b5c-fb77-3180-b382-0654eaf7b2a9@gmail.com>
Date:   Wed, 9 Jan 2019 13:49:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20190109123259.cpql62omcvypafdu@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 1/9/19 1:32 PM, Simon Horman wrote:
> On Wed, Jan 09, 2019 at 01:02:00PM +0100, Marek Vasut wrote:
>> On 1/9/19 11:57 AM, Wolfram Sang wrote:
>>>> [    3.373714] renesas_sdhi_internal_dmac ee100000.sd: mmc0 base at 0xee100000 max clock rate 200 MHz
>>>> [    3.456829] renesas_sdhi_internal_dmac ee120000.sd: mmc1 base at 0xee120000 max clock rate 200 MHz
>>>
>>> No mmc2 initialized. That should work regardless of eMMC. Probably
>>> something wrong in the DT somewhere.
>>
>> Weird, it worked in next-20181102 with these patches, I just rechecked:
>>
>> 7818a9f06df1 mmc: renesas_sdhi: Whitelist R8A77990 SDHI
>> a05a906776f8 pinctrl: sh-pfc: r8a77990: Add voltage switch operations
>> for SDHI
>> 2cc9d3a293e9 pinctrl: sh-pfc: r8a77990: Add SDHI pins, groups and functions
>> 6b8d151613b7 pinctrl: sh-pfc: r8a77990: Add Audio SSI pins, groups and
>> functions
>> 9167b22938f7 pinctrl: sh-pfc: r8a77990: Add Audio clock pins, groups and
>> functions
>> 000cc50fc942 arm64: dts: r8a77990-ebisu: Enable HS200 of SDHI3
>> d3f59bbbf7ce arm64: dts: r8a77990-ebisu: Enable eMMC of SDHI3
>> 5928c59bff8d arm64: dts: r8a77990-ebisu: Enable UHS-I of SDHI0 and SDHI1
>> dae32a3172b8 arm64: dts: r8a77990-ebisu: Enable SD card of SDHI0 and SDHI1
>> 8feef039c6c6 arm64: dts: r8a77990: Add SDHI device nodes
>> 25e9471b6a27 (tag: next-20181102) Add linux-next specific files for 20181102
>>
>> I'll let you know once I figure it out.
> 
> Could it be related to potentially old U-Boot etc.. on the board I am using?

No, I don't think so (however, you should only use latest greatest of
course :-) ).

I see this on next/master, but not on next/20181224 right now, so I'm
bisecting it down.

-- 
Best regards,
Marek Vasut
