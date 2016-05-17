Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ig0-f194.google.com ([209.85.213.194]:34674 "EHLO
	mail-ig0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753242AbcEQKjd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 17 May 2016 06:39:33 -0400
Received: by mail-ig0-f194.google.com with SMTP id kj7so1220211igb.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 May 2016 03:39:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1463480881-2864-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
References: <1463480881-2864-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
Date: Tue, 17 May 2016 12:39:32 +0200
Message-ID: <CAMuHMdXXejH-_6ZcxyfmkA1yBtFc0NGyan8MCb-vomJ+zGhxag@mail.gmail.com>
Subject: Re: [PATCHv2] arm64: dts: r8a7795: enable DMA for I2C
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

On Tue, May 17, 2016 at 12:28 PM, Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add DMA properties to the I2C nodes.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
