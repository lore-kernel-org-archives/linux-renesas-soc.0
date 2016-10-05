Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:35117 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751304AbcJENu0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Oct 2016 09:50:26 -0400
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
CC: Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.cz>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] sh-sci: add R8A7743/5 support
Date: Wed, 5 Oct 2016 13:50:18 +0000
Message-ID: <SG2PR06MB1165204F1566A4B3B920F05B8AC40@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <2017044.9fZNuWa2OZ@wasted.cogentembedded.com>
 <2254757.qf3e5qBuAz@avalon>
 <CAL_Jsq+p35REB_Lwm2vhGEKiTQHCawAXqYeJ1Yq5o3WEad9K8Q@mail.gmail.com>
 <7496008.sErWcihIz4@avalon>
In-Reply-To: <7496008.sErWcihIz4@avalon>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

> There are 34 compatible strings defined, one per UART + SoC combination,
> plus a set of more generic ones. So far, the driver handles the r7s72100
> compatible string separately as the UART on that chip is quite peculiar,
> but for all other SoCs we only need to match against

Just FYI...
There are 2 different types of UARTS (SCI) on r7s72100: SCIF and SCI

Getting  the "SCI" ones to work takes some 'tweaking' of some registers in =
the interrupt controller that are outside of the scope of the SCI driver. B=
asically, the power on reset values for some IRQ signaling is wrong but can=
 be adjusted with a register. At the moment, I've been fixing that in u-boo=
t.

So in reality, a "renesas,sci-r7s72100" is probably needed too if you want =
to throw that one on the pile....


Chris
