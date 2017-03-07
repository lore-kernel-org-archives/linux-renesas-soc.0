Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f176.google.com ([209.85.223.176]:34576 "EHLO
        mail-io0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932897AbdCGSkb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Mar 2017 13:40:31 -0500
MIME-Version: 1.0
In-Reply-To: <20170306200401.29923-5-niklas.soderlund+renesas@ragnatech.se>
References: <20170306200401.29923-1-niklas.soderlund+renesas@ragnatech.se> <20170306200401.29923-5-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Mar 2017 16:31:28 +0100
Message-ID: <CAMuHMdUPwpiBqhrDWJCGpp=EPCYd1SsxZOE8v=jniR6A17cwBg@mail.gmail.com>
Subject: Re: [PATCH 4/7] thermal: rcar_gen3_thermal: record more information
 about each TSC
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
> The struct rcar_gen3_thermal_tsc benefits from knowing which TSC it
> represent. Record this at probe time before this information is lost.
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
