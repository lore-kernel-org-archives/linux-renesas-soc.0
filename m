Return-Path: <SRS0=bqQk=O5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90AB6C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Dec 2018 14:06:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 677B4217D8
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Dec 2018 14:06:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387483AbeLTOGN (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 20 Dec 2018 09:06:13 -0500
Received: from mail-ua1-f68.google.com ([209.85.222.68]:44293 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387474AbeLTOGN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Dec 2018 09:06:13 -0500
Received: by mail-ua1-f68.google.com with SMTP id d19so579582uaq.11;
        Thu, 20 Dec 2018 06:06:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zTuwaHoGnMmCt6+m5txBrZIfgNtKXHQPZkaYHDLXsX0=;
        b=kb8hTY84avXh6UA94gqoG4z/yQhc9zET1nBhcNiCnM3wK9GvF9nFGk0GFKi2/j//rD
         LQLmMpm4XuKjV2XS8OQwHWe3Hp8acsHtF0BL45QU+UleYpgN3BWwPHkpn1oQIa0ZJ4Jg
         UwGENM4dHW8Y00mEhHItuBgc9cwkfA79gcgvOSaFLM+UlqzIRdIIXJ9jeS9kOiM5edIe
         DFBI0TurlDnblrWHFaKyAp+rft/codkrADw12se75rfrShoUAAPwnpmK2Opysaw7lVrS
         G+ey25F2WFGovA8T5Tc7fgJhXSE2VR9vH5T5y0WPXUx17zv7i5gmRjiQ+V8ainazTOYZ
         K+ag==
X-Gm-Message-State: AA+aEWZQqG3nzdKlKAvNAuW/BwnuNPV5KsM8y1c3x0QyXp1uUrRjh6WY
        2OSe5ajJzsH3WzAfoam2Td0z9m32q9f+MWRyFDc=
X-Google-Smtp-Source: AFSGD/XMW1bqRTgrAjYG4Jd7qdOzoBCCKAhdaxV84nBuZ/dV8XLOh3dUHKlk+QAjuXh0fds0GXegPXI9Pn9g4sNlWTc=
X-Received: by 2002:ab0:7251:: with SMTP id d17mr12313377uap.0.1545314770101;
 Thu, 20 Dec 2018 06:06:10 -0800 (PST)
MIME-Version: 1.0
References: <1544609975-26477-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1544609975-26477-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1544609975-26477-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 20 Dec 2018 15:05:57 +0100
Message-ID: <CAMuHMdUCm9reHy-q5YkMpoQwyyt6pg9GghYTqSkNXpr+vyximA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: r8a77990: Fix MOD_SEL bit numbering
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Wed, Dec 12, 2018 at 11:22 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> MOD_SEL register bit numbering was different from R-Car E3 SoC and
> R-Car H3/M3-[WN] SoCs.
>
> MOD_SEL 1-bit      H3/M3-[WN]  E3
> ===============    ==========  =====
> Set Value = H'0    b'0         b'0
> Set Value = H'1    b'1         b'1
>
> MOD_SEL 2-bits     H3/M3-[WN]  E3
> ===============    ==========  =====
> Set Value = H'0    b'00        b'00
> Set Value = H'1    b'01        b'10
> Set Value = H'2    b'10        b'01
> Set Value = H'3    b'11        b'11
>
> MOD_SEL 3-bits     H3/M3-[WN]  E3
> ===============    ==========  =====
> Set Value = H'0    b'000       b'000
> Set Value = H'1    b'001       b'100
> Set Value = H'2    b'010       b'010
> Set Value = H'3    b'011       b'110
> Set Value = H'4    b'100       b'001
> Set Value = H'5    b'101       b'101
> Set Value = H'6    b'110       b'011
> Set Value = H'7    b'111       b'111
>
> This patch replaces the #define name and value of MOD_SEL.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Fixes: 6d4036a1e3b3 ("pinctrl: sh-pfc: Initial R8A77990 PFC support")
> [shimoda: split a patch per SoC and revise the commit log]
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks, this fixes HSCIF4(B) RX.

> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> @@ -392,28 +392,28 @@
>  FM(IP12_31_28) IP12_31_28      FM(IP13_31_28)  IP13_31_28      FM(IP14_31_28)  IP14_31_28      FM(IP15_31_28)  IP15_31_28
>
>  /* MOD_SEL0 */                 /* 0 */                         /* 1 */                         /* 2 */                         /* 3 */                 /* 4 */                 /* 5 */         /* 6 */         /* 7 */
> -#define MOD_SEL0_30_29         FM(SEL_ADGB_0)                  FM(SEL_ADGB_1)                  FM(SEL_ADGB_2)                  F_(0, 0)
> +#define MOD_SEL0_30_29         FM(SEL_ADGB_0)                  FM(SEL_ADGB_2)                  FM(SEL_ADGB_1)                  F_(0, 0)

As this is not a plain reversal, but reordering based on the reverse of
the binary value, I think this would be easier to read if you would use
a macro to do the reordering.

I sent a patch showing what I had in mind.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
