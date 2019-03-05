Return-Path: <SRS0=F/Q8=RI=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED23C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Mar 2019 14:05:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B841820842
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Mar 2019 14:05:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728049AbfCEOFX (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Mar 2019 09:05:23 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:37272 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726250AbfCEOFX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Mar 2019 09:05:23 -0500
Received: by mail-ua1-f66.google.com with SMTP id x1so7734767uaj.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Mar 2019 06:05:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MYXkgi80vTtMx51TYzxZQuyfsOpsBgFFPSuFh4joC88=;
        b=JaG/gqm1RzwM6mlcL+ORCqFbEalgAMsYFH+Qp6kp9GnZAl96FqySHFDsnBHfL5ISvE
         TN2D2f6XvajBMJGOqC1vEriUYz+vGk6k/7T0DdQ5t9E0cO5O7AV8H/TNNFGDnNC71pp9
         Vys8vMxKzCn9bYZ3wANPqY6DvFL7XrOa6w1D02EU6OdxnT1Vpi6wxmTWaSa65FwQdUXa
         29SGT8ytiRJHf6Ntt6q5/2eKtYWVdR+0NexbFIQFYr6fRHewBCh1OhSebysHXjs4+ng+
         6b4BnHEQxLVYpIj4Bxpix0XPg8rDLzLqYFOdX8JsxvRrOSH8vzqs7raYTUOEoPu8CbEt
         j0fA==
X-Gm-Message-State: APjAAAWEpjjYCTV3Tcwp54hdY1LG3FCBZdqi36B5WFDZM4a9vp+BpTbN
        rwkefWlMlhp63D4q4D4B4Y5O+Moc9ET7U6kkK4o=
X-Google-Smtp-Source: APXvYqyx/fTIRHtoLcLJ3wHPwHk2jK52tYdNL0seM4Uz2uQpSoqHTNF16kHxW9zMEQ9Rp0cVYtHcw3Yczj4XWZL/ygg=
X-Received: by 2002:a9f:30dc:: with SMTP id k28mr1261608uab.75.1551794721536;
 Tue, 05 Mar 2019 06:05:21 -0800 (PST)
MIME-Version: 1.0
References: <610761cf-5a19-c182-07d8-8d118ca20035@cogentembedded.com> <09a2508e-f63e-4804-bf11-76832faae1f5@cogentembedded.com>
In-Reply-To: <09a2508e-f63e-4804-bf11-76832faae1f5@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Mar 2019 15:05:09 +0100
Message-ID: <CAMuHMdVjvbcK21r9ajp9xKEGx=VHbXkrSB0ob2EjR8+dmNVdPw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: refine Spansion S25FL512S ID
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Marek Vasut <marek.vasut@gmail.com>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Richard Weinberger <richard@nod.at>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sergei,

On Wed, Jan 16, 2019 at 6:53 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Spansion S25FL512S ID is erroneously using 5-byte JEDEC ID, while the chip
> family ID is stored in the 6th byte. Due to using only 5-byte ID, it's also
> covering S25FS512S and now that we have added 6-byte ID for that chip, we
> can convert S25FL512S to using a proper 6-byte ID as well...
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

This is now commit a2126b0a010905e5 ("mtd: spi-nor: refine Spansion
S25FL512S ID"), and turns out to cause a regression on r8a7791/koelsch.
Dmesg diff before/after:

    -m25p80 spi0.0: s25fl512s (65536 Kbytes)
    -3 fixed-partitions partitions found on MTD device spi0.0
    -Creating 3 MTD partitions on "spi0.0":
    -0x000000000000-0x000000080000 : "loader"
    -0x000000080000-0x000000600000 : "user"
    -0x000000600000-0x000004000000 : "flash"
    +m25p80 spi0.0: unrecognized JEDEC id bytes: 01, 02, 20

As the (old) U-Boot on my Koelsch keeps many module clocks enabled, I
typically merge in my topic/renesas-debug branch, which makes sure all
non-critical module clocks are disabled early during boot, to catch
drivers not properly implementing Runtime PM.

However, it turns out this has some impact on JEDEC ID detection:
  - When module clocks are left untouched, spi_nor_read_id() reads
    0x01:0x02:0x20:0x4d:0x00:0x80.
  - When my debug code has disabled module clocks during early boot,
    The last byte is 0x00.

Before the above commit, only the first 5 bytes were compared, and the
last byte was ignored, thus not causing problems.
When comparing all 6 bytes, detection fails if the last byte is 0x00.

I believe mainline U-Boot for R-Car Gen2 boards doesn't keep the QSPI
module clock enabled, so this commit may breaks those boards.

To be investigated more (e.g. with a logic analyzer)...

> --- linux-mtd.orig/drivers/mtd/spi-nor/spi-nor.c
> +++ linux-mtd/drivers/mtd/spi-nor/spi-nor.c
> @@ -1887,8 +1887,8 @@ static const struct flash_info spi_nor_i
>         { "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>         { "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR) },
>         { "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> +       { "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>         { "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> -       { "s25fl512s",  INFO(0x010220, 0x4d00, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>         { "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
>         { "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
>         { "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
