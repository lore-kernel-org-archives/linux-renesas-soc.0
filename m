Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:33800 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751680AbeCUOmj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Mar 2018 10:42:39 -0400
Received: by mail-qk0-f194.google.com with SMTP id z184so5683324qkc.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Mar 2018 07:42:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1521477440-1047-4-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1521477440-1047-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1521477440-1047-4-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Mar 2018 15:42:38 +0100
Message-ID: <CAMuHMdWJ=G4XoNwOoh6=f=5ouWfnXgXGeG_ftcc3+Ui+6d5m9A@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: sh-pfc: r8a77995: correct VIN4 18-bit pins
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
> RGB666 has a pin assignment that differs from the other formats.
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
