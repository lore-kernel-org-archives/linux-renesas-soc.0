Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:34268 "EHLO
        mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759881AbcJ1JMl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Oct 2016 05:12:41 -0400
Received: by mail-lf0-f47.google.com with SMTP id b81so51735389lfe.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Oct 2016 02:12:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160914164549.31121-1-ulrich.hecht+renesas@gmail.com>
References: <20160914164549.31121-1-ulrich.hecht+renesas@gmail.com>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Fri, 28 Oct 2016 18:12:37 +0900
Message-ID: <CANqRtoS1x3vYsAOR1cvxOUdQ0f-6ppE2_7sZx580FqB7WwmBwQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] r8a7796 SYS-DMAC integration
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "Simon Horman [Horms]" <horms@verge.net.au>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich, Simon, everyone,

On Thu, Sep 15, 2016 at 1:45 AM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> Hi!
>
> This enables the three DMA controllers. Identical to the setup on r8a7795.
> Based on renesas-drivers-2016-09-13-v4.8-rc6.
>
> CU
> Uli
>
>
> Ulrich Hecht (3):
>   clk: renesas: r8a7796: Add SYS-DMAC clocks
>   arm64: renesas: r8a7796: add SYS-DMAC controller nodes
>   dmaengine: rcar-dmac: Document R-Car M3-W bindings

Thanks for your efforts. I noticed that the clock bits have been
queued up by Geert, but other parts seem to be missing.

Can you please ping/poke/resend or whatever is needed to move the rest
of the series forward?

Best,

/ magnus
