Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:52809 "EHLO
	relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750857AbcHKCQm convert rfc822-to-8bit
	(ORCPT <rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 10 Aug 2016 22:16:42 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Simon Horman <horms@verge.net.au>
CC: "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 0/5] arm64: dts: r8a7795: Add HSUSB device node and
 enable channel 0 of USB2.0
Date: Thu, 11 Aug 2016 02:15:40 +0000
Message-ID: <HK2PR06MB0548D84529D548FF8DD7C6C2D81E0@HK2PR06MB0548.apcprd06.prod.outlook.com>
References: <1469098021-7692-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20160810084539.GD6276@verge.net.au>
In-Reply-To: <20160810084539.GD6276@verge.net.au>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon-san,

> From: Simon Horman [mailto:horms@verge.net.au]
> Sent: Wednesday, August 10, 2016 5:46 PM
> 
> Hi Shimoda-san,
> 
> On Thu, Jul 21, 2016 at 07:46:56PM +0900, Yoshihiro Shimoda wrote:
> > This patch is based on the renesas.git / renesas-devel-20160718-v4.7-rc7 tag.
> >
> > Changes from v2:
> >  - rebase on renesas.git / renesas-devel-20160718-v4.7-rc7.
> >   - maybe the panic issue disappears on the tree. but, if still happens,
> >     please try the following patch:
> >
> https://git.kernel.org/cgit/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=c14f8a4032efa73d9c4e155add47c19252
> b3bdf4
> >  - remove the redundant instruction in patch 4.
> >  - add a new patch that enables HSUSB driver as kernel module on the defconfig.
> 
> Sorry for not attending to this earlier.
> In your opinion are these patches ready to merge?

Yes. Since the following patch had been merged in v4.8-rc1, the panic issue disappears.

> https://git.kernel.org/cgit/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=c14f8a4032efa73d9c4e155add47c19252
> b3bdf4

Best regards,
Yoshihiro Shimoda
