Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f67.google.com ([209.85.213.67]:34886 "EHLO
        mail-vk0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751383AbeDRNzg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Apr 2018 09:55:36 -0400
Received: by mail-vk0-f67.google.com with SMTP id h134so1082816vke.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Apr 2018 06:55:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180417210342.16061-1-niklas.soderlund@ragnatech.se>
References: <20180417210342.16061-1-niklas.soderlund@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Apr 2018 15:55:34 +0200
Message-ID: <CAMuHMdWWtv0EKx4hjYNqp9zCvNCfV1Y0A-5LONwhf6FebetmmA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: r8a77965: Add R-Car Gen3 thermal support
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

On Tue, Apr 17, 2018 at 11:03 PM, Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
> From: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
>
> Based on previous work by Ryo Kataoka <ryo.kataoka.wt@renesas.com>.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 59 +++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>
> Hi Simon,
>
> This patch depends on '[PATCH 0/2] thermal: rcar_gen3_thermal: add
> r8a77965 support'. So it's probably best you hold back applying it to

Does it? Just on the (trivial) addition of a new compatible value, right?

> such time it's dependency are accepted. I post it in any case to get
> review comments and keep it ready for future integration in
> renesas-drivers branches.

So I don't think the above is a blocker, but...

> It also uses numerical values for the power-doamains propery as the
> defines where not yet available for me. This shall of course be updated
> before they are accepted.

They're in v4.17-rc1, so you can update the patch now?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
