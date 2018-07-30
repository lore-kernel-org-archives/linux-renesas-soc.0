Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:35946 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726651AbeG3RAX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jul 2018 13:00:23 -0400
Date: Mon, 30 Jul 2018 17:18:43 +0200 (CEST)
From: Ulrich Hecht <uli@fpond.eu>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Peter Maydell <peter.maydell@linaro.org>
Cc: Rob Landley <rob@landley.net>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        qemu-devel@nongnu.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org
Message-ID: <1115027626.150336.1532963923061@webmail.strato.com>
In-Reply-To: <20180730130234.30020-1-geert+renesas@glider.be>
References: <20180730130234.30020-1-geert+renesas@glider.be>
Subject: Re: [PATCH QEMU] hw/char/sh_serial: Add timeout handling to unbreak
 serial input
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


> On July 30, 2018 at 3:02 PM Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> 
> 
> As of commit 18e8cf159177100e ("serial: sh-sci: increase RX FIFO trigger
> defaults for (H)SCIF") in Linux v4.11-rc1, the serial console on the
> QEMU SH4 target is broken: it delays serial input until enough data has
> been received.
> 
> Since aformentioned commit, the Linux SCIF driver programs the Receive
> FIFO Data Count Trigger bits in the FIFO Control Register, to postpone
> generating a receive interrupt until:
>   1. At least the receive trigger count of bytes of data are available
>      in the receive FIFO, OR
>   2. No further data has been received for at least 15 etu after the
>      last received data.
> 
> While QEMU implements the former, it does not implement the latter.
> Hence the receive interrupt is not generated until the former condition
> is met.
> 
> Fix this by adding basic timeout handling.  As the QEMU SCIF emulation
> ignores any serial speed programming, the timeout value used conforms to
> a default speed of 9600 bps, which is fine for any interative console.
> 
> Reported-by: Rob Landley <rob@landley.net>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Works for me, kernel 4.18-rc7 for rts7751r2dplus.

Tested-by: Ulrich Hecht <uli@fpond.eu>

CU
Uli
