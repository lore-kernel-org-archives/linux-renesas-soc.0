Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ot0-f194.google.com ([74.125.82.194]:42493 "EHLO
        mail-ot0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752736AbeDPMUu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Apr 2018 08:20:50 -0400
Received: by mail-ot0-f194.google.com with SMTP id h55-v6so17074629ote.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Apr 2018 05:20:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1523541337-23919-1-git-send-email-geert+renesas@glider.be>
References: <1523541337-23919-1-git-send-email-geert+renesas@glider.be>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Apr 2018 13:20:29 +0100
Message-ID: <CAFEAcA-8yd9oKu1_FTxRHs1w_q7O5c1K7+n9s-BO3_WW8+Piog@mail.gmail.com>
Subject: Re: [PATCH qemu v3] device_tree: Increase FDT_MAX_SIZE to 1 MiB
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Alexander Graf <agraf@suse.de>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        qemu-stable <qemu-stable@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 12 April 2018 at 14:55, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> It is not uncommon for a contemporary FDT to be larger than 64 KiB,
> leading to failures loading the device tree from sysfs:
>
>     qemu-system-aarch64: qemu_fdt_setprop: Couldn't set ...: FDT_ERR_NOSPACE
>
> Hence increase the limit to 1 MiB, like on PPC.
>
> For reference, the largest arm64 DTB created from the Linux sources is
> ca. 75 KiB large (100 KiB when built with symbols/fixup support).
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
>   - Update example size figures,
>
> v2:
>   - Enlarge from 128 KiB to 1 MiB, as suggested by Peter Maydell.
> ---
>  device_tree.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks; applied to target-arm.next for 2.13. I'll add cc:qemu-stable too.

-- PMM
