Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ig0-f193.google.com ([209.85.213.193]:36743 "EHLO
	mail-ig0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755554AbcECN15 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 3 May 2016 09:27:57 -0400
MIME-Version: 1.0
In-Reply-To: <1462279242-3475-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1462279242-3475-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Date: Tue, 3 May 2016 15:27:56 +0200
Message-ID: <CAMuHMdU89Nic5GPH3B=mAdvqrBDctEwXEspGD_3cv7VdrG1Qfg@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: dts: r8a7793: Add MMCIF0
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Simon Horman <horms@verge.net.au>,
	linux-renesas-soc@vger.kernel.org,
	Linux MMC List <linux-mmc@vger.kernel.org>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, May 3, 2016 at 2:40 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> Same as on r8a7791.
>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> ---

> --- a/arch/arm/boot/dts/r8a7793.dtsi
> +++ b/arch/arm/boot/dts/r8a7793.dtsi
> @@ -543,6 +543,19 @@
>                 status = "disabled";
>         };
>
> +       mmcif0: mmcif@ee200000 {

As the regular ePAPR police is on holidays, I'm assuming its duties:

mmc@ee200000

With that fixed:

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
