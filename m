Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f67.google.com ([209.85.213.67]:41242 "EHLO
        mail-vk0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729881AbeGPVCK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jul 2018 17:02:10 -0400
MIME-Version: 1.0
References: <20180716121927.21918-1-niklas.soderlund+renesas@ragnatech.se>
 <20180716121927.21918-4-niklas.soderlund+renesas@ragnatech.se>
 <fa8eec6c-fb0b-cb44-a891-e09d5b738672@cogentembedded.com> <177386eb-037b-57f8-6c40-027e09db67f9@cogentembedded.com>
In-Reply-To: <177386eb-037b-57f8-6c40-027e09db67f9@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Jul 2018 22:32:54 +0200
Message-ID: <CAMuHMdVGE2_JZMy0MMt1FnwxqoxM92fFOrvCzMnfOOjWCVSZbg@mail.gmail.com>
Subject: Re: [PATCH 3/3] ravb: fix byte order for TX descriptor tag field
 lower bits
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        netdev <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Mon, Jul 16, 2018 at 10:22 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 07/16/2018 10:52 PM, Sergei Shtylyov wrote:
> >> The wrong helper is used to swap the bytes when adding the lower bits of
> >> the TX descriptors tag field in the shared ds_tagl variable. The
> >> variable contains the DS[11:0] field and then the TAG[3:0] bits.
> >>
> >> The mistake was highlighted by the sparse warning:
> >>
> >> ravb_main.c:1622:31:    left side has type restricted __le16
> >> ravb_main.c:1622:31:    right side has type unsigned short
> >> ravb_main.c:1622:31: warning: invalid assignment: |=
> >> ravb_main.c:1622:34: warning: cast to restricted __le16
> >
> >   Again, it's good that it's not a real bug! :-)
>
>    Wait! It seems to be, according to your subject. I hope you understand that

Niklas' patch fixes the sparse warning.

> cpu_to_le16() and le16_to_cpu() do the same thing?

While they do the same thing, they don't take the same parameter types,
nor return the same types.
E.g. cpu_to_le16() takes a u16 and returns an __le16, le16_to_cpu() takes
an __le16, and returns a u16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
