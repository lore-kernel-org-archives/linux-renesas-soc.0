Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f67.google.com ([209.85.213.67]:38463 "EHLO
        mail-vk0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751444AbeDRIzj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Apr 2018 04:55:39 -0400
Received: by mail-vk0-f67.google.com with SMTP id b16so577494vka.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Apr 2018 01:55:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <152404040278.7843.524678765267319751.sendpatchset@little-apple>
References: <152404037580.7843.5140455339218102749.sendpatchset@little-apple> <152404040278.7843.524678765267319751.sendpatchset@little-apple>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Apr 2018 10:55:38 +0200
Message-ID: <CAMuHMdXVz_CjdGtW4SYOUx7kMS-T1RadVzMQdqMktt2NXz6PnQ@mail.gmail.com>
Subject: Re: [PATCH 03/03] ARM: shmobile: stout: Initial support and regulator quirk
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On Wed, Apr 18, 2018 at 10:33 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> This is a back port to v4.16 of the following commits merged in v4.17-rc1:
> ff938cd14d67 ARM: shmobile: stout: enable R-Car Gen2 regulator quirk
> 92bcfdb334ca ARM: dts: stout: Initial r8a7790 Stout board support

I think you also want
60fc75bdf5b1b8ed ("ARM: shmobile: rcar-gen2: Fix error check in
regulator quirk")

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
