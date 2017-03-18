Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:33996 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750907AbdCROL6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 18 Mar 2017 10:11:58 -0400
MIME-Version: 1.0
In-Reply-To: <20170317155300.21566-5-niklas.soderlund+renesas@ragnatech.se>
References: <20170317155300.21566-1-niklas.soderlund+renesas@ragnatech.se> <20170317155300.21566-5-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 18 Mar 2017 15:09:21 +0100
Message-ID: <CAMuHMdULQB6aq-tiq+VJjuMStsUJy-J8yFP-j3FJngc-V5HWFw@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] thermal: rcar_gen3_thermal: record and check
 number of TSCs found
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

On Fri, Mar 17, 2017 at 4:52 PM, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Record how many TSCs are found in struct rcar_gen3_thermal_priv, this is
> needed to be able to add hardware interrupts for trip points later. Also
> add a check to make sure at least one TSC is found.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> ---
>  drivers/thermal/rcar_gen3_thermal.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_g=
en3_thermal.c
> index 9b6bc03dd142a8dd..3b6e85abfadc61a3 100644
> --- a/drivers/thermal/rcar_gen3_thermal.c
> +++ b/drivers/thermal/rcar_gen3_thermal.c
> @@ -74,6 +74,7 @@ struct rcar_gen3_thermal_tsc {
>  };
>
>  struct rcar_gen3_thermal_priv {
> +       unsigned int num_tscs;

I would insert this 32-bit number after the pointers below (which are 64-bi=
t),
because of alignment rules and implicit gaps.

>         struct rcar_gen3_thermal_tsc *tscs[TSC_MAX_NUM];
>  };

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
