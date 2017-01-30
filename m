Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:18919 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752513AbdA3H02 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jan 2017 02:26:28 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Robin Murphy <robin.murphy@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
CC: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH/RFC] iommu/dma: Per-domain flag to control size-alignment
Date: Mon, 30 Jan 2017 07:20:18 +0000
Message-ID: <HK2PR06MB05481A6F9E20CCAC13F9A336D84B0@HK2PR06MB0548.apcprd06.prod.outlook.com>
References: <148549826507.23190.1460689571069015835.sendpatchset@little-apple>
 <464656f9-970e-1271-0d9e-b62a0673e1dd@arm.com>
In-Reply-To: <464656f9-970e-1271-0d9e-b62a0673e1dd@arm.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Robin, Magnus,

> -----Original Message-----
> From: Robin Murphy
> Sent: Saturday, January 28, 2017 2:38 AM
>=20
> Hi Magnus,
>=20
> On 27/01/17 06:24, Magnus Damm wrote:
> > From: Magnus Damm <damm+renesas@opensource.se>
> >
> > Introduce the flag "no_size_align" to allow disabling size-alignment
> > on a per-domain basis. This follows the suggestion by the comment
> > in the code, however a per-device control may be preferred?
> >
> > Needed to make virtual space contiguous for certain devices.
>=20
> That sounds very suspicious - a single allocation is contiguous with
> itself by definition, and anyone relying on multiple allocations being
> contiguous with one another is doing it wrong, because there's no way we
> could ever guarantee that (with this allocator, at any rate). I'd be
> very reticent to touch this without a specific example of what problem
> it solves.

Thank you for the comment! This patch was from my request.
But, I completely misunderstood this "size-alignment" behavior.
And, my concern was already resolved by the following patch at last April:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/driv=
ers/iommu?id=3D809eac54cdd62c67afea1e17080e681dfa33dc09

So, no one needs this patch anymore.

Best regards,
Yoshihiro Shimoda
