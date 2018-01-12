Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:42313 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754403AbeALKNT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jan 2018 05:13:19 -0500
MIME-Version: 1.0
In-Reply-To: <20180112005858.26472-2-laurent.pinchart+renesas@ideasonboard.com>
References: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com> <20180112005858.26472-2-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jan 2018 11:13:18 +0100
Message-ID: <CAMuHMdWFHRti_Su+01QYnWXHGB2Z=d4Sq93Y9JJgb2ifKSs2vg@mail.gmail.com>
Subject: Re: [PATCH 01/10] dt-bindings: display: renesas: Add R-Car LVDS
 encoder DT bindings
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Fri, Jan 12, 2018 at 1:58 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The Renesas R-Car Gen2 and Gen3 SoCs have internal LVDS encoders. Add
> corresponding device tree bindings.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> @@ -0,0 +1,54 @@
> +Renesas R-Car LVDS Encoder
> +==========================
> +
> +These DT bindings describe the LVDS encoder embedded in the Renesas R-Car Gen2
> +and Gen3 SoCs.
> +
> +Required properties:
> +
> +- compatible : Shall contain one of
> +  - "renesas,lvds-r8a7743" for R8A7790 (R-Car RZ/G1M) compatible LVDS encoders
> +  - "renesas,lvds-r8a7790" for R8A7790 (R-Car H2) compatible LVDS encoders
> +  - "renesas,lvds-r8a7791" for R8A7791 (R-Car M2-W) compatible LVDS encoders
> +  - "renesas,lvds-r8a7793" for R8A7791 (R-Car M2-N) compatible LVDS encoders
> +  - "renesas,lvds-r8a7795" for R8A7795 (R-Car H3) compatible LVDS encoders
> +  - "renesas,lvds-r8a7796" for R8A7796 (R-Car M3-W) compatible LVDS encoders

As this is a new binding, please use "renesas,<soc>-lvds".

BTW, would it make sense to use "renesas,<soc>-du" for the new DU binding, too?
Or have you reserved that for the future version that will have a one-to-one
mapping between device nodes and DU channels? ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
