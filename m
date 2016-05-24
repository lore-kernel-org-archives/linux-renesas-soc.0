Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:34953 "EHLO
	mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751148AbcEXHzg (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 24 May 2016 03:55:36 -0400
MIME-Version: 1.0
In-Reply-To: <20160524003356.GB2477@verge.net.au>
References: <1463728214-13838-1-git-send-email-geert+renesas@glider.be>
	<1463728214-13838-12-git-send-email-geert+renesas@glider.be>
	<e0a1fbc1-ac95-2c79-65ed-d0328679bb8a@cogentembedded.com>
	<CAMuHMdXPhMToHhZggdKo=i65nS_mQT1o44YBd_Lz-B2Td3Jm9Q@mail.gmail.com>
	<20160524001309.GA2477@verge.net.au>
	<20160524003356.GB2477@verge.net.au>
Date: Tue, 24 May 2016 09:37:04 +0200
Message-ID: <CAMuHMdW8a3jOibXmMxv34RF+cZ7aE5x_fRzAQW4qVb_RB=6sCw@mail.gmail.com>
Subject: Re: [PATCH v2 11/23] ARM: dts: armadillo800eva: Fix W=1 dtc warnings
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Simon Horman <horms@verge.net.au>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Tue, May 24, 2016 at 2:33 AM, Simon Horman <horms@verge.net.au> wrote:
>> > >> --- a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
>> > >> +++ b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts

> I have queued this up with the above hunk changed to the following.
> Please check the resulting patch and let me know if I've messed things up
> somehow.
>
> @@ -127,7 +127,7 @@
>                 };
>         };
>
> -       i2c2: i2c@2 {
> +       i2c2: i2c-2 {

Thanks, looks fine.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
