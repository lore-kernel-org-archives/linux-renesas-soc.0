Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:34062 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753103AbeBZNwy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Feb 2018 08:52:54 -0500
Received: by mail-qt0-f195.google.com with SMTP id l25so8929247qtj.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Feb 2018 05:52:53 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <151904099108.30541.17932604596131550090.sendpatchset@little-apple>
References: <151904097369.30541.12132732484797103163.sendpatchset@little-apple>
 <151904099108.30541.17932604596131550090.sendpatchset@little-apple>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Feb 2018 14:52:52 +0100
Message-ID: <CAMuHMdWvTMtUmXx4TuTxORfjz7pCLYU+CDVM-AZ0MG9yjLk8UA@mail.gmail.com>
Subject: Re: [PATCH 02/02] ARM: dts: silk: Add GPIO keys to DT
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Feb 19, 2018 at 12:49 PM, Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Extend the Silk board support to include SW3, SW4, SW6 and SW12. They
> are all connected via GPIO lines and handled by the gpio-keys driver.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
