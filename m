Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:33503 "EHLO
	mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750762AbcEZHDe (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 26 May 2016 03:03:34 -0400
Received: by mail-io0-f195.google.com with SMTP id s67so979414ios.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 May 2016 00:03:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <edee7345-280a-0d7c-7e5a-798215fbd2b9@de.bosch.com>
References: <1464054880-25843-1-git-send-email-horms+renesas@verge.net.au>
	<1464054880-25843-2-git-send-email-horms+renesas@verge.net.au>
	<b30c9c84-23b6-b088-4983-b2498317492b@de.bosch.com>
	<20160525004825.GC7292@verge.net.au>
	<c0fd13d5-c5c4-579b-6fad-c637bda92398@de.bosch.com>
	<edee7345-280a-0d7c-7e5a-798215fbd2b9@de.bosch.com>
Date: Thu, 26 May 2016 09:03:33 +0200
Message-ID: <CAMuHMdXnN-GTN4crXeWRvtWT4E2kYFvMdPPcH8z+gJb-B4PbYA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] arm64: dts: r8a7796: Add Renesas R8A7796 SoC support
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Simon Horman <horms@verge.net.au>,
	linux-renesas-soc@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Dirk,

On Wed, May 25, 2016 at 9:32 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> P.S.: This also results in the question why we need similar
> r8a7795-cpg-mssr.h and r8a7796-cpg-mssr.h with just different "numbers" for
> the same clocks. Can't we use the same numbers on all SoCs, with just having
> wholes in the list where the clocks don't exist on a SoC? I haven't looked

The CPG and MSSR block are the IP blocks that differ most among SoCs of the
same family. Some clocks are present on H3 only, others on M3-W only.

Having a shared driver core, but different defines, is a compromise between
reusability and avoiding mistakes in DTSes (e.g. pointing to a nonexisting
clock due to copy and paste from another SoC).

> into the manual if these numbers are given by the hardware, though.

The actual numbers don't map to numbers in the datasheet, just to an unordered
list in a table. The list of number is considered part of the DT bindings, and
thus append-only (to be considered in case the datasheet is updated).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
