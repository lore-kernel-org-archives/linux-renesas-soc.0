Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:48396 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752449AbdKGJfZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Nov 2017 04:35:25 -0500
Received: by mail-qt0-f194.google.com with SMTP id f8so14398099qta.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Nov 2017 01:35:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171101103452.7491-11-horms+renesas@verge.net.au>
References: <20171101103452.7491-1-horms+renesas@verge.net.au> <20171101103452.7491-11-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Nov 2017 10:35:23 +0100
Message-ID: <CAMuHMdWy7xK8GJSU7G_CrVob8PuVWB61TugGBtTYyugJ+M3Cfw@mail.gmail.com>
Subject: Re: [PATCH v4 10/15] arm64: dts: renesas: r8a7795: Point VSPI via
 FCPVI to IPMMU-VP0/1
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Magnus Damm <damm+renesas@opensource.se>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 1, 2017 at 11:34 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Hook up the FCPVI devices to allow use of VSPI with
> IPMMU-VP0 and IPMMU-VP1.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
> @@ -155,6 +155,10 @@
>         iommus = <&ipmmu_vp0 1>;
>  };
>
> +&fcpvi1 {
> +       iommus = <&ipmmu_vp0 9>;
> +};

Do we sort labels alphabetically?
Or do we follow the order of the original targets?

(Random comment that may apply elsewhere, too)

> +
>  &fcpvd2 {
>         iommus = <&ipmmu_vi0 10>;
>  };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
