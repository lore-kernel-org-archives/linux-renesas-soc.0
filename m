Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:44229 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751550AbeCUQUH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Mar 2018 12:20:07 -0400
Received: by mail-qt0-f193.google.com with SMTP id j26so5832040qtl.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Mar 2018 09:20:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1521477465-1174-2-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1521477465-1174-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1521477465-1174-2-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Mar 2018 17:20:06 +0100
Message-ID: <CAMuHMdXeyUi4EK1EcOcv1AQCs0YPknaC_TryD5LAQDw25Urreg@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: sh-pfc: r8a7795: deduplicate VIN4 pin definitions
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
