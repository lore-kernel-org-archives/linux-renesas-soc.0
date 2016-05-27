Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:35431 "EHLO
	mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754447AbcE0Gjj (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 27 May 2016 02:39:39 -0400
Received: by mail-it0-f68.google.com with SMTP id z123so3739108itg.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 May 2016 23:39:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160527004256.GD14269@verge.net.au>
References: <1464054880-25843-1-git-send-email-horms+renesas@verge.net.au>
	<1464054880-25843-2-git-send-email-horms+renesas@verge.net.au>
	<b30c9c84-23b6-b088-4983-b2498317492b@de.bosch.com>
	<20160525004825.GC7292@verge.net.au>
	<c0fd13d5-c5c4-579b-6fad-c637bda92398@de.bosch.com>
	<20160526022833.GE18393@verge.net.au>
	<59e6225a-6dfa-8bde-dd2e-3428d6fedfe2@de.bosch.com>
	<20160527004256.GD14269@verge.net.au>
Date: Fri, 27 May 2016 08:39:38 +0200
Message-ID: <CAMuHMdVU+FNsQ7uLN82MiGEak5WYqd_ypJ=MLB8U419ZCiG6ow@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] arm64: dts: r8a7796: Add Renesas R8A7796 SoC support
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Simon Horman <horms@verge.net.au>
Cc: Dirk Behme <dirk.behme@de.bosch.com>,
	linux-renesas-soc@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, May 27, 2016 at 2:42 AM, Simon Horman <horms@verge.net.au> wrote:
>   Probably there are some central aspects of cpus that are shared
>   between the r8a7795 and r8a7796. And I think that your patch captures
>   that. But I also think that there will be non-shared aspects and
>   perhaps the complexity of splitting the cpus node between per-SoC
>   and common dtsi files isn't worth it.

R8a7795 and r8a7796 have different numbers of CPU cores, and different
maximum frequencies, thus needing different operating-point properties.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
