Return-Path: <SRS0=S9WZ=QZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9108C10F03
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 14:37:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9A17A21736
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 14:37:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8w/0Vfc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389275AbfBROgv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Feb 2019 09:36:51 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45372 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387519AbfBRNzn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Feb 2019 08:55:43 -0500
Received: by mail-wr1-f67.google.com with SMTP id w17so18412415wrn.12;
        Mon, 18 Feb 2019 05:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=flkE0Bxoa12KXfQjx7Y7pfFssxJePWPwKjy8JqDhZtI=;
        b=F8w/0VfcnhmR/DjA4P4XB4cuK2BnMuCrS6WL9P0GEyPePcs+H2bhM20Fhmzt2Wls63
         7oqkk/4FTYLMYekJTxqXmCcD0+5d1XaRpXaTW5MEKLQLCqbA7yuLOD9wimkln8fT1CuY
         k78VDPYXl3NS8JTrO6iF1bUTezvbAGnpaV5rBlug5GLaerxSm4dY4w1Z8BBcAuceeipt
         CeHPRNnCrE4wgMZah0mUsyXjCpp0sJh0fXzqi3d/QQMJ3ABab92tlQo8BToIIKGfV7xe
         3AhqxfXv70PTSoMaHXbNkIVt9u/Rgu0+z3jcWuhz4YlpsUKjGOruL2OFstfyZGELwcKK
         qWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=flkE0Bxoa12KXfQjx7Y7pfFssxJePWPwKjy8JqDhZtI=;
        b=hOpef3s3a3pZkUo3XNHkcIaT2oIuH7niJvIJO3MQARSSuoT5OAjq9tfS28FtihBojW
         SAT543jvt7bDYdGpMn0h+U2uDsUSJ7aHvFzGddLwOSfFbvwPV/23Tnp6Luy4XBouW/z/
         zMD3hDa49qyPRMclGRfnd6h4qdoKu+30zsgnvlXarROgEB//8aWT4PeZdvL4bqttKHdm
         HPj6H7cVcdRSP9Rrph2nj3p5dX1vfUcarF9P8LC+U2cmVFWOShZQJeEkNWFCXLLtb70j
         75n1ba2cCQepCFbBUQSFl+kACOovoKmHjEPPCbaFMSyrpMVtQLFi3SMiDcFj8m6tLHOI
         WbJA==
X-Gm-Message-State: AHQUAubUMPMQFY4ly02bHv8hPe6cIouy+VDzswCjeGvnkIZYtIj1sJ+/
        BPYKmxiJL7Qts1GQtYR4JLgFZvje
X-Google-Smtp-Source: AHgI3IZc7lOZrezpsUOV6IzUr8I9hY6rF5UkRKV7upvfcR5qEYqxkY1iLbbJNWZTqhYsSKfAb1pbRA==
X-Received: by 2002:adf:e982:: with SMTP id h2mr17953898wrm.241.1550498141617;
        Mon, 18 Feb 2019 05:55:41 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id 2sm31187125wrg.89.2019.02.18.05.55.40
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Feb 2019 05:55:40 -0800 (PST)
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
 <480f9261-f8cc-1115-ec36-5cd806c17d65@gmail.com>
 <CAMuHMdXpbbhrzAa0Er8zYbOBxzM6fE7rpVUHxgtwUmb54MFr7Q@mail.gmail.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <11a0e788-fef6-8e6d-5e1a-08d85edad9a1@gmail.com>
Date:   Mon, 18 Feb 2019 14:55:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXpbbhrzAa0Er8zYbOBxzM6fE7rpVUHxgtwUmb54MFr7Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2/18/19 2:52 PM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

> On Mon, Feb 18, 2019 at 2:48 PM Marek Vasut <marek.vasut@gmail.com> wrote:
>> On 2/18/19 2:41 PM, Geert Uytterhoeven wrote:
>>> On Mon, Feb 18, 2019 at 2:38 PM Marek Vasut <marek.vasut@gmail.com> wrote:
>>>> On 2/18/19 2:32 PM, Geert Uytterhoeven wrote:
>>>>>>>>  struct pinmux_data_reg {
>>>>>>>>         u32 reg;
>>>>>>>>         u8 reg_width;
>>>>>>>> @@ -270,6 +274,7 @@ struct sh_pfc_soc_info {
>>>>>>>>         const struct pinmux_drive_reg *drive_regs;
>>>>>>>>         const struct pinmux_bias_reg *bias_regs;
>>>>>>>>         const struct pinmux_ioctrl_reg *ioctrl_regs;
>>>>>>>> +       const struct pinmux_tdsel_reg *tdsel_regs;
>>>>>>>>         const struct pinmux_data_reg *data_regs;
>>>>>>>>
>>>>>>>>         const u16 *pinmux_data;
>>>>>>>
>>>>>>> Is there any special reason why you added a new block of registers with
>>>>>>> separate handling, instead of adding TDSEL to the existing
>>>>>>> pinmux_ioctrl_reg[] arrays, which list other IOCTRL registers like
>>>>>>> POCCTRL?
>>>>>>
>>>>>> For one, It's unrelated register to POCCTRL, so I don't want to mix them
>>>>>
>>>>> That's why the array is called pinmux_ioctrl_reg[], not pinmux_pocctrl_reg[]:
>>>>> it is meant to cover various I/O control registers, including POCCTRL and
>>>>> TDSEL, to be saved/restored for PSCI system suspend.
>>>>
>>>> I thought the array is called pinmux_ioctrl_reg[] because that's what
>>>> the pocctrl was called in older datasheets ? At least that's how you
>>>> explained it on IRC last time.
>>>
>>> Ah, that's where the misunderstanding comes from: both POCCTRLx and
>>> TDSELy registers are sometimes called IOCTRLz registers.
>>>
>>
>> Then shouldn't we rename IOCTRL30 to POCCTRL first, and then add TDSEL
>> into the list ?
> 
> Sure. I've already done so, but haven't sent out the patches yet.

Then we'll have a conflict once I add the TDSEL. I can either cook
similar patch and send two patches or you send yours and I'll send this
one later. I'd prefer the former to make conflict resolution easier .

-- 
Best regards,
Marek Vasut
