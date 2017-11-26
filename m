Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f179.google.com ([209.85.220.179]:38579 "EHLO
        mail-qk0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751685AbdKZKZw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 26 Nov 2017 05:25:52 -0500
Received: by mail-qk0-f179.google.com with SMTP id a142so29107858qkb.5
        for <linux-renesas-soc@vger.kernel.org>; Sun, 26 Nov 2017 02:25:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171126003918.21976-2-niklas.soderlund+renesas@ragnatech.se>
References: <20171126003918.21976-1-niklas.soderlund+renesas@ragnatech.se> <20171126003918.21976-2-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 26 Nov 2017 11:25:50 +0100
Message-ID: <CAMuHMdVskKmwHxXZTbcsKbwUxaL2y0DLhdg2iovbQ5y1Ny2SoQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] rcar-csi2: split Mbps calculation to separate function
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Nov 26, 2017 at 1:39 AM, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The calculation of the Mbps to configured the link with needs to be

... to configure the link needs to be?

> split out if other configuration procedures on new SoCs are to be able
> to reuse the calculation procedure.

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
