Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:35142 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932837AbeDXIb7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Apr 2018 04:31:59 -0400
MIME-Version: 1.0
In-Reply-To: <1524227297-24955-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1524227297-24955-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1524227297-24955-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Apr 2018 10:31:57 +0200
Message-ID: <CAMuHMdV2hVjPXZpCk6cGNUxcgLRkW0Wk=Dj=iKa_AGAGknb0Cg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: Add Renesas Ebisu board support
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Apr 20, 2018 at 2:28 PM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> Basic support for the Renesas Ebisu board based on R-Car E3:
>   - Memory,
>   - Main crystal,
>   - Serial console,
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [shimoda: rebase and add SPDX-License-Identifier]
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
