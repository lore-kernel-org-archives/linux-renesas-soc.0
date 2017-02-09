Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:56721 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752416AbdBINMj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Feb 2017 08:12:39 -0500
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 0/2] ARM: shmobile: Remove ARCH_SHMOBILE_MULTI
Date: Thu, 9 Feb 2017 13:12:24 +0000
Message-ID: <SG2PR06MB1165BBFDAA507BB95DF0A2808A450@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1486635529-6636-1-git-send-email-geert+renesas@glider.be>
 <20170209105546.GI16056@verge.net.au>
In-Reply-To: <20170209105546.GI16056@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon and Geert,

On Thursday, February 09, 2017, Simon Horman wrote:
> On Thu, Feb 09, 2017 at 11:18:47AM +0100, Geert Uytterhoeven wrote:
> > 	Hi Simon, Magnus,
> >
> > This patch series completes the migration from ARCH_SHMOBILE_MULTI to
> > ARCH_RENESAS, which was started by commit 9b5ba0df4ea4 ("ARM: shmobile:
> > Introduce ARCH_RENESAS").
> >
> > Thanks for applying!
>=20
> Thanks, nice to see this coming to an end.
>=20
> I have queued up patch 1/2 in the dt-for-v4.12 branch.
>=20
> I am of a mind to defer patch 2/2 because it looks like it should go in
> the soc-for-v4.12 branch and I'd rather not add a dependency on the dt-
> for-v4.12 branch for a cleanup.
>=20
> In a perfect world we could have one branch to rule them all; we do not
> live in that world.


Out of curiosity, when will arch/arm/mach-shmobile and arch/arm/configs/shm=
obile_defconfig be renamed (if ever)??


Chris
