Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:33594 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755967AbdBQI4V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Feb 2017 03:56:21 -0500
Received: by mail-it0-f66.google.com with SMTP id e137so1730399itc.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Feb 2017 00:56:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20160118054834.22156.56150.sendpatchset@little-apple>
References: <20160118054817.22156.6531.sendpatchset@little-apple> <20160118054834.22156.56150.sendpatchset@little-apple>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Feb 2017 09:56:20 +0100
Message-ID: <CAMuHMdVvpgQHEVtjBoCT4s2=Mez5vsm36st82mmCcQrzvhbciQ@mail.gmail.com>
Subject: Re: [PATCH/RFC 02/02] arm64: dts: Salvator-X: Enable 4 GiB of RAM
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On Mon, Jan 18, 2016 at 6:48 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Enable all the on-board memory for the r8a7795 Salvator-X board.
>
> Not for upstream merge. Needs to be ordered with firmware update
> to avoid overly complex dependencies.
>
> Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Any chance we can get a real SoB?
Not-so-recent firmware already enables the memory in U-Boot anyway.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
