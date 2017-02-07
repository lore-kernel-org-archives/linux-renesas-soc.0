Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:59423 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751414AbdBGEWJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Feb 2017 23:22:09 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
        "vinod.koul@intel.com" <vinod.koul@intel.com>
CC: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        HIROYUKI YOKOYAMA <hiroyuki.yokoyama.vx@renesas.com>
Subject: RE: [PATCH] dmaengine: rcar: Fix release resources after interrupt
 process
Date: Tue, 7 Feb 2017 04:21:59 +0000
Message-ID: <HK2PR06MB054848A53B951196E76FD0C5D8430@HK2PR06MB0548.apcprd06.prod.outlook.com>
References: <1486384214-23580-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <761b3333-732d-9b5f-feb3-89768ac1c74c@metafoo.de>
In-Reply-To: <761b3333-732d-9b5f-feb3-89768ac1c74c@metafoo.de>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Lars,

> -----Original Message-----
> From: Lars-Peter Clausen [mailto:lars@metafoo.de]
> Sent: Monday, February 06, 2017 9:40 PM
>=20
> On 02/06/2017 01:30 PM, Yoshihiro Shimoda wrote:
> > From: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
> >
> > This patch fixes the problem that occasionally released resources
> > before the end of interrupt processing.
> >
> > [   58.156412] Unable to handle kernel NULL pointer dereference at virt=
ual
> >  address 00000000
> > [   58.166155] pgd =3D ffff8006f78b0000
> > [   58.169822] [00000000] *pgd=3D000000073773b003 , *pud=3D0000000737c7=
0003 ,
> >  *pmd=3D0000000000000000
> > [   58.179738]
> > [   58.181548] Internal error: Oops: 96000046 [#1] PREEMPT SMP
> > [   58.187484] Modules linked in:
> > [   58.190919] CPU: 0 PID: 2898 Comm: dma_ioctl Not tainted 4.9.0-00002=
-g501
> > 07f2-dirty #147
> > [   58.199438] Hardware name: Renesas Salvator-X board based on r8a7795=
 (DT)
> > [   58.206680] task: ffff8006f77b1900 task.stack: ffff8006f7bd4000
> > [   58.213090] PC is at rcar_dmac_chan_prep_sg+0xa4/0x3f0
> > [   58.218725] LR is at rcar_dmac_chan_prep_sg+0x6c/0x3f0
> >
> > Signed-off-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>=20
> How about implementing the synchronize() callback. This will fix not only
> this race condition, but also others that can result from the same issue.
> E.g. the completion callback still running after terminate() has complete=
d.

Thank you for the suggestion!
I will investigate how to implement device_snchronize() in this driver.

Best regards,
Yoshihiro Shimoda
