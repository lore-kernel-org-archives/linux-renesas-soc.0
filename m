Return-Path: <SRS0=VX+A=O3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F0EDC43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 12:58:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 76EE8217D7
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 12:58:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726570AbeLRM6K (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Dec 2018 07:58:10 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:34683 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726390AbeLRM6J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Dec 2018 07:58:09 -0500
Received: by mail-vs1-f66.google.com with SMTP id y27so9931506vsi.1;
        Tue, 18 Dec 2018 04:58:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9wmiGtEXpytppHgpOYSjgUTH8X0uUabJT8fUVmQmxU4=;
        b=GZkXgHlQ+yjpYbC3Zi37Hko+Sk5JS3+fcHEVyuq4yh88oxBU0kvRA4jnsVlCNiMPTn
         TyKdj1wGc/7wOX0xyNWLZ7y6XWP4pFEEaCavgaRzo3OKKMh78qFc7HpxWoZVI+9ItDdu
         fPYi6EhTG3R/yi69o6GsFGYQByQftYunknbmp0oHeJNqJDbexMvLB8xbNJPNufgfwMv6
         FKfZ5X8cDKv1rIEFtDQ2bn67blXUy49B0I5dUbsZr4CW24nvhakEbMqYlEPP4xjfj/sO
         TZt1/A3KLgYDaDIYjyxKYK58FRS/UjL8AbuR8JQWJbYbN0ZKEK+7Bx/bPlvbomFc/iew
         BhZQ==
X-Gm-Message-State: AA+aEWbwDwHdA8wBBoc19Nuc0MVPeh6ReaL60WjurjN9zWx9rXg8km9N
        HGpRPFk+52Bn9o+d4jN35hDGzCey1LI9jQJzdN9nHRLl0nQ=
X-Google-Smtp-Source: AFSGD/UBh69e9PFt3b3CXYZ28Voq97TCHaobA4Ypjz3qNl8eADxTR6bK3SapxB1Cdub2YKDbTMIUxfkmYaEi15RxBGc=
X-Received: by 2002:a67:d119:: with SMTP id u25mr7740779vsi.63.1545137888386;
 Tue, 18 Dec 2018 04:58:08 -0800 (PST)
MIME-Version: 1.0
References: <20181202193553.29704-1-marek.vasut+renesas@gmail.com>
 <20181202193553.29704-14-marek.vasut+renesas@gmail.com> <CAMuHMdUc4v5C-KCkuAQ_nsbcjWjYDyUggPDgi1tivMbcRcCNDQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUc4v5C-KCkuAQ_nsbcjWjYDyUggPDgi1tivMbcRcCNDQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 18 Dec 2018 13:57:54 +0100
Message-ID: <CAMuHMdVRW49R015G+t5zw57z-JMcfbJ+6mAthkDD9P4-edRxtA@mail.gmail.com>
Subject: Re: [PATCH 14/14] gpio: pca953x: Restore registers after
 suspend/resume cycle
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marek,

On Mon, Dec 3, 2018 at 6:55 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sun, Dec 2, 2018 at 8:36 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> > It is possible that the PCA953x is powered down during suspend.
> > Use regmap cache to assure the registers in the PCA953x are in
> > line with the driver state after resume.
> >
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>
> Thanks for your series!
>
> Background info: the main motivation for this series is to make sure SATA
> keeps working after system suspend/resume on the Salvator-XS development
> board, where the SATA functionality is configured using a gpio hog.
>
> With your series applied, the SATA link seems to be functional after resume.
> Dmesg difference:
>
>      ata1: link resume succeeded after 1 retries
>     -ata1: SATA link down (SStatus 0 SControl 300)
>     -ata1: link resume succeeded after 1 retries
>     -ata1: SATA link down (SStatus 0 SControl 300)
>     -ata1: link resume succeeded after 1 retries
>     -ata1: SATA link down (SStatus 0 SControl 300)
>     -ata1.00: disabled
>     -sd 0:0:0:0: rejecting I/O to offline device
>     +ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
>     +ata1.00: configured for UDMA/133
>
> However, when trying to read from an attached hard drive, it fails:
>
>     ata1.00: exception Emask 0x0 SAct 0x0 SErr 0x0 action 0x6 frozen
>     ata1.00: failed command: READ DMA
>     ata1.00: cmd c8/00:20:00:00:00/00:00:00:00:00/e0 tag 0 dma 16384 in
>              res 40/00:00:01:4f:c2/00:00:00:00:00/00 Emask 0x4 (timeout)
>     ata1.00: status: { DRDY }
>     ata1: hard resetting link
>     ata1: link resume succeeded after 1 retries
>     ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
>     ata1.00: configured for UDMA/133
>     sd 0:0:0:0: [sda] tag#0 UNKNOWN(0x2003) Result: hostbyte=0x00
> driverbyte=0x08
>     sd 0:0:0:0: [sda] tag#0 Sense Key : 0x5 [current]
>     sd 0:0:0:0: [sda] tag#0 ASC=0x21 ASCQ=0x4
>     sd 0:0:0:0: [sda] tag#0 CDB: opcode=0x28 28 00 00 00 00 00 00 00 20 00
>     print_req_error: I/O error, dev sda, sector 0
>     ata1: EH complete
>     ...
>     Buffer I/O error on dev sda, logical block 0, async page read
>
> Does SATA work for you after resume!
> This could still be an issue in the sata_rcar driver.

FTR, it wasn't. With V3 as present in gpio/for-next, SATA works fine after
resume.
Major difference seems to be the use of regmap_bulk_read() vs. regmap_read().

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
