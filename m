Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ig0-f195.google.com ([209.85.213.195]:36296 "EHLO
	mail-ig0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751448AbcEXGfO (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 24 May 2016 02:35:14 -0400
Received: by mail-ig0-f195.google.com with SMTP id c3so1051478igl.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 May 2016 23:35:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5742B66C.7080102@rvc.renesas.com>
References: <1463966906-15129-1-git-send-email-horms+renesas@verge.net.au>
	<1463966906-15129-2-git-send-email-horms+renesas@verge.net.au>
	<CAMuHMdXsu=O13rLysob1Xp+5vWcp7gq6byCffR-6hGc+W-837A@mail.gmail.com>
	<5742B66C.7080102@rvc.renesas.com>
Date: Tue, 24 May 2016 08:35:13 +0200
Message-ID: <CAMuHMdV+atFKJjxcH7RkBCdabsBqk5Y3TTHCPN+sprDaM1xj_w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: r8a7796: Add Renesas R8A7796 SoC support
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
Cc: Simon Horman <horms+renesas@verge.net.au>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Toru Oishi <toru.oishi.zj@rvc.renesas.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Khiem,

On Mon, May 23, 2016 at 9:51 AM, Khiem Nguyen
<khiem.nguyen.xt@rvc.renesas.com> wrote:
> Using 1.0 will open Suspend-to-RAM support if secure firmware supports that
> feature.
> However, we might need additional work in drivers to support suspend/resume
> handlers.
> So, I suggest that we keep using 0.2 until Suspend-to-RAM feature is
> confirmed in r8a7795/r8a7796.

Note that we do have suspend/resume support on R-Car Gen2, albeit some
drivers may lack code to save/restore state when their devices are powered
down, as R-Car Gen2 doesn't have power domains for devices.

So I'd expect everything to work fine, as long as no R-Car Gen3-specific
drivers or devices residing in multimedia power domains are involved.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
