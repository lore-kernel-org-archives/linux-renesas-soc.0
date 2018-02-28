Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:43347 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751863AbeB1IR0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Feb 2018 03:17:26 -0500
Received: by mail-qt0-f194.google.com with SMTP id d26so1895156qtk.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Feb 2018 00:17:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1518719709-28940-2-git-send-email-kbingham@kernel.org>
References: <1518719709-28940-1-git-send-email-kbingham@kernel.org> <1518719709-28940-2-git-send-email-kbingham@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Feb 2018 09:17:25 +0100
Message-ID: <CAMuHMdXvymy7Yhhar=3gSEv58G3MSSq2CSFCd09v-YPASpbuYQ@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] d3/i2c-conflict/media
To: Kieran Bingham <kbingham@kernel.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Thu, Feb 15, 2018 at 7:35 PM, Kieran Bingham <kbingham@kernel.org> wrote:
> Please consider including this branch in renesas-drivers.
>
> --
> Regards
>
> Kieran
>
> The following changes since commit 29422737017b866d4a51014cc7522fa3a99e8852:
>
>   media: rc: get start time just before calling driver tx (2018-02-14 14:17:21 -0500)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git d3/i2c-conflict/media
>
> for you to fetch changes up to a22cefa41188bdda128b76d6a067e55b40ce5c22:
>
>   media: adv7604: Add support for i2c_new_secondary_device (2018-02-15 17:31:26 +0000)

Thank you, merges cleanly into today's linux-next.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
