Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:34492 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755528AbdCGPvn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Mar 2017 10:51:43 -0500
Received: by mail-io0-f196.google.com with SMTP id n76so921791ioe.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Mar 2017 07:51:42 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVVVAq43sDcOuHhtDrbJrSRLmk3oLHuqkASWHNi1kZ85A@mail.gmail.com>
References: <pull.ff94a00847faf7ed37768cea68c474926bfc8bd9.1486758696.git-series.kieran.bingham+renesas@ideasonboard.com>
 <CAMuHMdVVVAq43sDcOuHhtDrbJrSRLmk3oLHuqkASWHNi1kZ85A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Mar 2017 16:51:41 +0100
Message-ID: <CAMuHMdVF9G6_BhZ+GRVmiTHxWRo=VXi6fsCYL22NgzN-9r=zkQ@mail.gmail.com>
Subject: Re: [GIT PULL] v4l: vsp1: Partition phase developments
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Mon, Feb 13, 2017 at 11:03 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Fri, Feb 10, 2017 at 9:36 PM, Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com> wrote:
>> The following changes since commit 0c3b6ad6a559391f367879fd4be6d2d85625bd5a:
>>
>>   v4l: vsp1: Remove redundant context variables (Tue,  1 Nov 2016 15:01:02 +0000)
>>
>> are available in the git repository at:
>>
>>   https://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git refs/tags/vsp1/pa-phases-2017-02-10
>
> s/https/git/ is faster ;-)
>
>> for you to fetch changes up to 19c6a7d542809dc814b5dfb11ba8ab737eab56f9:
>>
>>   v4l: vsp1: Implement left edge partition algorithm overlap (Thu,  9 Feb 2017 22:08:34 +0000)
>>
>> This work further continues my developments on the partition algorithm
>> for the VSP UDS and SRU components.
>
> Thank you, scheduled for inclusion in next renesas-drivers release
> (probably renesas-drivers-2017-02-21-v4.10).

I've dropped this branch from today's renesas-drivers-2017-03-07-v4.11-rc1,
because it conflicted badly with Laurent's vsp1/histogram, and your branch
hadn't been updated in a while.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
