Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f176.google.com ([209.85.216.176]:56394 "EHLO
        mail-qt0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964795AbdKGKIA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Nov 2017 05:08:00 -0500
Received: by mail-qt0-f176.google.com with SMTP id z28so14458439qtz.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Nov 2017 02:07:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171101103452.7491-15-horms+renesas@verge.net.au>
References: <20171101103452.7491-1-horms+renesas@verge.net.au> <20171101103452.7491-15-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Nov 2017 11:07:59 +0100
Message-ID: <CAMuHMdV80LSM6YhRfbvsXQiSbDe6zqGqV51fdyeTFAmDDH06Jw@mail.gmail.com>
Subject: Re: [PATCH v4 14/15] arm64: dts: renesas: r8a7795: Enable IPMMU-VI,
 VP, DS0, DS1 and MM
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Magnus Damm <damm+renesas@opensource.se>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 1, 2017 at 11:34 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Enable the r8a7795 device nodes for IPMMU-VI, IPMMU-VP, IPMMU-DS0,

VI0, VP0

> IPMMU-DS1 and the shared IPMMU-MM device.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
