Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f196.google.com ([209.85.217.196]:37852 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388264AbeGXH5U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jul 2018 03:57:20 -0400
MIME-Version: 1.0
References: <24093fd0-1b9b-a211-f988-0272483185d6@cogentembedded.com> <93618d2e-86b6-e467-b577-632a25cb2c4c@cogentembedded.com>
In-Reply-To: <93618d2e-86b6-e467-b577-632a25cb2c4c@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Jul 2018 08:52:12 +0200
Message-ID: <CAMuHMdWtJcxtPjyvmG2KLo9AK1F-KyYaU_1A3Mj0DMQg9Eiufg@mail.gmail.com>
Subject: Re: [PATCH 5/5] sh_eth: make sh_eth_tsu_{read|write}_entry()
 prototypes symmetric
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: netdev <netdev@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 23, 2018 at 8:16 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> sh_eth_tsu_read_entry() is still asymmetric with sh_eth_tsu_write_entry()
> WRT their prototypes -- make them symmetric by passing to the former a TSU
> register offset instead of its address and also adding the (now necessary)
> 'ndev' parameter...
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
