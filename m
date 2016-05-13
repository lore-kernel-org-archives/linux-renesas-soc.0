Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:34617 "EHLO
	mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751481AbcEMNhQ (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 13 May 2016 09:37:16 -0400
Received: by mail-io0-f196.google.com with SMTP id d62so3657470iof.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 May 2016 06:37:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160513123045.GA12309@katana>
References: <20160513123045.GA12309@katana>
Date: Fri, 13 May 2016 15:37:15 +0200
Message-ID: <CAMuHMdW13P=EbkukgNCt+OENqpH0LJY3L-F9N=y5zEhiyjhfpw@mail.gmail.com>
Subject: Re: [PULL REQUEST] renesas/topic/gen3-sdio for renesas-drivers
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Fri, May 13, 2016 at 2:30 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
> here is the SDIO topic branch for you. Please pull.
>
> Kind regards,
>
>    Wolfram
>
> The following changes since commit 7c5c9675da24be9e0a4313c50de69338cf8c7577:
>
>   Merge branch 'topic/salvator-x-hdmi-prototype-v1-rebased4' into renesas-drivers (2016-05-10 12:05:24 +0200)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/gen3-sdio

Thanks, pulled into topic/gen3-latest, and pushed out.

BTW, for renesas-drivers, please don't base pull requests on the previous
version, as that may cause massive conflicts when creating the next version
(many for-next trees may be rebased).

I'd rather merge your staging/ks7010 branch (which is based on non-changing
v4.6-rc7) and a branch containing the two mmc commits (based on a stable
commit, too, or Ulf's mmc/next if everything else fails).

> for you to fetch changes up to 78f877498f4f8d3bf9b78c84ffc87b5936fa4c47:
>
>   Merge branch 'staging/ks7010' into renesas/topic/gen3-sdio (2016-05-13 14:24:07 +0200)
>
> ----------------------------------------------------------------
> Wolfram Sang (32):
>       staging: ks7010: add driver from Nanonote extra-repository
>       staging: ks7010: remove non-SDIO code and #ifdefs
>       staging: ks7010: remove custom firmware loader
>       staging: ks7010: remove checks for WIRELESS_EXT version
>       staging: ks7010: remove code for old kernel versions
>       staging: ks7010: avoid workqueue races
>       staging: ks7010: use long preamble as default
>       staging: ks7010: use kernel helper to print buffer
>       staging: ks7010: delete seperate debug header
>       staging: ks7010: really iterate over multicast addresses
>       staging: ks7010: make loading config file optional
>       staging: ks7010: fix printk format warnings
>       staging: ks7010: add example cfg file as a reference
>       staging: ks7010: remove unecessary typedef
>       staging: ks7010: indent eap_packet.h
>       staging: ks7010: indent ks7010_config.c
>       staging: ks7010: indent ks7010_sdio.h
>       staging: ks7010: indent ks_hostif.c
>       staging: ks7010: indent ks_hostif.h
>       staging: ks7010: indent ks_wlan.h
>       staging: ks7010: indent ks_wlan_ioctl.h
>       staging: ks7010: indent ks_wlan_net.c
>       staging: ks7010: indent michael_mic.c
>       staging: ks7010: indent michael_mic.h
>       staging: ks7010: indent ks7010_sdio.c
>       staging: ks7010: remove supported card table with one element
>       mmc: sdio: fall back to SDIO 1.0 for broken 1.1 cards
>       mmc: sh_mobile_sdhi: enable SDIO IRQs for RCar Gen3
>       staging: ks7010: fix module annotations
>       staging: ks7010: rename README to TODO
>       staging: ks7010: adapt to new trans_start handling
>       Merge branch 'staging/ks7010' into renesas/topic/gen3-sdio

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
