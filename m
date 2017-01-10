Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:34755 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751653AbdAJJg4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Jan 2017 04:36:56 -0500
Received: by mail-io0-f194.google.com with SMTP id c80so9365888iod.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jan 2017 01:36:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAO3366yTp0NpXRCahyjbiVGT=aScUStcZ+PCskwgdmd_AKGb7Q@mail.gmail.com>
References: <1477491249-2976-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <20161031114625.GB1435@katana> <CAO3366yTp0NpXRCahyjbiVGT=aScUStcZ+PCskwgdmd_AKGb7Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Jan 2017 10:36:55 +0100
Message-ID: <CAMuHMdVgCiei1jm0Wi80eVN8W16rzyierL+M4EW_Yk18r_Q+Ew@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] r8a7796 I2C integration
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Wolfram Sang <wsa@the-dreams.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Uli,

On Thu, Nov 3, 2016 at 5:06 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> On Mon, Oct 31, 2016 at 12:46 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
>>
>>> This revision is based on renesas-devel-20161024-v4.9-rc2.  It adds the
>>> Reviewed-bys and the entries for SYS-DMAC2 in the applicable I2C nodes.  I
>>> have also made sure it works with 64-bit memory enabled.
>>
>> I'd like to test, but: can you tell me which branches are needed to test
>> DMA? Or is there a complete branch available somewhere? Or could you
>> update the branch of this feature which is pulled in by renesas-drivers?
>
> Thank you. Please check branch r8a7796-dmac-v2 at
> https://github.com/uli/kernel.git, that should contain everything you
> need.

Dropped from renesas-drivers, as this branch is based on a very old tree
(v4.9-rc2), and many (not all!) commits have found their way upstream.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
