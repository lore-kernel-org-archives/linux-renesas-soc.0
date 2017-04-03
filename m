Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:36476 "EHLO
        mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753161AbdDCMrb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Apr 2017 08:47:31 -0400
Received: by mail-lf0-f51.google.com with SMTP id x137so72653829lff.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Apr 2017 05:47:30 -0700 (PDT)
Subject: Re: [PATCH] can: rcar_can: Do not print virtual addresses
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>
References: <1491214286-14370-1-git-send-email-geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org, linux-can@vger.kernel.org,
        netdev@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <15811548-e041-8367-6706-3fd2abf5bbc6@cogentembedded.com>
Date: Mon, 3 Apr 2017 15:47:26 +0300
MIME-Version: 1.0
In-Reply-To: <1491214286-14370-1-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 04/03/2017 01:11 PM, Geert Uytterhoeven wrote:

> During probe, the rcar_can driver prints:
>
>     rcar_can e6e80000.can: device registered (regs @ e08bc000, IRQ76)
>
> The "regs" value is a virtual address, exposing internal information,
> hence stop printing it.  The (useful) physical address is already
> printed as part of the device name.
>
> Fixes: fd1159318e55e901 ("can: add Renesas R-Car CAN driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
[...]

Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
