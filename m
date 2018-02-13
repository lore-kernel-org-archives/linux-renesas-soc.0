Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ot0-f194.google.com ([74.125.82.194]:34433 "EHLO
        mail-ot0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965313AbeBMTp2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Feb 2018 14:45:28 -0500
Received: by mail-ot0-f194.google.com with SMTP id l10so18342993oth.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Feb 2018 11:45:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1518540077-14481-1-git-send-email-geert+renesas@glider.be>
References: <1518540077-14481-1-git-send-email-geert+renesas@glider.be>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Feb 2018 19:45:07 +0000
Message-ID: <CAFEAcA-8xMm8+ta_z-g2L9ynrSd+Bn_GUueV=4n6gb2nxpWc-g@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH] device_tree: Increase FDT_MAX_SIZE to 128 KiB
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Alexander Graf <agraf@suse.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 13 February 2018 at 16:41, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> It is not uncommon for a contemporary FDT to be larger than 64 KiB,
> leading to failures loading the device tree from sysfs:
>
>     qemu-system-aarch64: qemu_fdt_setprop: Couldn't set ...: FDT_ERR_NOSPACE
>
> For reference, the largest arm64 DTB created from the Linux sources is
> 70 KiB large (93 KiB when built with symbols/fixup support).

I think we should probably give ourselves a bit more headroom,
then -- at least 256K.

The ppc boards actually define their own version of this constant:

#define FDT_MAX_SIZE            0x00100000

so I think we might as well just go with that in device_tree.c for
consistency.

thanks
-- PMM
