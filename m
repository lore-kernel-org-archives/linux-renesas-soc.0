Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:32964 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933050AbcIPLEt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Sep 2016 07:04:49 -0400
Received: by mail-it0-f65.google.com with SMTP id x192so861777itb.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Sep 2016 04:04:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160916101414.GJ14562@verge.net.au>
References: <20160914164741.31621-1-ulrich.hecht+renesas@gmail.com> <20160916101414.GJ14562@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Sep 2016 13:04:47 +0200
Message-ID: <CAMuHMdW=8NikXuUngctZuHY7A005ZKmub6OR3ZnNW5L-AwfBnw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: r8a7796 salvator-x: External SCIF3/HSCIF3 loop
To: Simon Horman <horms@verge.net.au>
Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Fri, Sep 16, 2016 at 12:14 PM, Simon Horman <horms@verge.net.au> wrote:
> On Wed, Sep 14, 2016 at 06:47:41PM +0200, Ulrich Hecht wrote:
>> Add SCIF3 and HSCIF3 as two new serial ports to the r8a7796
>> Salvator-X DT file.
>>
>> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
>
> Please repost once the (at least DT) dependencies have been merged
> (or at least reposted).

As this is for testing (H)SCIF only, and requires external wiring,
I think this is something we do not want to upstream.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
