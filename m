Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:56593 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751510AbdJTJdR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Oct 2017 05:33:17 -0400
Received: by mail-wr0-f196.google.com with SMTP id r79so10813096wrb.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Oct 2017 02:33:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171020092717.ejhavj72xgv3ybpn@verge.net.au>
References: <1508144925-14849-1-git-send-email-geert+renesas@glider.be> <20171020092717.ejhavj72xgv3ybpn@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Oct 2017 11:33:15 +0200
Message-ID: <CAMuHMdUE8qMXoUCCJ6dYk6Kycy3CQ_K5FWurC4BdAFJFe5qBUA@mail.gmail.com>
Subject: Re: [PATCH LOCAL v2] arm64: defconfig: Add renesas_defconfig
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Fri, Oct 20, 2017 at 11:27 AM, Simon Horman <horms@verge.net.au> wrote:
> On Mon, Oct 16, 2017 at 11:08:45AM +0200, Geert Uytterhoeven wrote:
>> Add a defconfig for Renesas R-Car Gen3 boards.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>> Against renesas-devel-20171013-v4.14-rc4.
>> Not intended for upstream merge.
>>
>> Loosely based on arm64 defconfig, with support for non-Renesas SoCs and
>> boards removed, and missing support added.
>>
>> Simon, if you include this in your tree, I can add to renesas-drivers
>> extra configuration for drivers that are in renesas-drivers, but not yet
>> upstream.
>>
>> People submitting topic branches for inclusion in renesas-drivers are
>> encouraged to update renesas_defconfig where appropriate.
>
> Thanks,
>
> I have created a topic/renesas-defconfig branch to hold this
> not-for-upstream config. I will include that in the devel branch
> of the renesas tree for now on.
>
> I do not plan to include it in the next branch at this time, as that branch
> is included in linux-next and is for code targeted at upstream.
>
> If you would like to refine the above then lets discuss.

Thank you, that matches what I had in mind.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
