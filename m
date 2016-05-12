Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:32783 "EHLO
	mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752088AbcELRyV (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 12 May 2016 13:54:21 -0400
Received: by mail-io0-f194.google.com with SMTP id x35so11551931ioi.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 May 2016 10:54:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1463041641-27485-2-git-send-email-dirk.behme@de.bosch.com>
References: <1463041641-27485-1-git-send-email-dirk.behme@de.bosch.com>
	<1463041641-27485-2-git-send-email-dirk.behme@de.bosch.com>
Date: Thu, 12 May 2016 19:41:35 +0200
Message-ID: <CAMuHMdWHktqVHLa4LMZkdh05oNyU+OnHpP8A2Ms3z4xmG0oCag@mail.gmail.com>
Subject: Re: [PATCH 1/6] reset: Add renesas,rst DT bindings.
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, May 12, 2016 at 10:27 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> From: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Add DT bindings for the Renesas R-Car Reset Controller
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/reset/renesas,rst.txt      | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/renesas,rst.txt
>
> diff --git a/Documentation/devicetree/bindings/reset/renesas,rst.txt b/Documentation/devicetree/bindings/reset/renesas,rst.txt
> new file mode 100644
> index 0000000..f84fd0d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/renesas,rst.txt
> @@ -0,0 +1,29 @@
> +DT bindings for the Renesas R-Car Reset Controller
> +
> +The R-Car Reset Controller provides reset control, and implements the following
> +functions:
> +  - Register-based reset control for the various CPU cores,
> +  - Latching of the levels on mode pins when PRESET# is negated,
> +  - Mode monitoring register,
> +  - Boot address registers for the various CPU cores.
> +
> +
> +Required properties:
> +  - compatible: Should be "renesas,rst-<soctype>", and "syscon".

Should become "renesas,<soctype>-rst" to match current best practices.

> +               Examples with soctypes are:
> +                 - "renesas,rst-r8a7790" (R-Car H2)
> +                 - "renesas,rst-r8a7791" (R-Car M2-W)
> +                 - "renesas,rst-r8a7792" (R-Car V2H
> +                 - "renesas,rst-r8a7793" (R-Car M2-N)
> +                 - "renesas,rst-r8a7794" (R-Car E2)
> +                 - "renesas,rst-r8a7795" (R-Car H3)
> +                 - "renesas,rst-r8a7796" (R-Car M3)

"renesas,r8a7790-rst" etc.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
