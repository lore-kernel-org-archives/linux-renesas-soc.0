Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:58758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750841AbcLEOTA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2016 09:19:00 -0500
MIME-Version: 1.0
In-Reply-To: <KL1PR06MB1031872E5DC2C65F2A490D6BC3890@KL1PR06MB1031.apcprd06.prod.outlook.com>
References: <KL1PR06MB1031872E5DC2C65F2A490D6BC3890@KL1PR06MB1031.apcprd06.prod.outlook.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 5 Dec 2016 08:18:34 -0600
Message-ID: <CAL_Jsq+-6v1z-MYHC8Lvvao+=SFhVn2XwBc3O6fSN_zNcrJ3kA@mail.gmail.com>
Subject: Re: [RFC] New Device Tree property - "bonding"
To: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Cc: "frowand.list@gmail.com" <frowand.list@gmail.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "pantelis.antoniou@konsulko.com" <pantelis.antoniou@konsulko.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "laurent.pinchart+renesas@ideasonboard.com"
        <laurent.pinchart+renesas@ideasonboard.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Nov 25, 2016 at 10:55 AM, Ramesh Shanmugasundaram
<ramesh.shanmugasundaram@bp.renesas.com> wrote:
> Hello DT maintainers,
>
> In one of the Renesas SoCs we have a device called DRIF (Digital Radio Interface) controller. A DRIF channel contains 4 external pins - SCK, SYNC, Data pins D0 & D1.
>
> Internally a DRIF channel is made up of two SPI slave devices (also called sub-channels here) that share common CLK & SYNC signals but have their own resource set. The DRIF channel can have either one of the sub-channel active at a time or both. When both sub-channels are active, they need to be managed together as one device as they share same CLK & SYNC. We plan to tie these two sub-channels together with a new property called "renesas,bonding".

Is there no need to describe the master device? No GPIOs, regulators
or other sideband controls needed? If that's never needed (which seems
doubtful), then I would do something different here probably with the
master device as a child of one DRIF and then phandles to master from
the other DRIFs. Otherwise, this looks fine to me.

Rob
