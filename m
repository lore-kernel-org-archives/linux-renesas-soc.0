Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:38195 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751550AbeCUQU1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Mar 2018 12:20:27 -0400
Received: by mail-qk0-f196.google.com with SMTP id 132so6035010qkd.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Mar 2018 09:20:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1521477465-1174-3-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1521477465-1174-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1521477465-1174-3-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Mar 2018 17:20:26 +0100
Message-ID: <CAMuHMdVRQoWduyNYs3te2LYNqH1n5Bbp7Vr6phGvuW8J3-Sg3Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: sh-pfc: r8a7796: deduplicate VIN4 pin definitions
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kbingham@kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Mar 19, 2018 at 5:37 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> Use union vin_data and VIN_DATA_PIN_GROUP() to reduce redundancies
> in pin definitions.
>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v4.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
