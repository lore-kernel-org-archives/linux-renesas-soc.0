Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f65.google.com ([209.85.222.65]:39006 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbeIESAN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Sep 2018 14:00:13 -0400
Received: by mail-ua1-f65.google.com with SMTP id g18-v6so5776278uam.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Sep 2018 06:29:57 -0700 (PDT)
MIME-Version: 1.0
References: <1534511968-19634-1-git-send-email-uli+renesas@fpond.eu> <1534511968-19634-2-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1534511968-19634-2-git-send-email-uli+renesas@fpond.eu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Sep 2018 15:29:44 +0200
Message-ID: <CAMuHMdW=UD1XT5yvuvk9dBf50RpSqK4sO2Z-0tEBYWa4_TasSA@mail.gmail.com>
Subject: Re: [PATCH 1/5] arm64: dts: r8a7795: Add cpuidle support for CA57 cores
To: uli+renesas@fpond.eu
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>,
        dien.pham.ry@renesas.com,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Uli,

On Fri, Aug 17, 2018 at 3:19 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> From: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
>
> Enable cpuidle (core shutdown) support for R-Car H3 CA57 cores.
>
> Parameters were found after evaluation by gaku.inami.xw@bp.renesas.com; they
> help to keep the performance and reduce the power consumption.
>
> Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
> [dien.pham.ry: Apply new cpuidle parameters]
> Signed-off-by: Dien Pham <dien.pham.ry@renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Thanks for your patch!


> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi

> @@ -221,6 +225,20 @@
>                         cache-unified;
>                         cache-level = <2>;
>                 };
> +
> +               idle-states {
> +                       entry-method = "psci";
> +
> +                       CPU_SLEEP_0: cpu-sleep-0 {
> +                               compatible = "arm,idle-state";
> +                               arm,psci-suspend-param = <0x0010000>;
> +                               local-timer-stop;
> +                               entry-latency-us = <400>;
> +                               exit-latency-us = <500>;
> +                               min-residency-us = <4000>;
> +                               status = "okay";

Usually we just don't specify status for "virtual" nodes (applies to the
other patches, too).

> +                       };
> +               };
>         };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
