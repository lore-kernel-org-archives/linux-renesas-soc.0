Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:33792 "EHLO
	mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752369AbcELRrE (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 12 May 2016 13:47:04 -0400
Received: by mail-io0-f195.google.com with SMTP id d62so206074iof.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 May 2016 10:47:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1463041641-27485-5-git-send-email-dirk.behme@de.bosch.com>
References: <1463041641-27485-1-git-send-email-dirk.behme@de.bosch.com>
	<1463041641-27485-5-git-send-email-dirk.behme@de.bosch.com>
Date: Thu, 12 May 2016 19:47:02 +0200
Message-ID: <CAMuHMdVBdrfTPZ_4LofH4wS7KNyiA59s4Z0+42A3DCMuh_Qa8A@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm64: dts: renesas: Add device node for RST module
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, May 12, 2016 at 10:27 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -526,6 +526,11 @@
>                         #iommu-cells = <1>;
>                 };
>
> +               rst: reset-controller@e6160000 {
> +                       compatible = "renesas,rst-r8a7795", "syscon";

"renesas,r8a7795-rst", to match current practices.

> diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> index 1389528..30d05e7 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> @@ -115,6 +115,11 @@
>                         #power-domain-cells = <1>;
>                 };
>
> +               rst: reset-controller@e6160000 {
> +                       compatible = "renesas,rst-r8a7795", "syscon";

"renesas,r8a7796-rst" (not '95 ;-).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
