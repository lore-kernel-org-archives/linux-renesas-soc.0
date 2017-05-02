Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:34999 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750957AbdEBJ2A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 May 2017 05:28:00 -0400
Received: by mail-it0-f68.google.com with SMTP id 131so1297240itz.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 May 2017 02:28:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1493717048-10740-1-git-send-email-horms+renesas@verge.net.au>
References: <1493717048-10740-1-git-send-email-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 May 2017 11:27:58 +0200
Message-ID: <CAMuHMdXbvC90k1QYZsjWx=f7QVQyWOzi_v3u8ShDoDsSAmZsjw@mail.gmail.com>
Subject: Re: [PATCH/RFT renesas-devel] arm64: dts: ulcb: Enable NFS root
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Tue, May 2, 2017 at 11:24 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Enable NFS root on the r8a7795/h3ulcb and r8a7796/m3ulcb
> as per:
> * commit b2407c566ba29215 ("arm64: dts: r8a7795: enable nfs root on Salvator-X board").
> * commit 742a9dfb90f0 ("arm64: dts: r8a7796: salvator-x: Enable NFS root")
>
> Also set ignore_loglevel rw as boot args as is the case for the boards
> for the boards for other Renesas ARM/ARM64 based SoCs.

s/for the boards//

> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
