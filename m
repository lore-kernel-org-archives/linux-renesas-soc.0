Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:33513 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752448AbeBZKSE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Feb 2018 05:18:04 -0500
Received: by mail-qk0-f194.google.com with SMTP id f25so18399607qkm.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Feb 2018 02:18:03 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdV3HLoRdW1WLk_s6V9bfG5T8Xq2GzOEpKGHY=3MbCeZVw@mail.gmail.com>
References: <1518696091-23561-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1518696091-23561-2-git-send-email-ulrich.hecht+renesas@gmail.com>
 <CAMuHMdXeLXTnUDwxjkGsaeiHvdTZdc-XzE2+2bgC394S6RyxdQ@mail.gmail.com>
 <CAO3366yvjPm+kqbG0Do6dE5H0_s98_hOzhj=aaVyJUsJCF18TA@mail.gmail.com> <CAMuHMdV3HLoRdW1WLk_s6V9bfG5T8Xq2GzOEpKGHY=3MbCeZVw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Feb 2018 11:18:03 +0100
Message-ID: <CAMuHMdXPxS7ok2fYqtqT_X=kBctPfZHbAqgFSc5eBbGyOJFH0w@mail.gmail.com>
Subject: Re: [PATCH 1/4] pinctrl: sh-pfc: r8a7796: Add VIN4, VIN5 pins, groups
 and functions
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kbingham@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Uli,

On Mon, Feb 26, 2018 at 10:21 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Mon, Feb 26, 2018 at 10:02 AM, Ulrich Hecht
> <ulrich.hecht+renesas@gmail.com> wrote:
>> On Tue, Feb 20, 2018 at 2:58 PM, Geert Uytterhoeven
>> <geert@linux-m68k.org> wrote:
>>> Would there be a use case for vin4_data4 and vin5_data4, or is that
>>> mode only supported on R-Car H2?
>>
>> The docs don't mention it, so I would assume it's not supported.
>
> Thank you, queuing (also for r8a7795 and r8a77995) in sh-pfc-for-v4.17.

Please send follow-up patches to reduce vin_data duplication.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
