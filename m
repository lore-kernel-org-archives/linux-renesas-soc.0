Return-Path: <SRS0=S9WZ=QZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D12C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 13:41:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5AC0D218AD
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 13:41:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727983AbfBRNlo (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Feb 2019 08:41:44 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:38720 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727483AbfBRNln (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Feb 2019 08:41:43 -0500
Received: by mail-vs1-f68.google.com with SMTP id t7so9640863vsq.5;
        Mon, 18 Feb 2019 05:41:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P4q0piIeFL+zMkOZN1tc4eBpCSwnl4SWx8CziGTaDMw=;
        b=mRFM1DOIq9Wn3FKqKUQsyMDhpNMHv6RhXMVEGYlme/Mk4zz43Do2/YRekaEdd3Zfz2
         /jzTeQNlGsR/EI+QexQ7FqINcBtODo9HtgIU2AQ08EIUSiExi4/ZUTUQGKAQFxRsihEi
         JbsU4URzYtHx4yaofHQm43O1fQt7l53O43CVrnHYB1V2wcAEr2JdPPce/AnW3H2PxiSE
         T2Vwde8Thw/T2CTQ11tVNKggmhhLXgikuB/hSQVCnwgFqVghz3RbM1g64VBFYYe30mUI
         D6vhjGshdug1YWId7ka4HX85F3GASWw0+m3mwxiOi1rscrQS1xq4wClssxanXrzzhW0j
         PgWg==
X-Gm-Message-State: AHQUAuYO7qOdWjJpWOgf3dsdhSuKa5hNRxKWf8Dt2fnzdoZlxRc7ukna
        0MPIskgPYjrNa7yaSt7LUsWNYcYTQD+oWlClnJI=
X-Google-Smtp-Source: AHgI3IZW9gOnn9JRMUMyWJ3zqNshZR+wFtsT/UG3940u1rbevyU2wsiQugN2mKR++VtyZXVjQ2yr3Mg4YlVqnpGmQqY=
X-Received: by 2002:a67:541:: with SMTP id 62mr11459241vsf.11.1550497302455;
 Mon, 18 Feb 2019 05:41:42 -0800 (PST)
MIME-Version: 1.0
References: <20190216134923.7277-1-marek.vasut@gmail.com> <CAMuHMdVkAEmLjUb12iNw49ecwJZU=9Cqsg_d1iEftbF6R7yd7g@mail.gmail.com>
 <4d8e6d25-8e08-161a-8d6f-2fdb4b3a3223@gmail.com> <CAMuHMdW-596oYGuj1VXgYEn6NuARhOAttZEw4QPc+9a7MrYniA@mail.gmail.com>
 <29913282-7343-70fc-5095-13dedd70cb5d@gmail.com>
In-Reply-To: <29913282-7343-70fc-5095-13dedd70cb5d@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 18 Feb 2019 14:41:30 +0100
Message-ID: <CAMuHMdW4NdB-xzov3Af6m3E=8sz5P0X5mSnVzKLJ+7m4ej==WA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: Retain TDSELCTRL register across suspend/resume
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marek,

On Mon, Feb 18, 2019 at 2:38 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> On 2/18/19 2:32 PM, Geert Uytterhoeven wrote:
> >>>>  struct pinmux_data_reg {
> >>>>         u32 reg;
> >>>>         u8 reg_width;
> >>>> @@ -270,6 +274,7 @@ struct sh_pfc_soc_info {
> >>>>         const struct pinmux_drive_reg *drive_regs;
> >>>>         const struct pinmux_bias_reg *bias_regs;
> >>>>         const struct pinmux_ioctrl_reg *ioctrl_regs;
> >>>> +       const struct pinmux_tdsel_reg *tdsel_regs;
> >>>>         const struct pinmux_data_reg *data_regs;
> >>>>
> >>>>         const u16 *pinmux_data;
> >>>
> >>> Is there any special reason why you added a new block of registers with
> >>> separate handling, instead of adding TDSEL to the existing
> >>> pinmux_ioctrl_reg[] arrays, which list other IOCTRL registers like
> >>> POCCTRL?
> >>
> >> For one, It's unrelated register to POCCTRL, so I don't want to mix them
> >
> > That's why the array is called pinmux_ioctrl_reg[], not pinmux_pocctrl_reg[]:
> > it is meant to cover various I/O control registers, including POCCTRL and
> > TDSEL, to be saved/restored for PSCI system suspend.
>
> I thought the array is called pinmux_ioctrl_reg[] because that's what
> the pocctrl was called in older datasheets ? At least that's how you
> explained it on IRC last time.

Ah, that's where the misunderstanding comes from: both POCCTRLx and
TDSELy registers are sometimes called IOCTRLz registers.

> >> together. The other reason is this r8a779*_pin_to_pocctrl(), which uses
> >> the ioctrl_regs[] array ; if I added the TDSEL there, that'd just make
> >> things extra confusing.
> >
> > How r8a779*_pin_to_pocctrl() gets the registers is an implementation detail,
> > IMHO (The function used to contain hardcoded register addresses).
> >
> > So I think you should just add the TDSEL registers to pinmux_ioctrl_reg[].
>
> If that's what you think is better and makes the driver less confusing,
> sure ...

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
