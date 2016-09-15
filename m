Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:36714 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1762606AbcIOLw1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Sep 2016 07:52:27 -0400
MIME-Version: 1.0
In-Reply-To: <20160914170558.1561-1-wsa+renesas@sang-engineering.com>
References: <20160914170558.1561-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Sep 2016 13:52:26 +0200
Message-ID: <CAMuHMdX7GygtuA43=+HFFOyMGt=x1b2UTQBUojqedSfcRmSxjQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] tmio: add support for eMMC with 8 bit bus width
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Dirk Behme <dirk.behme@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Wed, Sep 14, 2016 at 7:05 PM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The DTS changes for R-Car Gen3 will come via a seperate series. Note that
> 'non-removable' is not supported yet because of Runtime PM issues. It seems we
> need to overhaul Runtime PM handling for other reasons as well, so I suggest
> the basic support goes in like this and DTS do not use 'non-removable' for now.

DT describes the hardware, not current limitations of the software.
Hence IMHO you should add the "non-removable" property to the DTS, and
work around its non-functioning in software.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
