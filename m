Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:45889 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751259AbdKVNQe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Nov 2017 08:16:34 -0500
MIME-Version: 1.0
In-Reply-To: <1510915289-15059-5-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1510915289-15059-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1510915289-15059-5-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Nov 2017 14:16:32 +0100
Message-ID: <CAMuHMdVzygU6cb5FkAytrUByFQmKt74DvsJEL0Cg_oc5xv8NMA@mail.gmail.com>
Subject: Re: [PATCH 4/7] arm64: dts: r8a77995: Add CAN support
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-can@vger.kernel.org,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Nov 17, 2017 at 11:41 AM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> Adds CAN controller nodes for r8a77995.
>
> Based on a patch for r8a7796 by Chris Paterson.
>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
