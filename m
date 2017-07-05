Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:34437 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752480AbdGEJnr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jul 2017 05:43:47 -0400
Received: by mail-it0-f67.google.com with SMTP id o202so13559783itc.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Jul 2017 02:43:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1498576541-15384-1-git-send-email-kbingham@kernel.org>
References: <1498576541-15384-1-git-send-email-kbingham@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Jul 2017 11:43:45 +0200
Message-ID: <CAMuHMdWbxsj_=quOaZfEBfhN3geBhcYaOkBXUAeBazCM601uNA@mail.gmail.com>
Subject: Re: [PATCHv6] arm64: dts: renesas: salvator-x: Add ADV7482 support
To: Kieran Bingham <kbingham@kernel.org>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jun 27, 2017 at 5:15 PM, Kieran Bingham <kbingham@kernel.org> wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> The Salvator boards use an ADV7482 receiver for HDMI and CVBS inputs.
>
> Provide ADV7482 node on the i2c4 bus, along with connectors for the
> hdmi and cvbs inputs, and link to the csi20 and csi40 nodes as outputs.
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> ---
>
> Submitting this directly to Niklas, as these changes depend on his VIN
> DT patches, and has agreed to 'take' this patch on to that series.

Yeah, haven't seen any patches yet adding "csi20" and "csi40" nodes ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
