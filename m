Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:39658 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754805AbeASMdX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Jan 2018 07:33:23 -0500
Received: by mail-qt0-f194.google.com with SMTP id f4so3363257qtj.6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jan 2018 04:33:23 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180119113852.1894-1-wsa+renesas@sang-engineering.com>
References: <20180119113852.1894-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Jan 2018 13:33:22 +0100
Message-ID: <CAMuHMdU+X0A63YEe68A3qqUuRmgQq-4=3WiwsZB8Vw4y4D5CWA@mail.gmail.com>
Subject: Re: [PATCH] arm64: renesas_defconfig: add driver for PCA9654
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jan 19, 2018 at 12:38 PM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> We enabled it in the DTS, so we should have it here, too.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
