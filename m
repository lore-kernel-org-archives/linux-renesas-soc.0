Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:36714 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932351AbdA0MRe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Jan 2017 07:17:34 -0500
MIME-Version: 1.0
In-Reply-To: <1485515090-7570-1-git-send-email-horms+renesas@verge.net.au>
References: <1485515090-7570-1-git-send-email-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Jan 2017 13:16:43 +0100
Message-ID: <CAMuHMdUdHVcFpQyqtngps__Z99vWBYbs1vVvVSLvKBWSEkOrgw@mail.gmail.com>
Subject: Re: [PATCH net-next 0/2] ravb: Support 1Gbps on R-Car H3 ES1.1+ and
 R-Car M3-W
To: Simon Horman <horms+renesas@verge.net.au>
Cc: David Miller <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Fri, Jan 27, 2017 at 12:04 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> The path from Mizuguchi-san is to address timing problems observed with
> gigabit transfers. I would like it considered although my own testing on
> M3-W did not show any timing problems.

Is there any relation with the *-skew-ps properties in the DTS in the BSP?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
