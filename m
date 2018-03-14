Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:63041 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751378AbeCNN06 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Mar 2018 09:26:58 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>
CC: Geert Uytterhoeven <geert+renesas@glider.be>,
        Russell King <linux@armlinux.org.uk>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "Ramesh Shanmugasundaram" <ramesh.shanmugasundaram@bp.renesas.com>
Subject: RE: [PATCH v7] ARM: shmobile: Add watchdog support
Date: Wed, 14 Mar 2018 13:26:52 +0000
Message-ID: <TY1PR01MB17703DB25224996C46BABD59C0D10@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <CAMuHMdVRxTCG0vCEEmhHm4XsZeJaPM1b_LOeZxqNdhRqsH0oZw@mail.gmail.com>
 <1521026033-8494-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <20180314124330.75xbinatpekhm576@verge.net.au>
In-Reply-To: <20180314124330.75xbinatpekhm576@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Simon,

> Subject: Re: [PATCH v7] ARM: shmobile: Add watchdog support
>
> On Wed, Mar 14, 2018 at 11:13:53AM +0000, Fabrizio Castro wrote:
> > On R-Car Gen2 and RZ/G1 platforms, we use the SBAR registers to make no=
n
> > boot CPUs run a routine designed to bring up SMP and deal with hot plug=
.
> > The value contained in the SBAR registers is not initialized by a WDT
> > triggered reset, which means that after a WDT triggered reset we jump
> > to the SMP bring up routine, preventing the system from executing the
> > bootrom code.
> >
> > The purpose of this patch is to jump to the bootrom code in case of a
> > WDT triggered reset, and keep the SMP functionality untouched.
> > In order to tell if the code had been called due to the WDT overflowing
> > we are testing WOVF from register RWTCSRA.
> >
> > The new function shmobile_boot_vector_gen2 isn't replacing
> > shmobile_boot_vector for backward compatibility reasons. The kernel
> > will install the best option (either shmobile_boot_vector or
> > shmobile_boot_vector_gen2) to ICRAM1 after parsing the device tree,
> > according to the amount of memory available.
> >
> > Since shmobile_boot_vector has become bigger, "reg" property of nodes
> > compatible with "renesas,smp-sram" now need to be set to a value
> > greater or equal to "<0 0x60>".
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.rene=
sas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v6->v7:
> > * restored ifdef within arch/arm/mach-shmobile/headsmp.S
>
> Thanks. I believe that this is the same as the hand modified
> version of v5 that I applied yesterday.

yes, I believe v5 modified and applied by you is the same as v7.
Thank you for taking the patch.

Fab



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
