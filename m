Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:36168 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936998AbdAJMmB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Jan 2017 07:42:01 -0500
Received: by mail-io0-f196.google.com with SMTP id q20so11288077ioi.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jan 2017 04:42:00 -0800 (PST)
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Jan 2017 13:41:54 +0100
Message-ID: <CAMuHMdXJVRmOCMVmaS_O28c2x2YinqXCK1-Z3bNzRckWo7YJ3Q@mail.gmail.com>
Subject: DRM range manger test failures
To: Chris Wilson <chris@chris-wilson.co.uk>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris, Laurent,

On R-Car Gen2 (Koelsch) and Gen3 (Salvator-X), the new DRM range
manager selftests fail with:

    drm_mm: Testing DRM range manger (struct drm_mm), with
random_seed=0x83a9b910 max_iterations=8192 max_prime=128
    drm_mm: igt_sanitycheck - ok!
    drm_mm: node has wrong color, found 0, expected 1
    drm_mm: default insert failed, size 1 step 1

I have no idea what this means.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
