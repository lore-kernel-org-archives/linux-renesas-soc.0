Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:36554 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753436AbcLIKF1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Dec 2016 05:05:27 -0500
Received: by mail-io0-f194.google.com with SMTP id b194so5741699ioa.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Dec 2016 02:05:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161205174310.28802-1-niklas.soderlund+renesas@ragnatech.se>
References: <20161205174310.28802-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Dec 2016 11:05:26 +0100
Message-ID: <CAMuHMdVXj6pGt4hWMAAfEoBFhDjGnvbB66BirTXvmMxbu+2p9Q@mail.gmail.com>
Subject: Re: [PATCHv2] arm64: dts: r8a7795: salvator-x: Set drive-strength for
 ravb pins
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Dec 5, 2016 at 6:43 PM, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The EthernetAVB should not depend on the bootloader to setup correct
> drive-strength values. Values for drive-strength where found by
> examining the registers after the bootloader has configured the
> registers and successfully used the EthernetAVB.
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
