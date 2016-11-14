Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:33333 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752929AbcKNNf2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2016 08:35:28 -0500
Received: by mail-it0-f65.google.com with SMTP id c20so11742269itb.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2016 05:35:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1479128837-30985-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1479128837-30985-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Nov 2016 14:35:26 +0100
Message-ID: <CAMuHMdWwEoH79DnVwret7bK9i-f-tXfSVMRSQdk=k-Ps5PUMGQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Salvator-X: Add GPIO keys support
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Mon, Nov 14, 2016 at 2:07 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> This simple series adds GPIO keys support to both the H3- and M3-W-based
> Salvator-X boards. Please see individual patches for details.

Thanks for your series!

The main reason I haven't sent out a similar series yet is because the GPIOs
used for the 3 push buttons are shared with the 3 user LEDs. For each of them,
you have to choose at DT time if you want to use them as buttons or as LEDs.

On ULCB, the same issue is present. For those, we settled on 1 key and 2
LEDs...

Looking forward to more comments...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
