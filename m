Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:39938 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbeK2Xid (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Nov 2018 18:38:33 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Niklas =?ISO-8859-1?Q?S=F6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: Issue with enabling VSP source on rcar gen2 koelsch board
Date: Thu, 29 Nov 2018 14:33:46 +0200
Message-ID: <7621908.zZTqvTM8Fl@avalon>
In-Reply-To: <OSBPR01MB2103E4529DEDD7E5CA841AA2B8D20@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <OSBPR01MB2103C4452BD3C3E0803CA34FB8D10@OSBPR01MB2103.jpnprd01.prod.outlook.com> <2577289.0toRb0HB0W@avalon> <OSBPR01MB2103E4529DEDD7E5CA841AA2B8D20@OSBPR01MB2103.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Biju,

On Thursday, 29 November 2018 10:39:00 EET Biju Das wrote:
> > Subject: Re: Issue with enabling VSP source on rcar gen2 koelsch board
> > On Wednesday, 28 November 2018 15:20:58 EET Biju Das wrote:
> >> Hi all,
> >> 
> >> On the past, I have tested vsp source  on rcar gen2 koelsch board,
> >> using the patches series below(Apart from the below  patch series, I
> >> have enabled "CONFIG_DRM_RCAR_VSP=y")
> >> https://git.linuxtv.org/pinchartl/media.git/log/?h=drm/du/panels
> >> 
> >> 1) [HACK] ARM: shmobile: r8a7791: Link the VSP1 and DU
> >> 2) [HACK] v4l: vsp1: Disable UAPI for VSP1D
> >> 3) [HACK] drm: rcar-du: Enable VSP source support for R8A7791
> >> 
> >> But on the latest renesas-dev branch looks like  it is broken
> > 
> > That doesn't surprise me too much as I don't actively maintain that code.
> > 
> > For my information, what are your use cases ? Do you think this approach
> > should be pursued and patches merged upstream ? The amount of work will
> > be quite high though, given that it introduces a new userspace API, we
> > will have to publish an open-source implementation in an X.org or Wayland
> > driver.
> 
> Basically as part of RZ-G1/M VSP upstreaming(Linux 4.15 kernel)  ,previously
> I have  executed the below test cases
> 
> 1) vsp test suite:- based on the instruction present on
> "http://git.ideasonboard.com/renesas/vsp-tests.git"
> 
> 2) vspd testing:- based on the instruction present on 
> "https://git.linuxtv.org/pinchartl/media.git/log/?h=drm/du/panels"
> 
> Both the test cases were working fine with 4.15 kernel.
> 
> Now as part of RZ/G1N vsp upstreaming, I rebased to  latest branch from
> renesas-dev , and  executed the same test case
> 
> Only test cases in vsp test suite is working.  the vspd test case is broken.

Could you please post the tests output and log ?

> So I am wondering how do we expose the r-car gen2 SoC feature "VSPD"  to
> the end user?

Isn't the VSPD already exposed to the user as a V4L2 device on Gen2 ?

-- 
Regards,

Laurent Pinchart
