Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:32992 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752418AbdFPHeE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Jun 2017 03:34:04 -0400
Received: by mail-io0-f194.google.com with SMTP id j200so3948647ioe.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Jun 2017 00:34:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170615073716.12395-2-laurent.pinchart+renesas@ideasonboard.com>
References: <20170615073716.12395-1-laurent.pinchart+renesas@ideasonboard.com> <20170615073716.12395-2-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Jun 2017 09:34:02 +0200
Message-ID: <CAMuHMdX=ufC1=tSodCDzy_THK1HjdJ9fXnu9W3P8CBso6uyZNA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: r8a7795: Add support for the DU
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Thu, Jun 15, 2017 at 9:37 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Add a compatible string and VSP links to the DU node. The H3 ES1.x and
> H3 ES2.0 are compatible save for the links to the VSPs that are
> described explicitly in DT, so there's no need for a new ES2-specific
> compatible string.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -1743,6 +1743,7 @@
>                 };
>
>                 du: display@feb00000 {
> +                       compatible = "renesas,du-r8a7795";

Hence the "override" in r8a7795-es1.dtsi can be removed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
