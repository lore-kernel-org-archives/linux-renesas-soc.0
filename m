Return-Path: <SRS0=S9WZ=QZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB1AC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 13:38:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BEB1A21872
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 13:38:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nXW84MMA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731186AbfBRNim (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Feb 2019 08:38:42 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54474 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727483AbfBRNim (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Feb 2019 08:38:42 -0500
Received: by mail-wm1-f66.google.com with SMTP id a62so17434657wmh.4;
        Mon, 18 Feb 2019 05:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=t2XvqVpGVmEwuCF4LL4YkH3+0Qg1IMPpo+eXQRfFHtk=;
        b=nXW84MMAUlGmyQDL4p8pwzhhlBDMvWgP26YK3WZmu0wOS4jLbshWu/JJFYoUcVVAT6
         t4WjATGI49IXzbUZ8FGzaSqgPZ2GPVna2jhpNTX+0udAF56uRpCzxvlCsqBfmmv4srEi
         ygbXeaL1TDHbhoUVad1QQJKAQTlGUdvbhPzVMHtmt0gdPAFnl3Im6X3kZpsta7JK7YzW
         JBwijkwZKQK/2cJl5PhlJpPgdxEAlWQAon3VX/v3TFHiVDvZ0pAmWT5nswNLtVOUH+1z
         D9NI1v3k/HKhOyJ0OGGOhpHr12ZGbJqhLDPSIOo2k/TU9SHFHdpkn/9b1TyAKD4g7/75
         VMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=t2XvqVpGVmEwuCF4LL4YkH3+0Qg1IMPpo+eXQRfFHtk=;
        b=RmnQGZLFhzcu6bsaio1199H3haIlnWNbXCpVZHuXqbfh2BcHBoESXggJP/vPwOqBY3
         EHGXX9i2h8W4DeLKYb02p/L88DsmNK7h7gQIdh28X+TjYkSPmp05fYBUpVH1fvD3JlLX
         tZ3hEfpPYFdi9BkeJgxV7v5/EqeJixt1kmECtX2/0ZqxUWd3ZuUR0Quvu3TbaVGwdCcq
         rXgrAxHU0FGBf0ugwXRxUO+Jfe5x+Fx9IXQ/wMo4lz6jhGw5AysZn5HIMcO0EkrFdigW
         lX8mOW2amzdjR36eDl1CGHOE+iQFUDYxuUCRqOSIYnv+6oAVH9kJRCdGl2sH1rMDRWBP
         BLYQ==
X-Gm-Message-State: AHQUAuZD/OHtF549tZEBk5s+K223vkQfbUDqjxy0ezj7UEGsOKZF6MeX
        YDdyQSY4MujTBX7zg9ayUCmJOBbO
X-Google-Smtp-Source: AHgI3IZT2KGbEba7uxAaVdCyVFsTEt4qNavJbtS7FlrG2fbTF03uHG/Jhe09qAWn7E8+HkCz+kE+Hg==
X-Received: by 2002:a1c:4301:: with SMTP id q1mr15876939wma.44.1550497119571;
        Mon, 18 Feb 2019 05:38:39 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id h142sm24482439wme.33.2019.02.18.05.38.38
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Feb 2019 05:38:38 -0800 (PST)
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
 <4d8e6d25-8e08-161a-8d6f-2fdb4b3a3223@gmail.com>
 <CAMuHMdW-596oYGuj1VXgYEn6NuARhOAttZEw4QPc+9a7MrYniA@mail.gmail.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <29913282-7343-70fc-5095-13dedd70cb5d@gmail.com>
Date:   Mon, 18 Feb 2019 14:38:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdW-596oYGuj1VXgYEn6NuARhOAttZEw4QPc+9a7MrYniA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2/18/19 2:32 PM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

[...]

>>>>  struct pinmux_data_reg {
>>>>         u32 reg;
>>>>         u8 reg_width;
>>>> @@ -270,6 +274,7 @@ struct sh_pfc_soc_info {
>>>>         const struct pinmux_drive_reg *drive_regs;
>>>>         const struct pinmux_bias_reg *bias_regs;
>>>>         const struct pinmux_ioctrl_reg *ioctrl_regs;
>>>> +       const struct pinmux_tdsel_reg *tdsel_regs;
>>>>         const struct pinmux_data_reg *data_regs;
>>>>
>>>>         const u16 *pinmux_data;
>>>
>>> Is there any special reason why you added a new block of registers with
>>> separate handling, instead of adding TDSEL to the existing
>>> pinmux_ioctrl_reg[] arrays, which list other IOCTRL registers like
>>> POCCTRL?
>>
>> For one, It's unrelated register to POCCTRL, so I don't want to mix them
> 
> That's why the array is called pinmux_ioctrl_reg[], not pinmux_pocctrl_reg[]:
> it is meant to cover various I/O control registers, including POCCTRL and
> TDSEL, to be saved/restored for PSCI system suspend.

I thought the array is called pinmux_ioctrl_reg[] because that's what
the pocctrl was called in older datasheets ? At least that's how you
explained it on IRC last time.

>> together. The other reason is this r8a779*_pin_to_pocctrl(), which uses
>> the ioctrl_regs[] array ; if I added the TDSEL there, that'd just make
>> things extra confusing.
> 
> How r8a779*_pin_to_pocctrl() gets the registers is an implementation detail,
> IMHO (The function used to contain hardcoded register addresses).
> 
> So I think you should just add the TDSEL registers to pinmux_ioctrl_reg[].

If that's what you think is better and makes the driver less confusing,
sure ...

-- 
Best regards,
Marek Vasut
