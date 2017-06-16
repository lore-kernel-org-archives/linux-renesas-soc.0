Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:34962 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752447AbdFPHhO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Jun 2017 03:37:14 -0400
Received: by mail-io0-f194.google.com with SMTP id f79so3899828ioi.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Jun 2017 00:37:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170615073716.12395-3-laurent.pinchart+renesas@ideasonboard.com>
References: <20170615073716.12395-1-laurent.pinchart+renesas@ideasonboard.com> <20170615073716.12395-3-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Jun 2017 09:37:12 +0200
Message-ID: <CAMuHMdW9t0kXZr_sEYtjSCNJTZN8jSg9p7i386Qh2DMpSFBG-Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: r8a7795: salvator-x: Unify DU node
 between ES1.x and ES2.0
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Thu, Jun 15, 2017 at 9:37 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The external clocks used by the DU are identical on the H3 ES1.x and
> ES2.0 SoCs. There is thus no need to duplicate DU clocks in both
> r8a7795-salvator-x.dts and r8a7795-es1-salvator-x.dts, move them all to
> salvator-x.dtsi.

Unfortunately the external clock wiring is different on R-Car M3-W.
As salvator-x.dtsi/salvator-common.dtsi is also used for M3-W-based boards,
I'm afraid the external clock description has to be duplicated for R-Car H3
ES1.x and ES2.0.

Unless we introduce e.g. r8a7795-salvator-x-common.dtsi, but that may be
overkill?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
