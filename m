Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:36713 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752353AbcIBMuz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Sep 2016 08:50:55 -0400
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Simon Horman <horms@verge.net.au>
CC: Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 1/3] ARM: dts: r7s72100: add ethernet clock to device
 tree
Date: Fri, 2 Sep 2016 12:50:39 +0000
Message-ID: <SG2PR06MB116533792940F6E3193E7EDB8AE50@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20160901155430.23400-1-chris.brandt@renesas.com>
 <20160902014012.9383-1-chris.brandt@renesas.com>
 <20160902082604.GD16669@verge.net.au>
In-Reply-To: <20160902082604.GD16669@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 9/2/2016, Simon Horman wrote:
> For future submissions please consider:
> 1. Supplying a cover letter (git format-patch has a --cover-letter option=
)
>    for patch-sets comprising more than one patch. This allows you to desc=
ribe
>    an overview of what the series as a whole achieves. And is also
>    convenient for maintainers to reply to when accepting your patches.

OK. I can do that.


> 2. Starting a new thread for each new version of a patch/patch-set.

Does that mean to NOT use --in-reply-to=3D when submitting a v2,v3,etc... ?=
???



One more question:
Can I submit a patches series now that just adds all the MSTP clock nodes t=
hat I'll be working on for the next couple weeks? (USB, SDHI, MMC)
Or, do I have to wait till I have the drivers working?
Or, better yet, can I add all the MSTP clocks that will probably get used a=
t some point (basically, everything that we're using today in our 3.14 BSP)=
.

Chris
