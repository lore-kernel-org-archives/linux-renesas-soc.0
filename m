Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:44009 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754217AbeASIVO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Jan 2018 03:21:14 -0500
Received: by mail-qt0-f195.google.com with SMTP id s3so1967506qtb.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jan 2018 00:21:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180118002433.GB11924@bigcity.dyn.berto.se>
References: <20180117161717.14589-1-horms+renesas@verge.net.au>
 <20180117161717.14589-3-horms+renesas@verge.net.au> <20180118002433.GB11924@bigcity.dyn.berto.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Jan 2018 09:21:13 +0100
Message-ID: <CAMuHMdUSfwiB7EUHxtt6VBvX1_KF82LPz9ihr0S_--eQs-v+sA@mail.gmail.com>
Subject: Re: [PATCH v2 02/16] ARM: dts: r8a7790: add soc node
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

On Thu, Jan 18, 2018 at 1:24 AM, Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
> On 2018-01-17 17:17:03 +0100, Simon Horman wrote:
>> Add soc node to represent the bus and move all nodes with a base address
>> into this node. This is consistent with handling of R-Car Gen3, RZ/G1, a=
nd
>> R-Car V2H (R8A77920) SoCs upstream. It is intended to migrate other R-Ca=
r
>> Gen2 SoCs to this scheme.
>>
>> The ordering is derived from simply moving each node with an address up =
to
>> before any nodes without a base address that occur before the soc node. =
 To
>> improve maintainability follow-up patches will sort subnodes of both the
>> new soc node and the root node.
>>
>> This patch should not introduce any functional change.
>>
>> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
>
> The 'ranges' property in the soc node is new. I checked the
> documentation and as far as I can make out this is how it should be. But
> I'm not certain why :-)

Please see section 2.3.8 in the Device Tree Specification, either from ePAP=
R,
or at https://www.devicetree.org/.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
