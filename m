Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:11765 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750962AbdAZNH2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 08:07:28 -0500
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 2/2] clocksource: Add renesas-ostm timer driver
Date: Thu, 26 Jan 2017 13:07:22 +0000
Message-ID: <SG2PR06MB116512FB0BF7251CB5738DA58A770@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170126020707.4376-1-chris.brandt@renesas.com>
 <20170126020707.4376-3-chris.brandt@renesas.com> <20170126092446.GF2021@mai>
In-Reply-To: <20170126092446.GF2021@mai>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Daniel,

On Thursday, January 26, 2017, Daniel Lezcano wrote:
> > ---
> > v3:
> > * Added more details to commit log
> > * Kconfig: SYS_SUPPORTS_RENESAS_OSTM to just RENESAS_OSTM
> > * removed all MODULE code (this driver is builtin only)
> > * removed items from 'struct ostm_device'
> > * changed ioread8 to readb
>=20
> The iowrite* conversion is missing.
>=20
> s/iowrite8/writeb/
> s/iowrite32/writel/
>=20
> Other than that the driver looks good to me.

Ugh. I missed that.

Thanks!

Chris
