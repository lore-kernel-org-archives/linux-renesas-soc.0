Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:36049 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752392AbdFZTgD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Jun 2017 15:36:03 -0400
Received: by mail-it0-f68.google.com with SMTP id 185so986073itv.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jun 2017 12:36:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170621090407.4093-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170621090407.4093-1-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jun 2017 21:36:01 +0200
Message-ID: <CAMuHMdVjHJP7OoN6h2T5-UgReyqb9E2uwgxaAT3zLTBQor0vHw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: rcar-du: Restrict DPLL duty cycle workaround to
 H3 ES1.x
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Wed, Jun 21, 2017 at 11:04 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -158,6 +157,11 @@ static void rcar_du_dpll_divider(struct rcar_du_crtc *rcrtc,
>                  best_diff);
>  }
>
> +static const struct soc_device_attribute rcar_du_r8a7795_es1[] = {
> +       { .soc_id = "r8a7795", .revision = "ES1.*" },
> +       { /* sentinel */ }
> +};
> +
>  static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
>  {
>         const struct drm_display_mode *mode = &rcrtc->crtc.state->adjusted_mode;
> @@ -185,7 +189,20 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
>
>                 extclk = clk_get_rate(rcrtc->extclock);
>                 if (rcdu->info->dpll_ch & (1 << rcrtc->index)) {
> -                       rcar_du_dpll_divider(rcrtc, &dpll, extclk, mode_clock);
> +                       unsigned long target = mode_clock;
> +
> +                       /*
> +                        * The H3 ES1.x exhibits dot clock duty cycle stability
> +                        * issues. We can work around them by configuring the
> +                        * DPLL to twice the desired frequency, coupled with a
> +                        * /2 post-divider. This isn't needed on other SoCs and
> +                        * breaks HDMI output on M3-W for a currently unknown
> +                        * reason, so restrict the workaround to H3 ES1.x.
> +                        */
> +                       if (soc_device_match(rcar_du_r8a7795_es1))

Matching is done over and over again, on every display enable/resume.
Can it be done at probe time?
Or in rcar_du_crtc_create(), which has access to rcrtc?

> +                               target *= 2;

You can also store the multiplier in rcar_du_r8a7795_es1.data
(store 1 in .data of the sentinel), removing the need for an if clause.

> +
> +                       rcar_du_dpll_divider(rcrtc, &dpll, extclk, target);
>                         extclk = dpll.output;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
