Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170327095652.5755-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170327095652.5755-1-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Mar 2017 13:05:48 +0200
Message-ID: <CAMuHMdUiDzGt6bz96D-5yRLF-HiZfpQTTxKP5Y4+j-9HiF1LLQ@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Document the vsps property in the DT bindings
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Mon, Mar 27, 2017 at 11:56 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The property is used by the driver but is missing from the DT bindings.
> Document it.
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  Documentation/devicetree/bindings/display/renesas,du.txt | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
> index 1a02f099a0ff..cf34893a1b53 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> @@ -36,6 +36,11 @@ Required Properties:
>        When supplied they must be named "dclkin.x" with "x" being the input
>        clock numerical index.
>
> +Optional Properties:
> +
> +  - vsps: A list of phandles to the VSP nodes that handle the memory
> +    interfaces for the DU channels (Gen3 only).

", one per channel"?

Required for Gen3, optional for Gen2? (cfr. Sergei's patches).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
