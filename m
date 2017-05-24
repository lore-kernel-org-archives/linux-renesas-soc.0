Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:35018 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966799AbdEXHoU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 May 2017 03:44:20 -0400
Received: by mail-io0-f195.google.com with SMTP id o12so17604938iod.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 May 2017 00:44:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87d1azovg1.wl%kuninori.morimoto.gx@renesas.com>
References: <87efvfovig.wl%kuninori.morimoto.gx@renesas.com> <87d1azovg1.wl%kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 May 2017 09:44:18 +0200
Message-ID: <CAMuHMdV1-3CTXGvuFkBbj8KnZDss4+m3TZJ30Rp8M7cggeQdjQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: renesas: salvator-x: add 12288000 for sound ADG
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon <horms@verge.net.au>, Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Wed, May 24, 2017 at 4:16 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Current rcar_sound only has 11289600 (= for 44.1kHz) clock-frequency,
> but it needs 12288000 for 48kHz too.
> Otherwise, 48kHz based sound can't handle correctly.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/salvator-x.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/renesas/salvator-x.dtsi b/arch/arm64/boot/dts/renesas/salvator-x.dtsi
> index 1f6b9fb..37f70bd 100644
> --- a/arch/arm64/boot/dts/renesas/salvator-x.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-x.dtsi
> @@ -540,7 +540,7 @@
>
>         /* audio_clkout0/1/2/3 */
>         #clock-cells = <1>;
> -       clock-frequency = <11289600>;
> +       clock-frequency = <11289600 12288000>;

Your change has the following impact on /sys/kernel/debug/clk/clk_summary:

@@ -12,6 +12,9 @@
  x21-clock                                0            0    33000000
        0 0
  x12                                      1            1    24576000
        0 0
     clk_multiplier                        1            1    24576000
        0 0
+       audio_clkout3                      0            0    11289600
        0 0
+       audio_clkout2                      0            0    11289600
        0 0
+       audio_clkout1                      0            0    11289600
        0 0
  audio_clkout                             0            0    11289600
        0 0
  pcie_bus                                 2            2   100000000
        0 0
  scif                                     1            1    14745600
        0 0
@@ -19,9 +22,6 @@
  audio_clk_c                              1            1           0
        0 0
  audio_clk_b                              0            0           0
        0 0
  audio_clk_a                              1            1    22579200
        0 0
-    audio_clkout3                         0            0    11289600
        0 0
-    audio_clkout2                         0            0    11289600
        0 0
-    audio_clkout1                         0            0    11289600
        0 0
  extalr                                   1            1       32768
        0 0
     r                                     1            1       32768
        0 0
        rwdt                               1            1       32768
        0 0

However, no 12288000 to be seen.

Does this depend on a recent driver change?
My tree is based on last renesas-drivers release.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
