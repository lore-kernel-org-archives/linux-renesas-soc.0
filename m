Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36433 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750703AbcKYHxx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Nov 2016 02:53:53 -0500
Received: by mail-wm0-f67.google.com with SMTP id m203so6975897wma.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Nov 2016 23:53:53 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <HK2PR06MB05481690E2ECEFC707F38811D8890@HK2PR06MB0548.apcprd06.prod.outlook.com>
References: <1479830313-24241-1-git-send-email-geert+renesas@glider.be> <HK2PR06MB05481690E2ECEFC707F38811D8890@HK2PR06MB0548.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 25 Nov 2016 08:53:51 +0100
Message-ID: <CAMuHMdXpR++d4gM8DH7pwie+-Ksn_PizRE_QwGtavHmL=9G_2g@mail.gmail.com>
Subject: Re: renesas-drivers-2016-11-22-v4.9-rc6
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Shimoda-san,

On Fri, Nov 25, 2016 at 7:55 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>> As we're getting close to the opening of the merge window for v4.10, I
>> have also pushed renesas-drivers-next-2016-11-22-v4.9-rc6 to
>> https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git
>
> I don't know why, but I could not fetch this tag on my local repo.
> Morimoto-san is also the same. Do you know why?

The following works fine for me:

    git fetch git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
renesas-drivers-next-2016-11-22-v4.9-rc6

What are you using? It doesn't work with the https URL above, as that one
is meant for your web brouwer.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
