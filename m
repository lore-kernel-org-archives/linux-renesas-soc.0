Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f176.google.com ([209.85.223.176]:36412 "EHLO
        mail-io0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751027AbdEBKVn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 May 2017 06:21:43 -0400
MIME-Version: 1.0
In-Reply-To: <20170501090346.10801-5-wsa+renesas@sang-engineering.com>
References: <20170501090346.10801-1-wsa+renesas@sang-engineering.com> <20170501090346.10801-5-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 May 2017 12:21:41 +0200
Message-ID: <CAMuHMdX8x2hV4rDQdUTMk5CNzxqBL8YyaPNJQzGPOsRPpuxYYg@mail.gmail.com>
Subject: Re: [RFC PATCH 4/6] mmc: tmio: move finish_request function further down
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, May 1, 2017 at 11:03 AM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Plain code move with no changes. Needed for refactoring. Also, looks
> nicer if request and finish_request are next to each other.
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
