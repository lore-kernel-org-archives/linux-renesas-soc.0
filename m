Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f50.google.com ([209.85.214.50]:36317 "EHLO
	mail-it0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751490AbcFPGtF (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 16 Jun 2016 02:49:05 -0400
Received: by mail-it0-f50.google.com with SMTP id a5so127950222ita.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jun 2016 23:49:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87oa72kmf5.wl%kuninori.morimoto.gx@renesas.com>
References: <1465906188-20978-1-git-send-email-geert+renesas@glider.be> <87oa72kmf5.wl%kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Jun 2016 08:49:03 +0200
Message-ID: <CAMuHMdXmHKpNPgP=DgQD8RuDzrOEC1Cstz7gV+mgK4b9jxTyZQ@mail.gmail.com>
Subject: Re: renesas-drivers-2016-06-14-v4.7-rc2
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Thu, Jun 16, 2016 at 2:34 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>> I have pushed renesas-drivers-2016-06-14-v4.7-rc2 to
>> https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git
> (snip)
>> Today's version is based on renesas-devel-20160613-v4.7-rc3.
>
> It is based on -rc3 version.
> So correct renesas-drivers tag is -rc3 instead of -rc2 ;P

Oops, thanks for reporting!
I've pushed out the correct tag (renesas-drivers-2016-06-14-v4.7-rc3),
and deleted the wrong one.

Gr{oetje,eeting}s,

                        Geert

P.S. Root cause analysis: I was doing a bisection while making the release, and
     my script picked up the version number from the bisection instead of from
     the renesas-drivers branch. Script fixed.
--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
