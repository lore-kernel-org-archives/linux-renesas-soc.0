Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:15108 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732284AbeGKCOn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Jul 2018 22:14:43 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Vinod <vkoul@kernel.org>
CC: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 0/2] dma: sh: rcar-dmac: Add dma_pause operation
Date: Wed, 11 Jul 2018 02:12:45 +0000
Message-ID: <OSBPR01MB2293E3B96CC2350A5268A808D85A0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <1530523312-2253-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20180710152147.GD3219@vkoul-mobl>
In-Reply-To: <20180710152147.GD3219@vkoul-mobl>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Vinod,

> From: Vinod, Sent: Wednesday, July 11, 2018 12:22 AM
>=20
> On 02-07-18, 18:21, Yoshihiro Shimoda wrote:
> > This patch set is based on the lasest slave-dma / next branch.
> >
> > This issue can be reproduced by the following commands on r8a7795
> > Salvator-XS with the fixed patch [1] and Windows Teraterm :) :
> >  # stty 921600
> >  (Change Teraterm baud rate)
> >  # cat > rx.txt
> >  (Send 5MiB file by Teraterm.)
> >  # cmp <somewhere the 5MiB file> rx.txt
> >  output "differ: byte NNNNN, line MMM"
>=20
> This fails to apply for me. Please rebase. Also please fix the subsystem
> name

I'm sorry for the trouble. I submitted v2 patch.

Best regards,
Yoshihiro Shimoda
