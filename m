Return-Path: <SRS0=7Xuf=PR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D8B8C43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 08:34:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D7B1C20821
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 08:34:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729281AbfAIIe6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 9 Jan 2019 03:34:58 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:46261 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729141AbfAIIe6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jan 2019 03:34:58 -0500
Received: by mail-vs1-f68.google.com with SMTP id n10so4207180vso.13;
        Wed, 09 Jan 2019 00:34:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XnvwNrGeg9g23pYW0bggp4Axe98l4L6MoWirKgH6pzs=;
        b=VA+6rbIjDSGXdQm9O6f3tQ702KSPe0yh9RmjL1q5iCjfVr0RCG0kzYhLDmw1FGwgPu
         aoI7vliMYWQaup8yBfBybWizHvRXxEOAJo5GuVc6SdkTNCYXqm+nFygJo33jfpjPcuLv
         i1HMG5DrXtlcGgnhSEHCarex4hixvtr3E0G3G/dH646BMaV12QWVYbD5rzaehDDkZQpY
         FE2xhfW4FtjhsbyOBwaHRIPLISdeWk1y3Ks4DqI5aAZbCVkXFBgIhhH86ySP7Yceq4cW
         KlEMWBIuDdt1Mp25V/khD+Vsix6EKD6Et6Gy2X+41D0A+Hw6vKrRHut+ixYMmnxYaD+3
         jIVg==
X-Gm-Message-State: AJcUukfN/lgcb0kWd/sqxUSB1PCJhwYh1v0X0mJHjksw7r7B8ta1jpog
        FMcjuquW3b1834vD/PE2FCC/357VNp4U4yyKf9i1rDz2JuY=
X-Google-Smtp-Source: ALg8bN4H5Xc1BsmJhflza95rnvYbqKK2RLWEvC57uKnly19RmUnq870LC8kkM3TAHVEXIFuNVMMrYv4VyeYkS0pNEvQ=
X-Received: by 2002:a67:3885:: with SMTP id n5mr1815595vsi.96.1547022897157;
 Wed, 09 Jan 2019 00:34:57 -0800 (PST)
MIME-Version: 1.0
References: <20190107221320.14930-1-wsa+renesas@sang-engineering.com> <20190107221320.14930-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190107221320.14930-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Jan 2019 09:34:45 +0100
Message-ID: <CAMuHMdUaR53b2_e-nuE5GxqNHb-w6ZBRxcWRG_Zzk5Zu=kxkHQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: sh-pfc: r8a7790: initialize TDSEL
 register for ES1.0
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 7, 2019 at 11:13 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Documentation for ES1.0 says that some bits in TDSEL must be set (ch
> 5.3.39 in R-Car H2 v0.91). However, the reset value of the register is

Also in Hardware User Manual Rev.1.00.
\
> 0, so software has to do it. Add this to the kernel driver to ensure
> this is really done independent of firmware versions and use
> whitelisting for ES versions known to need this.
>
> This is needed for some SD cards supporting SDR104 transfer mode. For
> me, TDSEL was not initialized by the firmware and I had problems with
> the card when re-inserting it.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v5.1.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
