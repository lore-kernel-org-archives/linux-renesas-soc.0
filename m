Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:30418 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751447AbdFFL2C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Jun 2017 07:28:02 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Felipe Balbi <balbi@kernel.org>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 0/5] usb: gadget: udc: renesas_usb3: add DMAC support
Date: Tue, 6 Jun 2017 11:27:58 +0000
Message-ID: <TY1PR06MB09928883A68D48D16971BDFED8CB0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1493207411-24416-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <TY1PR06MB09923F1ACA6B07A4D43ED674D8F90@TY1PR06MB0992.apcprd06.prod.outlook.com>
 <87fufivhx3.fsf@linux.intel.com>
 <TY1PR06MB0992A258F9BD28CED69B7618D8CB0@TY1PR06MB0992.apcprd06.prod.outlook.com>
 <87y3t5sbdz.fsf@linux.intel.com>
In-Reply-To: <87y3t5sbdz.fsf@linux.intel.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

> From: Felipe Balbi
> Sent: Tuesday, June 6, 2017 6:40 PM
>=20
> Hi,
>=20
> Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> writes:
> > Hi,
> >
> >> From: Felipe Balbi
> >> Sent: Friday, June 2, 2017 6:49 PM
> >>
> >> Hi,
> >>
> >> Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> writes:
> >> > Hi Felipe,
> >> >
> >> >> -----Original Message-----
> >> >> From: Yoshihiro Shimoda
> >> >> Sent: Wednesday, April 26, 2017 8:50 PM
> >> >>
> >> >> This patch set is based on the latest Feribe's usb.git / testing/ne=
xt branch
> >> >> (the commit id =3D 28ea6be01e2cf244c461a40c8e9593816f894412.)
> >> >
> >> > I'm afraid but, would you review this patch set?
> >> > This patch set can be applied on the today's testing/next branch.
> >>
> >> I was thinking that we need the fixes during the -rc cycle. No? In tha=
t
> >> case, we need to get rid of the dependencies between 1-4 and patch 5.
> >
> > Indeed.
> >
> >> patches 1-4 are in my testing/fixes now.
> >
> > Thank you!
> > I will resubmit the patch 5 later.
>=20
> Thanks a lot :-) If you can just rebase it on my testing/next, that'll
> help a lot already. We will have a couple conflicts when merging, but
> I'll make sure to solve them ;-)

I got it! I submitted v2 patch now :)

Best regards,
Yoshihiro Shimoda

> --
> balbi
