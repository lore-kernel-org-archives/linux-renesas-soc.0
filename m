Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:20160 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751686AbdHYFr2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Aug 2017 01:47:28 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Rob Herring <robh@kernel.org>,
        "vinod.koul@intel.com" <vinod.koul@intel.com>
CC: "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH] dmaengine: usb-dmac: Add soctype for R-Car M3-W
Date: Fri, 25 Aug 2017 05:47:22 +0000
Message-ID: <TY1PR06MB09923952ABA99387E9A27A8AD89B0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1501673614-6633-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20170810162538.j5whbtnucs3jkojh@rob-hp-laptop>
In-Reply-To: <20170810162538.j5whbtnucs3jkojh@rob-hp-laptop>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Rob,

> From: Rob Herring
> Sent: Friday, August 11, 2017 1:26 AM
>=20
> On Wed, Aug 02, 2017 at 08:33:34PM +0900, Yoshihiro Shimoda wrote:
> > This patch adds R-Car M3-W device tree bindings for usb-dmac driver.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt | 1 +
> >  1 file changed, 1 insertion(+)
>=20
> Acked-by: Rob Herring <robh@kernel.org>

Thank you for your Acked-by!

Hi, Vinod,

I checked your next branch today, but it doesn't have this patch.
So, would you apply this patch into your repo?

Best regards,
Yoshihiro Shimoda
