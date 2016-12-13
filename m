Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:36730 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932463AbcLMK7M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Dec 2016 05:59:12 -0500
MIME-Version: 1.0
In-Reply-To: <20161212160931.6478-5-niklas.soderlund+renesas@ragnatech.se>
References: <20161212160931.6478-1-niklas.soderlund+renesas@ragnatech.se> <20161212160931.6478-5-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Dec 2016 11:59:11 +0100
Message-ID: <CAMuHMdWUqt0m8vmbd0edg6XFwseSkJ5CchmM5-nhWA5_SCFzPA@mail.gmail.com>
Subject: Re: [PATCHv2 4/5] sh_eth: enable wake-on-lan for sh7743
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Dec 12, 2016 at 5:09 PM, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> This is based on public datasheet for sh7743 which shows it have the

sh7734 (also in the one-line summary)
it has

> same behavior and registers for WoL as other versions of sh_eth.

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
