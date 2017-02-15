Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:33190 "EHLO
        mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750791AbdBOJUI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Feb 2017 04:20:08 -0500
Received: by mail-lf0-f47.google.com with SMTP id x1so78093369lff.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Feb 2017 01:20:08 -0800 (PST)
Subject: Re: [PATCH] spi: rspi: Fixes bogus received byte and replaces "n" by
 "len" in commit 3be09be
To: DongCV <cv-dong@jinso.co.jp>, broonie@kernel.org,
        geert+renesas@glider.be, linux-spi@vger.kernel.org
References: <1487149964-10904-1-git-send-email-cv-dong@jinso.co.jp>
Cc: kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        ryusuke.sakato.bx@renesas.com, linux-renesas-soc@vger.kernel.org,
        nv-dung@jinso.co.jp, h-inayoshi@jinso.co.jp, cm-hiep@jinso.co.jp
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <aae1763a-8218-8760-f98b-1af0b87e5084@cogentembedded.com>
Date: Wed, 15 Feb 2017 12:20:06 +0300
MIME-Version: 1.0
In-Reply-To: <1487149964-10904-1-git-send-email-cv-dong@jinso.co.jp>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 2/15/2017 12:12 PM, DongCV wrote:

> In qspi_transfer_in(), when receiving the last n (or len) bytes of data,
> 1 bogus byte was written in the receive buffer.
> This code leads to a buffer overflow.
>
> "jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x03b40000: 0x1900 instead
>  jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x03b40004: 0x000c instead"
>
> The error message above happens when trying to mount, unmount, and remount a jffs2-formatted device.
> This patch removed the bogus write and for clearer to use, here replaced "n" by "len" in
> qspi_transfer_in() and qspi_transfer_out() to fixes: 3be09bec42a800d4
> "spi: rspi: supports 32bytes buffer for DUAL and QUAD"

    I think this is a material for a separate patch.

> Here is Geert's comments:
>
> "May I suggest the following:
>
>     spi: rspi: Fix bogus received byte in qspi_transfer_in()
>
>     When there are less than QSPI_BUFFER_SIZE remaining bytes to be received,
>     qspi_transfer_in() writes one bogus byte in the receive buffer, possibly
>     leading to a buffer overflow.
>
>     This can be reproduced by mounting, unmounting, and remounting a
>     jffs2-formatted device, causing lots of warnings like:
>
>         jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
> at 0x03b40000: 0x1900 instead
>
>     Remove the bogus write to fix this.
>
> It's also a good idea to add a Fixes tag:
>
>     Fixes: 3be09bec42a800d4 ("spi: rspi: supports 32bytes buffer for
> DUAL and QUAD")

    I don't see you adding this tag.

> (the code was moved afterwards, but both the origin and the move were
>  integrated in v4.10-rc1)."
>
> Signed-off-by: DongCV <cv-dong@jinso.co.jp>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
[...]

MBR, Sergei
