Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:36004 "EHLO
	mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751384AbcEJSk6 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 10 May 2016 14:40:58 -0400
MIME-Version: 1.0
In-Reply-To: <5731A229.7010307@ti.com>
References: <1457663298-31973-1-git-send-email-horms+renesas@verge.net.au>
	<5731A229.7010307@ti.com>
Date: Tue, 10 May 2016 20:40:57 +0200
Message-ID: <CAMuHMdWV+yNvhiN2dR=Fc7Lzh4DKLtsN4=bdC7dWHw06KSPtww@mail.gmail.com>
Subject: Re: [PATCH 0/2] fbdev: sh_mobile_meram: use ARCH_RENESAS
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Simon Horman <horms+renesas@verge.net.au>,
	Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Tomi,

On Tue, May 10, 2016 at 10:56 AM, Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
> On 11/03/16 04:28, Simon Horman wrote:
>> Use ARCH_RENESAS in place of ARCH_SHMOBILE.
>>
>> This is part of an ongoing process to migrate from ARCH_SHMOBILE to
>> ARCH_RENESAS the motivation for which being that RENESAS seems to be a more
>> appropriate name than SHMOBILE for the majority of Renesas ARM based SoCs.
>>
>> As a follow-up also depend on COMPILE_TEST to provided for increased
>> compile testing.
>>
>> Based on v4.5-rc1
>>
>> Simon Horman (2):
>>   fbdev: sh_mobile_meram: use ARCH_RENESAS
>>   fbdev: sh_mobile_meram: depend on COMPILE_TEST
>>
>>  drivers/video/fbdev/Kconfig | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> What was the conclusion in this thread? Should I apply these?

I think the conclusion was "changes requested".

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
