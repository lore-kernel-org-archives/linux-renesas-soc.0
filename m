Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f173.google.com ([209.85.216.173]:45825 "EHLO
        mail-qt0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1031611AbeBNPmX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Feb 2018 10:42:23 -0500
Received: by mail-qt0-f173.google.com with SMTP id x27so8180092qtm.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Feb 2018 07:42:23 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXQkEG1nxWEqDrD0hr2K8sJdbmovswdOxgtiF1w=SbomA@mail.gmail.com>
References: <1518086057-19448-1-git-send-email-geert+renesas@glider.be> <CAMuHMdXQkEG1nxWEqDrD0hr2K8sJdbmovswdOxgtiF1w=SbomA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Feb 2018 16:42:21 +0100
Message-ID: <CAMuHMdUxLu519fEkX6SnbTeNbdNq7iAkyt5dN4VVC+dGYHGvTw@mail.gmail.com>
Subject: Re: [PATCH/RFC 00/11] ARM: dts: rcar-gen2: Enable watchdog support
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Feb 9, 2018 at 11:11 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Thu, Feb 8, 2018 at 11:34 AM, Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
>> This patch series enables the builtin watchdog timer on R-Car Gen2 SoCs
>> on all supported boards, and builds on top of Fabrizio's "[RFC v4 00/26]
>> Fix watchdog on Renesas R-Car Gen2 and RZ/G1".  It is marked RFC as it
>> is known not to work on all SoCs and SoC revisions.
>>
>> Based on my experiments, there are 3 success/failure modes:
>>
>>   1. It works!
>>
>>      This is the case on R-Car M2-N ES1.0 and E2 ES1.0 (tested on gose
>>      and alt).
>
> It also succeeds on R-Car M2-W ES3.0 (tested on porter).

I have received a success report for R-Car H2 ES2.0 on lager, too.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
