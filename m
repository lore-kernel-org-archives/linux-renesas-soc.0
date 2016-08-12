Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:34876 "EHLO
	mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752704AbcHLRI7 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 12 Aug 2016 13:08:59 -0400
Received: by mail-it0-f67.google.com with SMTP id f6so1273955ith.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Aug 2016 10:08:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1471020520-3077-1-git-send-email-wsa+renesas@sang-engineering.com>
References: <1471020520-3077-1-git-send-email-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Aug 2016 19:08:54 +0200
Message-ID: <CAMuHMdXcMCKSRore67fHL-a_MEWOokJ+d_VUqeW1W6gdkEi_0Q@mail.gmail.com>
Subject: Re: [RFC] ARM: shmobile: allow non-SMP builds again
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Aug 12, 2016 at 6:48 PM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> platform_can_secondary_boot() is only available for SMP, so guard the smp_init
> function with some ifdeffery to allow building without SMP.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> This is the easiest solution, but I wonder if it is the proper one? It might
> make sense to modify the Makefile so platsmp.o is in smp-y and not cpu-y? I may
> be missing here something, though.

Wasn't this fixed by

Commit:     869ec056fa8450184423c8076e0a342db127795c
Parent:     4d2bf027e8ca499a52224e508f52a59d3858094a
Refname:    refs/heads/master
Author:     Arnd Bergmann <arnd@arndb.de>
AuthorDate: Thu Jun 30 14:25:19 2016 +0200
Committer:  Olof Johansson <olof@lixom.net>
CommitDate: Tue Aug 2 12:34:49 2016 -0700

    ARM: shmobile: don't call platform_can_secondary_boot on UP

?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
