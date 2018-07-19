Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f195.google.com ([209.85.217.195]:45620 "EHLO
        mail-ua0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726475AbeGSN1J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Jul 2018 09:27:09 -0400
Received: by mail-ua0-f195.google.com with SMTP id k8-v6so5066756uaq.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jul 2018 05:44:10 -0700 (PDT)
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Jul 2018 14:43:58 +0200
Message-ID: <CAMuHMdUENK1Zwgv2_2yiyp9wfqgwb=N5yCUZHp-uQ0NU9pX=wQ@mail.gmail.com>
Subject: CCREE performance on R-Car H3
To: Gilad Ben-Yossef <gilad@benyossef.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Gilad,

I've noticed CCREE is used with a LUKS-formatted disk, so I did some small
performance benchmarks.  The disk is an old 160 GiB SATA hard drive,
connected to either Salvator-XS (R-Car H3 ES2.0) or Koelsch (R-Car M2-W).

hdparm -t /dev/sda (unencrypted data): 62 MB/s (both systems)

hdparm -t /dev/dm-0 (encrypted data, LUKS AES):

    salvator-xs (CCREE): 15 MB/s
    salvator-xs (SW):    62 MB/s
    koelsch (SW):        47 MB/s

I'm a bit disappointment by the results when using crypto acceleration.
Apparently the in-kernel optimized arm64 implementation can decrypt at
raw read speed, while CCREE can't keep up.

Is this expected, and in line with your experiences?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
