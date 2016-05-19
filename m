Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:34919 "EHLO
	mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755288AbcESQ6M (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 19 May 2016 12:58:12 -0400
Received: by mail-io0-f193.google.com with SMTP id i75so16599194ioa.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 May 2016 09:58:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1463629845-7115-3-git-send-email-horms+renesas@verge.net.au>
References: <1463629845-7115-1-git-send-email-horms+renesas@verge.net.au>
	<1463629845-7115-3-git-send-email-horms+renesas@verge.net.au>
Date: Thu, 19 May 2016 18:58:11 +0200
Message-ID: <CAMuHMdVTMvDsmO1g=FNwpkvx_56guHk_V6Katj8e3qOdyQsjeQ@mail.gmail.com>
Subject: Re: [PATCH/RFC 2/3] arm64: dts: salvator-x: add Salvator-X board on
 R8A7796 SoC
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, May 19, 2016 at 5:50 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
> @@ -0,0 +1,45 @@

> +       chosen {
> +               bootargs = "ignore_loglevel";

Perhaps you want this to be consistent with the other Renesas boards?

git grep bootargs -- $(git grep -l renesas, -- arch/arm*/*dts)

> +               stdout-path = "serial0:115200n8";
> +       };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
