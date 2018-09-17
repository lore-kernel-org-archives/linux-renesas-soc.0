Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f68.google.com ([209.85.217.68]:36466 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726676AbeIQQsD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 12:48:03 -0400
Received: by mail-vs1-f68.google.com with SMTP id z19-v6so2635283vso.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Sep 2018 04:21:09 -0700 (PDT)
MIME-Version: 1.0
References: <153717356234.480.6698281193817518888.sendpatchset@octo> <153717357067.480.7556586771925219502.sendpatchset@octo>
In-Reply-To: <153717357067.480.7556586771925219502.sendpatchset@octo>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Sep 2018 13:20:57 +0200
Message-ID: <CAMuHMdU6Gh3kUmKRxCQQfaXSq-70QZF6CHZhgLxtFs7+gEJsYQ@mail.gmail.com>
Subject: Re: [PATCH 01/03] dt-bindings: arm: consistently name SH-Mobile AG5
 as R8A73A00
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On Mon, Sep 17, 2018 at 10:39 AM Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm@opensource.se>
>
> Update the description of the AG5 entry to follow same style as other SoCs.
>
> The actual DT binding remains unchanged.
>
> Signed-off-by: Magnus Damm <damm@opensource.se>

Thanks for your patch!

Do you plan to update the other occurrences under
Documentation/devicetree/bindings/, too?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
