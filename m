Return-Path: <SRS0=S9WZ=QZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C02DC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 12:59:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 39963217F5
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 12:59:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TqG3N68G"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729184AbfBRM7D (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Feb 2019 07:59:03 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35243 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbfBRM7C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Feb 2019 07:59:02 -0500
Received: by mail-wm1-f66.google.com with SMTP id y15so2372389wma.0;
        Mon, 18 Feb 2019 04:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WcWJ/OQckSMKDE7yhjt7Klya1kg9v2UZLgRttv7SDZA=;
        b=TqG3N68Gy74IkKGcejTQvOmm0F0LavYGsGQ0XwpWGWCBMJqmFaYxFm2jesgXXpSDjK
         8OChoV5PlGp3YWkDTcqPNd1AkcfI8zadGoutfxoyYO8AzHrOsRtBmU1Xr5FSayjtuBcR
         tjPImb+RqE4eLJr4JyuJKl39LAjlWRMp2SZiZM41BKC3XDIShXGyIXNR0yTCfIIZ8EsJ
         +DdJHlauaxE0Sk/cHo3sRpiskk2N7VhzsaubCmUZDiZr29DRKylA1OEdo3fINdSm511K
         lvLP3QgGPIb0y6yxs4DYjfO+4n/VKF5gg51gsPUePay0OuPdSjVOWu0iLA1UUsJkvhA3
         zN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WcWJ/OQckSMKDE7yhjt7Klya1kg9v2UZLgRttv7SDZA=;
        b=YnuBKcKaJj3+SMER+Hq6BV25jqcRbcsTbdwVxITkf4SYDZEG4jhIVgJcO7NcPPjOsg
         hczW4daxv/3FDW8b/Kd9WRS3kDJ1dGy+6W54ShWxTfwHHwK7QGHtFr0Bl8T3NYy7V7CU
         a8Ggq9TeA5uss6EOxu8ybjFK2vpvXKmT73bZ2XXw57YbfqRB3eob40s93IV+l/P4tR0/
         amc/3Zt782RSAS2KqeTqZZybucA2mbI+7CrzKE96klJZNFrFgPDnK++tzRJUdt3Rew2B
         //XuxBF510aURQW9/rtFfPnrzCI8BYXeMzbrZIRM2LaDN8hkUZOfwBqYBesE38IPXdsL
         Sktw==
X-Gm-Message-State: AHQUAubIew9cr57gNmBZtJHfF3w8WRfZ25OkeS9BbN1RArufxUp17E1U
        AfSDWTodRVN7a1WalEK67mV+y31U
X-Google-Smtp-Source: AHgI3IYXhMWHnS1DXtoQ6Kp27Qtei+iS0LdINBxVy8YObYlq7E3bBAc8bjlcm6mtWObKNfPPCWd04A==
X-Received: by 2002:a1c:be09:: with SMTP id o9mr15671857wmf.3.1550494739166;
        Mon, 18 Feb 2019 04:58:59 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id d24sm43893941wrb.47.2019.02.18.04.58.58
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Feb 2019 04:58:58 -0800 (PST)
Subject: Re: [PATCH] pinctrl: sh-pfc: Retain TDSELCTRL register across
 suspend/resume
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20190216134923.7277-1-marek.vasut@gmail.com>
 <CAMuHMdVkAEmLjUb12iNw49ecwJZU=9Cqsg_d1iEftbF6R7yd7g@mail.gmail.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <4d8e6d25-8e08-161a-8d6f-2fdb4b3a3223@gmail.com>
Date:   Mon, 18 Feb 2019 13:58:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVkAEmLjUb12iNw49ecwJZU=9Cqsg_d1iEftbF6R7yd7g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2/18/19 9:43 AM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

> On Sat, Feb 16, 2019 at 2:49 PM <marek.vasut@gmail.com> wrote:
>> The TDSELCTRL register is responsible for configuring the SDHI clock
>> return path delay and may be adjusted by the bootloader. Retain the
>> value across suspend/resume to prevent hardware instability after
>> resume.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> 
> Thanks for your patch!
> 
> Looks good to me. Two comments though.
> 
> R-Car D3 (r8a77995) also has a TDSEL register, but it is not handled by
> your patch.  Adding that would mean s/SDHI/SDHI and MMC/.

Added

>> --- a/drivers/pinctrl/sh-pfc/core.c
>> +++ b/drivers/pinctrl/sh-pfc/core.c
>> @@ -657,6 +657,10 @@ static unsigned int sh_pfc_walk_regs(struct sh_pfc *pfc,
>>                 for (i = 0; pfc->info->ioctrl_regs[i].reg; i++)
>>                         do_reg(pfc, pfc->info->ioctrl_regs[i].reg, n++);
>>
>> +       if (pfc->info->tdsel_regs)
>> +               for (i = 0; pfc->info->tdsel_regs[i].reg; i++)
>> +                       do_reg(pfc, pfc->info->tdsel_regs[i].reg, n++);
>> +
>>         return n;
>>  }
> 
>> --- a/drivers/pinctrl/sh-pfc/sh_pfc.h
>> +++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
>> @@ -176,6 +176,10 @@ struct pinmux_ioctrl_reg {
>>         u32 reg;
>>  };
>>
>> +struct pinmux_tdsel_reg {
>> +       u32 reg;
>> +};
>> +
>>  struct pinmux_data_reg {
>>         u32 reg;
>>         u8 reg_width;
>> @@ -270,6 +274,7 @@ struct sh_pfc_soc_info {
>>         const struct pinmux_drive_reg *drive_regs;
>>         const struct pinmux_bias_reg *bias_regs;
>>         const struct pinmux_ioctrl_reg *ioctrl_regs;
>> +       const struct pinmux_tdsel_reg *tdsel_regs;
>>         const struct pinmux_data_reg *data_regs;
>>
>>         const u16 *pinmux_data;
> 
> Is there any special reason why you added a new block of registers with
> separate handling, instead of adding TDSEL to the existing
> pinmux_ioctrl_reg[] arrays, which list other IOCTRL registers like
> POCCTRL?

For one, It's unrelated register to POCCTRL, so I don't want to mix them
together. The other reason is this r8a779*_pin_to_pocctrl(), which uses
the ioctrl_regs[] array ; if I added the TDSEL there, that'd just make
things extra confusing.

-- 
Best regards,
Marek Vasut
