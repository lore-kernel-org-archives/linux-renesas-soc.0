Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:36457 "EHLO
	mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932452AbcEKNvF (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 11 May 2016 09:51:05 -0400
Received: by mail-io0-f193.google.com with SMTP id k129so5954666iof.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 May 2016 06:51:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <dbaad273-a2e9-6334-7446-9d350022b6db@de.bosch.com>
References: <1462944578-1220-1-git-send-email-dirk.behme@de.bosch.com>
	<1462944578-1220-10-git-send-email-dirk.behme@de.bosch.com>
	<CAMuHMdUnDP55KLwT2XgjjzH4mSRuKRNSNqUmvuvFPVHAOeuTJQ@mail.gmail.com>
	<dd14821f-9b1c-6ea9-06f8-bc6698f7cba7@de.bosch.com>
	<CAMuHMdXE1fQzv+CDfRb8Tb-kMushBKAQ+dC+zR-vXLF2FjxMmg@mail.gmail.com>
	<dbaad273-a2e9-6334-7446-9d350022b6db@de.bosch.com>
Date: Wed, 11 May 2016 15:51:03 +0200
Message-ID: <CAMuHMdVqHSQ0Wkj8rBO2N12yhxNjkcE+Sjx93WdU-tJS86zT5Q@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] ARM: dts: r8a779x: Add reset module support
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	linux-renesas-soc@vger.kernel.org,
	Dirk Behme <dirk.behme@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Dirk,

CC Laurent

On Wed, May 11, 2016 at 3:36 PM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> Just an understanding question:
>
> Why do you prefer the solution with the drivers/misc/boot-mode-reg/ solution
> done in this patch series over the solution you proposed in
>
> http://www.spinics.net/lists/linux-sh/msg44755.html
>
> and the reset of that series?

Do I? :-)

drivers/misc/boot-mode-reg/ will need agreement outside the linux-renesas-soc
community. My renesas,modemr proposal won't.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
