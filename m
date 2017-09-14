Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:36258 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751420AbdINOzv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Sep 2017 10:55:51 -0400
MIME-Version: 1.0
In-Reply-To: <1505398720-4535-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1505398720-4535-1-git-send-email-vladimir.barinov@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Sep 2017 16:55:50 +0200
Message-ID: <CAMuHMdXtp0w071eAes0Khpi4jHkkgpZ36vbnReGsNWZ-73qa0g@mail.gmail.com>
Subject: Re: [PATCH v2 01/18] dt: arm: shmobile: add M3ULCB Kingfisher board
 DT bindings
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Vladimir,

On Thu, Sep 14, 2017 at 4:18 PM, Vladimir Barinov
<vladimir.barinov@cogentembedded.com> wrote:
> Add M3ULCB Kingfisher Device tree bindings Documentation, listing it as a
> supported board.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> ---
> Changes in version 2:
> - added own compatible value "shimafuji,kingfisher"

Thanks for the update!

> --- a/Documentation/devicetree/bindings/arm/shmobile.txt
> +++ b/Documentation/devicetree/bindings/arm/shmobile.txt
> @@ -85,6 +85,8 @@ Boards:
>      compatible = "renesas,lager", "renesas,r8a7790"
>    - M3ULCB (R-Car Starter Kit Pro, RTP0RC7796SKBX0010SA09 (M3 ES1.0))
>      compatible = "renesas,m3ulcb", "renesas,r8a7796";
> +  - M3ULCB Kingfisher (SBEV-RCAR-KF-M03)
> +    compatible = "shimafuji,kingfisher", "renesas,m3ulcb", "renesas,r8a7796";
>    - Marzen (R0P7779A00010S)
>      compatible = "renesas,marzen", "renesas,r8a7779"
>    - Porter (M2-LCDP)

As Kingfisher is an extension board, I meant to have a separate entry for it,
not tied to M3ULCB or H3ULCB:

  - M3ULCB Kingfisher (SBEV-RCAR-KF-M03)
    compatible = "shimafuji,kingfisher"

That way you don't need to list it twice (the board part number is the same
for M3ULCB Kingfisher and H3ULCB Kingfisher anyway).
Do you agree?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
