Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:37927 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933917AbdIZLrh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2017 07:47:37 -0400
Received: by mail-wr0-f194.google.com with SMTP id p37so2363989wrb.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Sep 2017 04:47:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170926100605.2313-5-laurent.pinchart+renesas@ideasonboard.com>
References: <20170926100605.2313-1-laurent.pinchart+renesas@ideasonboard.com> <20170926100605.2313-5-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 26 Sep 2017 13:47:35 +0200
Message-ID: <CAMuHMdW9a96_0KpFZXErgBwQOGMAOuMjp8=YCUcwVbLhWVs3ZQ@mail.gmail.com>
Subject: Re: [RFC 02/13] dt-bindings: media: renesas-fcp: Add a compatible
 string for VSPI FCP
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Tue, Sep 26, 2017 at 12:05 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The FCP instances associated with a VSPI must be treated differently
> than the ones associated with another type of VSP. Add a new compatible
> string to allow telling them apart.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  Documentation/devicetree/bindings/media/renesas,fcp.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.txt b/Documentation/devicetree/bindings/media/renesas,fcp.txt
> index 3ec91803ba58..c1f28736e2d6 100644
> --- a/Documentation/devicetree/bindings/media/renesas,fcp.txt
> +++ b/Documentation/devicetree/bindings/media/renesas,fcp.txt
> @@ -11,7 +11,8 @@ are paired with. These DT bindings currently support the FCPV and FCPF.
>
>   - compatible: Must be one or more of the following
>
> -   - "renesas,fcpv" for generic compatible 'FCP for VSP'
> +   - "renesas,fcpvi" for generic compatible 'FCP for VSPI'
> +   - "renesas,fcpv" for generic compatible 'FCP for VSP' (all other VSPs)
>     - "renesas,fcpf" for generic compatible 'FCP for FDP'

You may want to update the paragraph before that, referring to three types of
FCP. It seems there's also a similar split for FCPC? So that makes (at least)
5 types.

Just wondering: as FCPVI vs. FCPV is programmable through the FCPVSEL
bit, can you deduce the type using the renesas,fcp link in the corresponding
VSP node in DT?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
