Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:35215 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727715AbeGPQPR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jul 2018 12:15:17 -0400
MIME-Version: 1.0
References: <20180716121927.21918-1-niklas.soderlund+renesas@ragnatech.se> <20180716121927.21918-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20180716121927.21918-4-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Jul 2018 17:47:04 +0200
Message-ID: <CAMuHMdVQAd-87f0JZWu8JyaUzL9s1hdeFvu9Ynnohwg4HdsrYQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] ravb: fix byte order for TX descriptor tag field
 lower bits
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        netdev <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 16, 2018 at 2:20 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The wrong helper is used to swap the bytes when adding the lower bits of
> the TX descriptors tag field in the shared ds_tagl variable. The
> variable contains the DS[11:0] field and then the TAG[3:0] bits.
>
> The mistake was highlighted by the sparse warning:
>
> ravb_main.c:1622:31:    left side has type restricted __le16
> ravb_main.c:1622:31:    right side has type unsigned short
> ravb_main.c:1622:31: warning: invalid assignment: |=
> ravb_main.c:1622:34: warning: cast to restricted __le16
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
