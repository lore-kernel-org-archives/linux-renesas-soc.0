Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr1400109.outbound.protection.outlook.com ([40.107.140.109]:46272
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726551AbeK3UMJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Nov 2018 15:12:09 -0500
From: Biju Das <biju.das@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: Issue with enabling VSP source on rcar gen2 koelsch board
Date: Fri, 30 Nov 2018 09:03:15 +0000
Message-ID: <OSBPR01MB210341412363A0A0134A5B4AB8D30@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <OSBPR01MB2103C4452BD3C3E0803CA34FB8D10@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <2577289.0toRb0HB0W@avalon>
 <OSBPR01MB2103E4529DEDD7E5CA841AA2B8D20@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <7621908.zZTqvTM8Fl@avalon>
In-Reply-To: <7621908.zZTqvTM8Fl@avalon>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

Thanks for the feedback.

> Subject: Re: Issue with enabling VSP source on rcar gen2 koelsch board
>
> Hi Biju,
>
> On Thursday, 29 November 2018 10:39:00 EET Biju Das wrote:
> > > Subject: Re: Issue with enabling VSP source on rcar gen2 koelsch
> > > board On Wednesday, 28 November 2018 15:20:58 EET Biju Das wrote:
> > >> Hi all,
> > >>
> > >> On the past, I have tested vsp source  on rcar gen2 koelsch board,
> > >> using the patches series below(Apart from the below  patch series,
> > >> I have enabled "CONFIG_DRM_RCAR_VSP=3Dy")
> > >> https://git.linuxtv.org/pinchartl/media.git/log/?h=3Ddrm/du/panels
> > >>
> > >> 1) [HACK] ARM: shmobile: r8a7791: Link the VSP1 and DU
> > >> 2) [HACK] v4l: vsp1: Disable UAPI for VSP1D
> > >> 3) [HACK] drm: rcar-du: Enable VSP source support for R8A7791
> > >>
> > >> But on the latest renesas-dev branch looks like  it is broken
> > >
> > > That doesn't surprise me too much as I don't actively maintain that c=
ode.
> > >
> > > For my information, what are your use cases ? Do you think this
> > > approach should be pursued and patches merged upstream ? The
> amount
> > > of work will be quite high though, given that it introduces a new
> > > userspace API, we will have to publish an open-source implementation
> > > in an X.org or Wayland driver.
> >
> > Basically as part of RZ-G1/M VSP upstreaming(Linux 4.15 kernel)
> > ,previously I have  executed the below test cases
> >
> > 1) vsp test suite:- based on the instruction present on
> > "http://git.ideasonboard.com/renesas/vsp-tests.git"
> >
> > 2) vspd testing:- based on the instruction present on
> > "https://git.linuxtv.org/pinchartl/media.git/log/?h=3Ddrm/du/panels"
> >
> > Both the test cases were working fine with 4.15 kernel.
> >
> > Now as part of RZ/G1N vsp upstreaming, I rebased to  latest branch
> > from renesas-dev , and  executed the same test case
> >
> > Only test cases in vsp test suite is working.  the vspd test case is br=
oken.
>
> Could you please post the tests output and log ?

Sorry for the confusion, Basically I am trying to do vsp -->du rendering ba=
sed on the below patch

1) [HACK] ARM: shmobile: r8a7791: Link the VSP1 and DU
2) [HACK] v4l: vsp1: Disable UAPI for VSP1D
3) [HACK] drm: rcar-du: Enable VSP source support for R8A7791

You already mentioned that you are not maintaining this patches. It worked =
for me on Linux 4.15, where as it is broken with latest kernel.

> > So I am wondering how do we expose the r-car gen2 SoC feature "VSPD"
> > to the end user?
>
> Isn't the VSPD already exposed to the user as a V4L2 device on Gen2 ?

Yes, But I am trying to do vsp-->du rendering on r-car gen2/rz/g1 board  wi=
th the latest kernel.

Regards,
Biju




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
