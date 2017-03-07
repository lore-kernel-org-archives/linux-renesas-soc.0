Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:34779 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755648AbdCGPjb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Mar 2017 10:39:31 -0500
MIME-Version: 1.0
In-Reply-To: <20170306200401.29923-2-niklas.soderlund+renesas@ragnatech.se>
References: <20170306200401.29923-1-niklas.soderlund+renesas@ragnatech.se> <20170306200401.29923-2-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Mar 2017 16:39:28 +0100
Message-ID: <CAMuHMdVCu60F83Y3kuE68CARJt9bdDvpH1TandEY34=HmYzTuQ@mail.gmail.com>
Subject: Re: [PATCH 1/7] thermal: rcar_gen3_thermal: add delay in
 .thermal_init on r8a7796
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Linux PM list <linux-pm@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Mar 6, 2017 at 9:03 PM, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The .thermal_init needs to be delayed a short amount of to allow for the

of ... (thx Sergei ;-)

> TEMP register to contain something useful. If it's not delayed theses

these

> warnings are common during boot:
>
> thermal thermal_zone0: failed to read out thermal zone (-5)
> thermal thermal_zone1: failed to read out thermal zone (-5)
> thermal thermal_zone2: failed to read out thermal zone (-5)
>
> The warnings are triggered by the first call to .get_temp while the TEMP

.get_temp()

> register contains 0 and rcar_gen3_thermal_get_temp() returns -EIO since
> a TEMP value of 0 will result in a temperature reading which is out of
> specifications.
>
> This should have been done in the initial commit which adds the driver
> as the same issue was found and corrected for r8a7795.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
