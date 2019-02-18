Return-Path: <SRS0=S9WZ=QZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4126C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 14:45:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B1FC42070B
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 14:45:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LN8GZ7iN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731145AbfBROpA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Feb 2019 09:45:00 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54417 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729104AbfBRNsE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Feb 2019 08:48:04 -0500
Received: by mail-wm1-f65.google.com with SMTP id a62so17467277wmh.4;
        Mon, 18 Feb 2019 05:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gBiUC8J4R6PBnWaQaTj/92NZsLL7/HGXhXb2LuXCcoY=;
        b=LN8GZ7iNK+wB3RXD58ht0yOkaQi9ClmLg1Xc1umRuyQZ7MkcCjzB3McVyNqzmMW3S1
         mKhNY3VT8k7KPr4Qy0ObvTKEyfHwPBTgYS6sl58gHeaIaGpOUhxK/Erms0XsgxibI9Nm
         7qETulhgMCLzowkCaahuiRERfHT72HHzG0E+M5qhF3puVZheiC9y3F7Cjx5x6Nr2OlG3
         t2DtSAKoToiTQR5FalXWrCh3t+hryl41QjEgZsaurwTEKXaUMjbSjGk67dceySvnHJ4f
         F89aOOR8iQbYUez4th8RXgecY8rXd9/LwX794dUJFewoUihn9RPC2zKMvbfqPGlaZfUZ
         KVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gBiUC8J4R6PBnWaQaTj/92NZsLL7/HGXhXb2LuXCcoY=;
        b=loX47zWlrJ9JZBlxcfqLjEiZn7KHeJ3s8/7S4BwBKVg3iPg3L6gjKEiwkfeVvSuFVZ
         V1C8IzLc33QgLpl3q/GOUAIoHZippIKta+VUKoueye/shTCRYQ6hnuVzRxLyljRfghKQ
         2iuhvooIViGPGu2XIhKbTNMFRh4TIs40afsnQwfbMUZJAgt1aMdJ9mp7vObG2qTvljyP
         raJjdxHaow5CxB2XjKTPiPM2mDdHB7eoLI6ymI/LbC7WMME3vNeKzV6U1Zf626FyeyWs
         ax21r1/pq9KDCbwgjDxC/CvXyiMC3flDdB4d4S4zdhq1WNgC0REFHW3aNiLaRURrRX4U
         9xmQ==
X-Gm-Message-State: AHQUAuavrD6iuPwP7HVhNc4GfDsCxxBFrkVh++Ap4iOuS8ZIztd/VblZ
        bebedm8rB2iAnRVVURnu7jCsPlmK
X-Google-Smtp-Source: AHgI3IYhHGPOgKuiOapGI7zXpPVvhxVPBbY7iliDqDvyVNRsa7mTzCYVEo0LJFiSSBwRD5grMLPo7w==
X-Received: by 2002:a1c:6c0c:: with SMTP id h12mr10567025wmc.35.1550497681366;
        Mon, 18 Feb 2019 05:48:01 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id c10sm12491403wrr.69.2019.02.18.05.48.00
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Feb 2019 05:48:00 -0800 (PST)
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
 <29913282-7343-70fc-5095-13dedd70cb5d@gmail.com>
 <CAMuHMdW4NdB-xzov3Af6m3E=8sz5P0X5mSnVzKLJ+7m4ej==WA@mail.gmail.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <480f9261-f8cc-1115-ec36-5cd806c17d65@gmail.com>
Date:   Mon, 18 Feb 2019 14:47:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdW4NdB-xzov3Af6m3E=8sz5P0X5mSnVzKLJ+7m4ej==WA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2/18/19 2:41 PM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

> On Mon, Feb 18, 2019 at 2:38 PM Marek Vasut <marek.vasut@gmail.com> wrote:
>> On 2/18/19 2:32 PM, Geert Uytterhoeven wrote:
>>>>>>  struct pinmux_data_reg {
>>>>>>         u32 reg;
>>>>>>         u8 reg_width;
>>>>>> @@ -270,6 +274,7 @@ struct sh_pfc_soc_info {
>>>>>>         const struct pinmux_drive_reg *drive_regs;
>>>>>>         const struct pinmux_bias_reg *bias_regs;
>>>>>>         const struct pinmux_ioctrl_reg *ioctrl_regs;
>>>>>> +       const struct pinmux_tdsel_reg *tdsel_regs;
>>>>>>         const struct pinmux_data_reg *data_regs;
>>>>>>
>>>>>>         const u16 *pinmux_data;
>>>>>
>>>>> Is there any special reason why you added a new block of registers with
>>>>> separate handling, instead of adding TDSEL to the existing
>>>>> pinmux_ioctrl_reg[] arrays, which list other IOCTRL registers like
>>>>> POCCTRL?
>>>>
>>>> For one, It's unrelated register to POCCTRL, so I don't want to mix them
>>>
>>> That's why the array is called pinmux_ioctrl_reg[], not pinmux_pocctrl_reg[]:
>>> it is meant to cover various I/O control registers, including POCCTRL and
>>> TDSEL, to be saved/restored for PSCI system suspend.
>>
>> I thought the array is called pinmux_ioctrl_reg[] because that's what
>> the pocctrl was called in older datasheets ? At least that's how you
>> explained it on IRC last time.
> 
> Ah, that's where the misunderstanding comes from: both POCCTRLx and
> TDSELy registers are sometimes called IOCTRLz registers.
> 

Then shouldn't we rename IOCTRL30 to POCCTRL first, and then add TDSEL
into the list ?

-- 
Best regards,
Marek Vasut
