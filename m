Return-Path: <SRS0=VX+A=O3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F86C43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 07:48:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2D26F217D8
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 07:48:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbeLRHsU (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Dec 2018 02:48:20 -0500
Received: from mail-vk1-f194.google.com ([209.85.221.194]:36257 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbeLRHsU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Dec 2018 02:48:20 -0500
Received: by mail-vk1-f194.google.com with SMTP id 185so1789934vkc.3;
        Mon, 17 Dec 2018 23:48:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7QEEk4nwWjPhCOyHdf8ZW8BLQpXj6+ZZKK3D0JpRclw=;
        b=mxq2CKooaBkyrzEa7aJhXNEDFspZeezSmodRzwTJMGgWwjYvhAxCqrQKVVF9MrOL38
         aBW8FsBLbkgnnw9q4qwIPtnESgaho8q0uAIk340y5RRYffkqVX2vOxt6BhoNNoGUyjuE
         tFVrV3oCmTRQHTnRlO0Aa1sg85CkUmral3kBnev0aRCjkDFYZFayGZ9CI4tv3ZvYqM3z
         pl20QYaNw/5lC3aZLFfyPx45cR/GE1160zR3plR0JneKYY+nDRwL2sjzuSJfVaQbPttI
         IOF5OE/eR3o+GJhR3JYA+ifZK2N73G148+WPQZZqIn+GFQ9uZ6BYEOLORL9BajBcpxwT
         2kFA==
X-Gm-Message-State: AA+aEWbmXBKvxHptvNxSMlM+nqrThDBXFVqQMLv/seZmGdb5u2bWH1Ye
        4og+UDO7+D7rdGx/ZeyM77GgYNq+1dLPVQzRl0g=
X-Google-Smtp-Source: AFSGD/XD9vcM/oOAozc3oV0CPFpToDpaItz1JoUQ9vA9XWj7+6xO757OEoO3HMPplUSQ24sUItyghZ/2QmgKd0b6IGc=
X-Received: by 2002:a1f:2145:: with SMTP id h66mr7415917vkh.65.1545119298333;
 Mon, 17 Dec 2018 23:48:18 -0800 (PST)
MIME-Version: 1.0
References: <20181217193314.3487-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20181217193314.3487-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 18 Dec 2018 08:48:06 +0100
Message-ID: <CAMuHMdWJE9gu1LJbBz1++VxF9VkO8_Xkvc368BriXhcR6z88zQ@mail.gmail.com>
Subject: Re: [PATCH] watchdog: add documentation for PM usage
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Kieran Bingham <kbingham@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Mon, Dec 17, 2018 at 9:36 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Add the first rule we recently agreed on.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  Documentation/watchdog/watchdog-pm.txt | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/watchdog/watchdog-pm.txt
>
> diff --git a/Documentation/watchdog/watchdog-pm.txt b/Documentation/watchdog/watchdog-pm.txt
> new file mode 100644
> index 000000000000..7a4dd46e0d24
> --- /dev/null
> +++ b/Documentation/watchdog/watchdog-pm.txt
> @@ -0,0 +1,19 @@
> +The Linux WatchDog Timer Power Management Guide
> +===============================================
> +Last reviewed: 17-Dec-2018
> +
> +Wolfram Sang <wsa+renesas@sang-engineering.com>
> +
> +Introduction
> +------------
> +This document states rules about watchdog devices and their power management
> +handling to ensure a uniform behaviour for Linux systems.
> +
> +
> +Ping on resume
> +--------------
> +On resume, a watchdog timer shall be reset to its selected value to give
> +userspace enough time to resume. [1] [2]
> +
> +[1] https://patchwork.kernel.org/patch/10252209/
> +[2] https://patchwork.kernel.org/patch/10711625/

Is patchwork content preserved eternally?
I would use a link to lore.kernel.org instead, except that the above two threads
can't be found (while they should).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
