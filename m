Return-Path: <SRS0=vwGd=RP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76CF3C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 11:02:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 501C0206DF
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 11:02:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbfCLLCv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 12 Mar 2019 07:02:51 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:45974 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbfCLLCu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Mar 2019 07:02:50 -0400
Received: by mail-vs1-f68.google.com with SMTP id n14so1276718vsp.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Mar 2019 04:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l8qRV/tQgBYHVc8PSLRAylUGH7Bv0fETjpbDy/rM09o=;
        b=D11jxOzcWQGhndxkEh2CFhv/QcAxDwCLE6CGTTJTffz4zjfTaZlL5OXcgMFJn9Np5l
         ku81rA2bgZxBEebqSzmQcNWCduniDAUifSV/l0padOh+3/xEjMy0VaVAbNCBOtjouFy6
         IhFVQx5luF3KSI3l1AmlU/J6DkGuqDEK/fHldF8MZnjsBPRr2wytFwehOG3tfh7sMhC4
         aMzSpaODGWBCWbAu4fd/FsMr7L9aMjL7UDXItp0cpFXjIepjYhVU0ENVJD8LtX22jfPD
         4EaDOex1WByrH0jYA3H3JvNbh+fmW7lu6Bdn5rozXLhIEjN+ARhKTzbFpWX3jjmyoAM0
         sY9w==
X-Gm-Message-State: APjAAAWy2U9UsngTu+q8ooerHuHBbzq7LqGBKJgJllIyH8lMW8znCBqu
        tj5JADqB6Sx1KdnY3aU2X8CqoVlyNkbr+HNXCOo=
X-Google-Smtp-Source: APXvYqw4geNOGk/Sk5KFPNbEntLypuplDoQVl5Zdw+m/JJIJAUVechlIwTuK1a0lFRQXisoTO2+WJF5SgEKSZP1NqLs=
X-Received: by 2002:a67:8588:: with SMTP id h130mr18575185vsd.11.1552388569717;
 Tue, 12 Mar 2019 04:02:49 -0700 (PDT)
MIME-Version: 1.0
References: <610761cf-5a19-c182-07d8-8d118ca20035@cogentembedded.com>
 <09a2508e-f63e-4804-bf11-76832faae1f5@cogentembedded.com> <CAMuHMdVjvbcK21r9ajp9xKEGx=VHbXkrSB0ob2EjR8+dmNVdPw@mail.gmail.com>
In-Reply-To: <CAMuHMdVjvbcK21r9ajp9xKEGx=VHbXkrSB0ob2EjR8+dmNVdPw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Mar 2019 12:02:37 +0100
Message-ID: <CAMuHMdWkJi3VnNmdR_ykbUuKs4d_XT9uSYHzCed_=eJreCC2LA@mail.gmail.com>
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

On Tue, Mar 5, 2019 at 3:05 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, Jan 16, 2019 at 6:53 PM Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
> > Spansion S25FL512S ID is erroneously using 5-byte JEDEC ID, while the chip
> > family ID is stored in the 6th byte. Due to using only 5-byte ID, it's also
> > covering S25FS512S and now that we have added 6-byte ID for that chip, we
> > can convert S25FL512S to using a proper 6-byte ID as well...
> >
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> This is now commit a2126b0a010905e5 ("mtd: spi-nor: refine Spansion
> S25FL512S ID"), and turns out to cause a regression on r8a7791/koelsch.
> Dmesg diff before/after:
>
>     -m25p80 spi0.0: s25fl512s (65536 Kbytes)
>     -3 fixed-partitions partitions found on MTD device spi0.0
>     -Creating 3 MTD partitions on "spi0.0":
>     -0x000000000000-0x000000080000 : "loader"
>     -0x000000080000-0x000000600000 : "user"
>     -0x000000600000-0x000004000000 : "flash"
>     +m25p80 spi0.0: unrecognized JEDEC id bytes: 01, 02, 20
>
> As the (old) U-Boot on my Koelsch keeps many module clocks enabled, I
> typically merge in my topic/renesas-debug branch, which makes sure all
> non-critical module clocks are disabled early during boot, to catch
> drivers not properly implementing Runtime PM.
>
> However, it turns out this has some impact on JEDEC ID detection:
>   - When module clocks are left untouched, spi_nor_read_id() reads
>     0x01:0x02:0x20:0x4d:0x00:0x80.
>   - When my debug code has disabled module clocks during early boot,
>     The last byte is 0x00.
>
> Before the above commit, only the first 5 bytes were compared, and the
> last byte was ignored, thus not causing problems.
> When comparing all 6 bytes, detection fails if the last byte is 0x00.
>
> I believe mainline U-Boot for R-Car Gen2 boards doesn't keep the QSPI
> module clock enabled, so this commit may breaks those boards.
>
> To be investigated more (e.g. with a logic analyzer)...

The FLASH returns the correct data, but it is not received correctly.
When reading 16 bytes, thus including the ASCII model at offset 6/7:

  - actual:   01 02 20 4d 00 80 47 31 82 ff ff ff ff ff ff ff
  - received: 01 02 20 4d 00 00 8e 63 05 ff ff ff ff ff ff fe

When retrying the operation, data is received correctly.

This happens due to a Runtime PM related bug in the initialization code
of the spi-rspi driver: if the module clock is not running (disabled by
my debug code, the boot loader, or the clk_disable_unused late
initcall), the SPI controller is not initialized properly.  The first
transfer still manages to read some correct data, which used to be
sufficient to identify the S25FL512S FLASH chip, before the sixth byte
was also considered.

Will send a quick fix, and a proper solution requiring more refactoring
later.

Sorry for the noise...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
